import { Router } from "express";
import {
    getCommunities, getCommunitiesByNationality,
    getCommunityById, getCommunitybyName
} from "../controller/communityCtrl";

const apiCommunity: Router = Router();

apiCommunity.route("")
    .get(getCommunities);

apiCommunity.route("/:id")
    .get(getCommunityById);

apiCommunity.route("/nationality/:nationId")
    .get(getCommunitiesByNationality);

apiCommunity.route("/:name/page/:page")
    .get(getCommunitybyName);

export const communityRoute = apiCommunity;
