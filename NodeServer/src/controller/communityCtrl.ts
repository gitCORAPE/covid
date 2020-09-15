import {ObjectId} from "bson";
import { Request, Response } from "express";
import {
    findCommunityById,
    findCommunityByNamePaging,
    getCommunities as getCommunitiesDB,
    getCommunitiesByNationality as getCommunitiesByNationalityDB
} from "../operations/DB/community";

export const getCommunitiesByNationality = async (req: Request, res: Response) => {
    try {
        const request: any = req.params;
        const nationId: string = request.nationId;
        if (nationId != undefined) {
            const communities = await getCommunitiesByNationalityDB(nationId);
            if (!communities[0]) {
                res.status(400).json({ message: "No communities were found" });
                return;
            }
            res.status(200).json(communities);
        } else {
            res.status(400).json({ message: "No nationality provided" });
            return;
        }
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
        return;
    }
};

export const getCommunities = async (_req: Request, res: Response) => {
    try {
        const communities = await getCommunitiesDB();
        if (!communities[0]) {
            res.status(400).json({ message: "No communities were found" });
            return;
        }
        res.status(200).json(communities);
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
        return;
    }
};

export const getCommunitybyName = async (req: Request, res: Response) => {
    try {
        const request: any = req.params;
        const communityName: string = request.name;
        const page: number = request.page;
        if (communityName !== undefined || page !== undefined) {
            const communities = await findCommunityByNamePaging(communityName, page);
            if (!communities) {
                res.status(404).json({ message: "No community was found" });
                return;
            }
            res.status(200).json(communities);
        } else {
            res.status(400).json({ message: "No community name or page provided" });
            return;
        }
    } catch (error) {
        res.status(500).json(error);
        return;
    }
};

export const getCommunityById = async (req: Request, res: Response) => {
    try {
        const request: any = req.params;
        const id: string = request.id;
        if (id !== undefined) {
            const community = await findCommunityById(new ObjectId(id));
            if (!community) {
                res.status(404).json({ message: "No community was found" });
                return;
            }
            res.status(200).json(community);
        } else {
            res.status(400).json({ message: "No community id provided" });
            return;
        }
    } catch (error) {
        res.status(500).json(error);
        return;
    }
};
