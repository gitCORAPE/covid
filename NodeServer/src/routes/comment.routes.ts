import { Router } from "express";
import { listCommnetsByPostPaginated, postComment } from "../controller/commentCtrl";

const apiComment: Router = Router();

apiComment.route("")
    .post(postComment);

apiComment.route("/contentPost/:id/page/:page")
    .get(listCommnetsByPostPaginated);

export const commentRoute = apiComment;
