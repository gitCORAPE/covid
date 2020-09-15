import { ObjectId } from "bson";
import { Request, Response } from "express";
import { createComment, findCommentsByPost } from "../operations/DB/comment";
import { Comment } from "../types/types";

export const postComment = async (req: Request, res: Response) => {

    try {
        const data: any = req.body;
        const comment: Comment = data;
        const createdComment = await createComment(comment);
        res.status(201).json(createdComment);
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: "Problem while creating comment" });
        return;
    }
};

export const listCommnetsByPostPaginated = async (req: Request, res: Response) => {
    try {
        const request: any = req.params;
        const post: ObjectId = request.id;
        const page: number = request.page;
        if (page !== undefined) {
            const commnents = await findCommentsByPost(post, page);
            if (!commnents) {
                res.status(404).json({ message: "No comment were found" });
                return;
            }
            res.status(200).json(commnents);
        } else {
            res.status(400).json({ message: "No page provided" });
            return;
        }
    } catch (error) {
        res.status(500).json(error);
        return;
    }
};
