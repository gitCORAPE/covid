import { ObjectId } from "bson";
import { addpointsPost } from "../DB/community";
import { addDislike, addLike } from "../DB/contentPost";
import { updatePointsToUser } from "../DB/user";

export const addLikePost = async (contentPost: ObjectId, user: ObjectId,
                                  community: ObjectId, value: number): Promise<any> => {
    await addLike(contentPost, value);
    await updatePointsToUser(user, value);
    await addpointsPost(community, value);
};

export const addDislikePost = async (contentPost: ObjectId, user: ObjectId,
                                     community: ObjectId, value: number): Promise<any> => {
    await addDislike(contentPost, value);
    await updatePointsToUser(user, -1 * value);
    await addpointsPost(community, -1 * value);
};

export const updateLikeStatus = async (contentPost: ObjectId, user: ObjectId,
                                       community: ObjectId, value: number): Promise<any> => {
    await addLike(contentPost, value);
    await addDislike(contentPost, -1 * value);
    await updatePointsToUser(user, value);
    await addpointsPost(community, value);
};

export const likeReestructure = async (newType: string, oldType: string, contentPost: ObjectId,
                                       user: ObjectId, community: ObjectId): Promise<any> => {
    if (newType === "NONE" && oldType === "LIKE") {
        await addLikePost(contentPost, user, community, -1);
    } else if (newType === "NONE" && oldType === "DISLIKE") {
        await addDislikePost(contentPost, user, community, -1);
    } else if (newType === "LIKE" && oldType === "DISLIKE") {
        await updateLikeStatus(contentPost, user, community, 1);
    } else if (newType === "DISLIKE" && oldType === "LIKE") {
        await updateLikeStatus(contentPost, user, community, -1);
    } else if (newType === "LIKE" && oldType === "NONE") {
        await addLikePost(contentPost, user, community, 1);
    } else if (newType === "DISLIKE" && oldType === "NONE") {
        await addDislikePost(contentPost, user, community, 1);
    }
};

export const firstTimeLike = async (newType: string, contentPost: ObjectId,
                                    user: ObjectId, community: ObjectId): Promise<any> => {
    if (newType === "LIKE") {
        await addLikePost(contentPost, user, community, 1);
    } else if (newType === "DISLIKE") {
        await addDislikePost(contentPost, user, community, 1);
    }
};
