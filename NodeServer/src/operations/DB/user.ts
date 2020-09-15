import { ObjectId } from "bson";
import { USER } from "../../model/user";
import { User } from "../../types/types";

export const createUser = async (user: User): Promise<any> => {
        const createdUser = new USER(user);
        const responseCreatedUser = await createdUser.save();
        return responseCreatedUser;
};

export const findUserById = async (id: ObjectId): Promise<any> =>
        USER.findById(id)
            .select("email name nationality community badge pointsPost pointsPostApproved isModerator status");

export const updateUserStatus = async (userId: string, status: string): Promise<any> =>
        USER.findByIdAndUpdate(userId, { status }, { new: true });

export const updateAddPostToUser = async (userId: string, postId: string): Promise<any> =>
        USER.findByIdAndUpdate(userId, { $push: { contents: new ObjectId(postId) } }, { new: true });

export const updateUserImei = async (userId: string, imei: string): Promise<any> =>
        USER.findByIdAndUpdate(userId, { imei }, { new: true });

export const updateUserBadge = async (userId: ObjectId, badge: string): Promise<any> =>
        USER.findByIdAndUpdate(userId, { badge }, { new: true });

export const findUserByIdAndImei = async (id: ObjectId, imei: string): Promise<any> =>
        USER.findOne({ _id: id, imei });

export const findUserByEmail = async (email: string): Promise<any> =>
        USER.findOne({ email });

export const findUserByNamePaging = async (filterText: string, page: number): Promise<any> =>
                                        USER.find({
                                                name: new RegExp(".*" + filterText + ".*", "ig")
                                        })
                                        .select("name email badge community pointPost")
                                        .limit( 10 )
                                        .skip(10 * page)
                                        .sort( "-name" );

export const updatePointsToUser = async (id: ObjectId, points: number): Promise<any> =>
                                        USER.findByIdAndUpdate(
                                                id,
                                                { $inc: {pointsPost: points  } }
                                        );

export const updatePointsApprovedToUser = async (id: ObjectId, points: number): Promise<any> =>
                                        USER.findByIdAndUpdate(
                                                id,
                                                { $inc: {pointsPostApproved: points  } }
                                        );
