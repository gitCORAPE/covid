import { ObjectId } from "bson";
import { exec } from "child_process";
import { Request, Response } from "express";
import fs from "fs";
import { promisify } from "util";
import { findCommunityById, addnumberPost } from "../operations/DB/community";
import {
    addReview, createPost, findPostById,
    findPostByPath, getContentPostCollectionSize,
    getReviewCountByUser,
    searchContentPostPaged
} from "../operations/DB/contentPost";
import { addRegistry, getRegistryByUserAndPost, updateRegistryType } from "../operations/DB/likeRegistry";
import { findUserById } from "../operations/DB/user";
import { updatePostStatus } from "../operations/Integrations/contentPostIntegration";
import { updateBadgeCompaToComunicador, updateBadgeConocedorToCompa } from "../operations/Util/badgeOperations";
import { checkS3FileExistance, uploadFileToS3 } from "../operations/Util/fileOperations";
import { firstTimeLike, likeReestructure } from "../operations/Util/likeOperations";
import { ContentPost, reviewData } from "../types/types";
import { LikeRegistry } from "../types/types";


export const postPost = async (req: any, res: Response) => {
    try {

        const userId = await findUserById(req.fields.user);
        const communityId = await findCommunityById(req.fields.community);
        if (userId && communityId) {
            req.fields.community = new ObjectId(req.fields.community);
            req.fields.user = new ObjectId(req.fields.user);
            req.fields.location = JSON.parse(req.fields.location);
            req.fields.filePath = process.env.BUCKETLINK + req.fields.filePath;
            var createdPost: ContentPost = await findPostByPath(req.fields.filePath);
            console.log(createdPost);
            if (!createdPost) {
                const data: any = req.fields;
                const post: ContentPost = data;
                // send post to documentation center
                // const response = await submitPost(communityId, userId, post);
                post.id = "1234"; // response.data.document_id; // asign id from documentation center
                createdPost = await createPost(post);
                await addnumberPost(createdPost.community, 1);
            }

            if (createdPost.postType === "Image") {
                const imageLicenceWriter = promisify(exec);
                await imageLicenceWriter("license-image " +
                                                    "-path " + req.files.file.path + " " +
                                                    "-license Attribution " +
                                                    "-author \"" + userId.name + "\"");
            }
            const params = {
                Body: fs.readFileSync(req.files.file.path),
                Bucket: process.env.BUCKET,
                Key: req.fields.filePath,
                ACL: "public-read"
            };
            await uploadFileToS3(params);
            res.status(201).json(createdPost);
        } else {
            res.status(404).json({ message: "User/Community could not be found, post not submitted" });
            return;
        }
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: "Problem to create Post", error });
        return;
    }
};

export const checkPostFile = async (req: Request, res: Response) => {
    try {
        const request: any = req.params;
        const postFilePath: string = request.path;
        if (postFilePath != undefined) {
            const params = {
                Bucket: process.env.BUCKET,
                Key: postFilePath,
            };
            const fileData = await checkS3FileExistance(params);
            console.log(fileData);
            if (fileData.VersionId == undefined) {
                res.status(404).json({ message: "No file was found" });
                return;
            }
            res.status(200).json(fileData);
        } else {
            res.status(400).json({ message: "No path provided" });
            return;
        }
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
        return;
    }
};

export const getContentPosts = async (req: Request, res: Response) => {
    try {
        const request: any = req.params;
        const page: number = request.page;
        const query: any = req.query;
        if (page !== undefined) {
            const postsNumber = await getContentPostCollectionSize(query);
            const posts = await searchContentPostPaged(query, page);
            if (!posts) {
                res.status(404).json({ message: "No content was found" });
                return;
            }
            res.status(200).json({
                pageNumber: Math.ceil(page) + 1,
                totalPages: Math.ceil(postsNumber / 10),
                contentPosts: posts
            });
        } else {
            res.status(400).json({ message: "No page provided" });
            return;
        }
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
        return;
    }
};

export const getContentPostById = async (req: Request, res: Response) => {
    try {
        const request: any = req.params;
        const id: string = request.id;
        const user: string = request.user;
        if (id !== undefined) {
            const post = await findPostById(new ObjectId(id));
            const likeStatus = await getRegistryByUserAndPost(new ObjectId(user), new ObjectId(id));
            if (!post) {
                res.status(404).json({ message: "No content was found" });
                return;
            }
            if (likeStatus) {
                post._doc = { ...post._doc, likeStatus: likeStatus.type };
            } else {
                post._doc = { ...post._doc, likeStatus: "NONE" };
            }
            res.status(200).json(post);
        } else {
            res.status(400).json({ message: "No content post id provided" });
            return;
        }
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
        return;
    }
};

export const likeContentPostById = async (req: Request, res: Response) => {
    try {
        const like: LikeRegistry = req.body;
        if (like !== undefined) {
            const existingLike: LikeRegistry = await getRegistryByUserAndPost(like.user, like.contentPost);
            const contentPost: ContentPost = await findPostById(like.contentPost);
            // manage like registry
            if (contentPost) {
                if (existingLike) {
                    if (existingLike.type === like.type) {
                        res.status(400).json({ message: "User alredy gave " + like.type });
                        return;
                    } else {
                        await likeReestructure(like.type, existingLike.type, like.contentPost,
                                               contentPost.user, contentPost.community);
                        await updateRegistryType(existingLike._id, like.type);
                    }
                } else {
                    // update like counts in content post
                    await firstTimeLike(like.type, like.contentPost, contentPost.user, contentPost.community);
                    const createdLike = await addRegistry(like);
                    if (!createdLike) {
                        res.status(400).json({ message: "not possible to process like, data incomplete" });
                        return;
                    }
                }
                updateBadgeConocedorToCompa(contentPost.user);
                res.status(200).json({ message: "like processed" });
            } else {
                res.status(404).json({ message: "Content post doesnt exists" });
                return;
            }
        } else {
            res.status(400).json({ message: "No like description added" });
            return;
        }
    } catch (error) {
        res.status(500).json(error);
        return;
    }
};

export const addNewReview = async (req: Request, res: Response) => {

    try {
        const request: any = req.params;
        const id: string = request.id;
        const review: reviewData = req.body;
        if (review !== undefined) {
            const userReviews = await getReviewCountByUser(new ObjectId(id), new ObjectId(review.reviewer));
            if (userReviews[0].reviewsCount > 0) {
                res.status(400).json({ message: "User already made a review" });
                return;
            }
            const updatedPost = await addReview(new ObjectId(id), review);
            await updatePostStatus(updatedPost);
            updateBadgeCompaToComunicador(updatedPost.user);
            if (!updatedPost) {
                res.status(400).json({ message: "It's no possible create the review, data incomplete" });
                return;
            }
            res.status(201).json("ok");
        } else {
            res.status(400).json({ message: "It's not possible to add the review, no data sent" });
            return;
        }
    } catch (error) {
        res.status(500).json(error);
        return;
    }

};
