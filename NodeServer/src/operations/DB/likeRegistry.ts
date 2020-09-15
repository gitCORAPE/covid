import { ObjectId } from "bson";
import { LIKEREGISTRY } from "../../model/likeRegistry";
import { LikeRegistry } from "../../types/types";

export const getRegistryByUserAndPost = async (user: ObjectId, contentPost: ObjectId): Promise<any> =>
    LIKEREGISTRY.findOne({ user, contentPost });

export const updateRegistryType = async (id: ObjectId , type: string): Promise<any> =>
    LIKEREGISTRY.findByIdAndUpdate(id, { type }, { new: true });

export const addRegistry = async (like: LikeRegistry): Promise<any> => {
    const createdLike = new LIKEREGISTRY(like);
    const responseCreatedLike = createdLike.save();
    return responseCreatedLike;
};
