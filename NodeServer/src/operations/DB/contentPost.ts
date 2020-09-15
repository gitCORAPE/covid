import { ObjectId } from "bson";
import { CONTENTPOST } from "../../model/contentPost";
import { ContentPost } from "../../types/types";
import { Query } from "../../types/types";
import { reviewData } from "../../types/types";

export const createPost = async (post: ContentPost): Promise<any> => {
        const createdPost = new CONTENTPOST(post);
        const responseCreatedPost = createdPost.save();
        return responseCreatedPost;
};

export const findPostById = async (id: ObjectId): Promise<any> =>
        CONTENTPOST.findById(id)
                .populate("community", "name")
                .populate("user", "name")
                .populate("reviews.reviewer", "name");

export const findPostByPath = async (path: string): Promise<any> =>
        CONTENTPOST.findOne({ filePath: path });

export const listContentPostPaged = async (page: number): Promise<any> =>
        CONTENTPOST.find()
                .populate("community", "name")
                .populate("user", "name")
                .select("topic user postType community date")
                .limit(10)
                .skip(10 * page)
                .sort("-date");

export const searchContentPostPaged = async (query: Query, page: number): Promise<any> =>
        CONTENTPOST.find(query)
                .populate("community", "name")
                .populate("user", "name")

                .select("topic user postType community date")
                .limit(10)
                .skip(10 * page)
                .sort("-date");

export const getContentPostCollectionSize = async (query: Query): Promise<any> =>
        CONTENTPOST.countDocuments(query);

export const addLike = async (id: ObjectId, value: number): Promise<any> =>
        CONTENTPOST.findByIdAndUpdate(
                id,
                { $inc: { likes: value } }
        );

export const addDislike = async (id: ObjectId, value: number): Promise<any> =>
        CONTENTPOST.findByIdAndUpdate(
                id,
                { $inc: { dislikes: value } }
        );

export const addReview = async (id: ObjectId, review: reviewData): Promise<any> =>
        CONTENTPOST.findByIdAndUpdate(id, { $push: { reviews: review } }, { new: true });

export const getReviewCountByStatus = async (id: ObjectId, reviewStatus: string): Promise<any> =>
        CONTENTPOST.aggregate([
                { "$match": { "_id": id } },
                {
                        "$project": {
                                "reviewsCount": {
                                        "$size": {
                                                "$filter": {
                                                        "input": "$reviews",
                                                        "as": "item",
                                                        "cond": { "$eq": ["$$item.statusReviews", reviewStatus] }
                                                }
                                        }
                                }
                        }
                }
        ]);

export const getReviewCountByUser = async (id: ObjectId, user: ObjectId): Promise<any> =>
        CONTENTPOST.aggregate([
                { "$match": { "_id": id } },
                {
                        "$project": {
                                "reviewsCount": {
                                        "$size": {
                                                "$filter": {
                                                        "input": "$reviews",
                                                        "as": "item",
                                                        "cond": { "$eq": ["$$item.reviewer", user] }
                                                }
                                        }
                                }
                        }
                }
        ]);

export const updateReviewStatus = async (id: ObjectId, inReview: boolean): Promise<any> =>
        CONTENTPOST.findByIdAndUpdate(id, { inReview });
