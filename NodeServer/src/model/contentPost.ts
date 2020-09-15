import { model, Schema } from "mongoose";

const locationSchema = new Schema({
    type: { type: String, default: "Point" },
    coordinates: [{ type: Number }] // max 2
});

const reviewData = new Schema({
    reviewText: { type: String },
    statusReviews: { type: String, enum: ["Approved", "Declined"] },
    reviewer: { type: Schema.Types.ObjectId, ref: "User" }

});

const contentPostSchema = new Schema({

    id: { type: String, index: { unique: true }, required: true },
    filePath: { type: String, index: { unique: true }, required: true },
    topic: { type: String, required: true },
    description: { type: String, required: true },
    community: { type: Schema.Types.ObjectId, ref: "Community", required: true },
    user: { type: Schema.Types.ObjectId, ref: "User", required: true },
    postType: { type: String, enum: ["Video", "Audio", "Image"], required: true },
    location: { type: locationSchema, required: true },
    likes: { type: Number, default: 0 },
    dislikes: { type: Number, default: 0 },
    status: { type: String, enum: ["Active", "Inactive"], default: "Active" },
    reviews: [{ type: reviewData }],
    date: { type: Date, default: new Date() },
    inReview: { type: Boolean, default: true }
});

export const CONTENTPOST = model("ContentPost", contentPostSchema);
