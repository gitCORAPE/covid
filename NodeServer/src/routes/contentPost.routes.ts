import { Router } from 'express';
import {
    postPost, checkPostFile, getContentPosts,
    getContentPostById, likeContentPostById,
    addNewReview
} from "../controller/contentPostCtrl";
import formidable from "express-formidable";
import { listCommnetsByPostPaginated } from "../controller/commentCtrl";

const apiContentPost: Router = Router();
const options = {
    maxFileSize: 25 * 1024 * 1024
};
const events = [
    {
        event: "error",
        action: function (_req, res, _next, _name, _file) {
            res.status(413).send({ message: "File size exceded" });
        }
    }
];

apiContentPost.route("")
    .post(formidable(options, events), postPost);

apiContentPost.route("/like")
    .put(likeContentPostById);

apiContentPost.route("/:id/currentUser/:user")
    .get(getContentPostById);

apiContentPost.route("/fileData/:path")
    .get(checkPostFile);

apiContentPost.route("/page/:page")
    .get(getContentPosts);

apiContentPost.route("/:id/comments/page/:page")
    .get(listCommnetsByPostPaginated);

apiContentPost.route("/:id/review")
    .put(addNewReview);

export const contentPostRoute = apiContentPost;
