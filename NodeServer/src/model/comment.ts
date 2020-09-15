import { model, Schema } from "mongoose"

const commentSchema = new Schema({

    post: { type: Schema.Types.ObjectId, ref: "ContentPost", required: true },
    user: { type: Schema.Types.ObjectId, ref: "User", required: true },
    userName: { type: String, required: true },
    content: { type: String, required: true, maxlength: 256 },
    date: { type: Date, default: new Date() },

});

export const COMMENT = model("Comment", commentSchema);