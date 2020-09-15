import { ObjectId } from "bson";
import { COMMUNITY } from "../../model/community";

export const getCommunitiesByNationality = async (nationId: string): Promise<any> =>
                                                COMMUNITY.find({ nationality: new ObjectId(nationId) });

export const getCommunities = async (): Promise<any> => COMMUNITY.find().populate("nationality");

export const findCommunityById = async (id: ObjectId): Promise<any> =>
                                    COMMUNITY.findById(id)
                                    .populate("nationality");

export const findCommunityByNamePaging = async (filterText: string, page: number): Promise<any> =>
                                            COMMUNITY.find({
                                                name: new RegExp(".*" + filterText + ".*", "i")
                                            })
                                                .populate("nationality")
                                                .select("name numberPost pointPost nationality")
                                                .limit(10)
                                                .skip(10 * page)
                                                .sort("-name");

export const addassociatedUsers = async (name: string, value: number): Promise<any> =>
        COMMUNITY.findOneAndUpdate(
                {name},
                { $inc: { associatedUsers: value } }
        );

export const addnumberPost = async (id: ObjectId, value: number): Promise<any> =>
        COMMUNITY.findByIdAndUpdate(
                id,
                { $inc: { numberPost: value } }
        );

export const addpointsPost = async (id: ObjectId, value: number): Promise<any> =>
        COMMUNITY.findByIdAndUpdate(
                id,
                { $inc: { pointsPost: value } }
        );

export const addpointsApproved = async (id: ObjectId, value: number): Promise<any> =>
        COMMUNITY.findByIdAndUpdate(
                id,
                { $inc: { pointsApproved: value } }
        );
