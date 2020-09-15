import { ObjectId } from "bson";
import { COMMENT } from "../../model/comment";
import { Comment } from "../../types/types";


export const createComment = async (comment: Comment): Promise<any> => {
    const createdComment = new COMMENT(comment);
    const responseCreatedComment = createdComment.save();
    return responseCreatedComment;
}

export const findCommentsByPost = async (post: ObjectId , page: number): Promise<any> =>
    COMMENT.find({ post })
            .limit( 10 )
            .skip(10 * page)
            .sort( "-date" );
