
import { User, ContentPost, Comment, reviewData } from "../src/types/types";
import { ObjectId } from "bson";

export const user: User = {
    email: "123@1.com",
    name: "USER TEST",
    gender: "O",
    profession: null,
    nationality: "TEST",
    community: "TEST",
    imei: "123DS",
    status: "I",
    badge: "CONOCEDOR",
    numberPost: null,
    pointsPost: null,
    pointsPostApproved: null,
    contents: null,
    isModerator: null
};

export const contentPost: ContentPost = {
    id: "1",
    topic: "TEST",
    description: "TEST",
    community: new ObjectId("5d6467998b162c31f8475a25"),
    user: new ObjectId("5d5f331e4bedae2a7c2fa1e8"),
    postType: "Video",
    location: {
        type: "Point",
        coordinates: [1231, 1231]
    },
    likes: null,
    dislikes: null,
    reviews: null,
    status: "Active",
    filePath: "1123.cv",
    inReview: true,
    date: new Date()
}

export const comment: Comment = {
    post: new ObjectId(),
    user: new ObjectId(),
    userName: "test usr",
    content: "TEST",
    date: null
}

export const review: reviewData = {
    reviewText: "TEXT",
    statusReviews: "Approved",
    reviewer: new ObjectId("5d5f331e4bedae2a7c2fa1e8")
}
