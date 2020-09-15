import { model, Schema } from "mongoose";

const likeRegistrySchema = new Schema({
    user: { type: Schema.Types.ObjectId, ref: "User"},
    contentPost: { type: Schema.Types.ObjectId, ref: "ContentPost" },
    type: { type: String, enum: ["LIKE", "DISLIKE", "NONE"]}
});

export const LIKEREGISTRY = model("LikeRegistry", likeRegistrySchema);
