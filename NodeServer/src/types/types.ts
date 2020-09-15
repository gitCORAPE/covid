import { ObjectId } from "bson";

interface CustomSchema {
    _id?: ObjectId;
    __v?: number;
}

export interface User extends CustomSchema {
    // basic information
    email: string;
    name: string;
    gender: "F" | "M" | "O";
    profession: string
    nationality: string;
    community: string;
    // account validation information
    imei: string;
    // account status/growth information
    status: "I" | "A" | "V";
    badge: "CONOCEDOR" | "COMPA" | "COMUNICADOR";
    numberPost: number;
    pointsPost: number;
    pointsPostApproved: number;
    contents: ObjectId[];
    isModerator: boolean;
}

export interface Nationality extends CustomSchema {
    id: string;
    name: string;
}

export interface Community extends CustomSchema {
    id: string;
    name: string;
    nationality: ObjectId;
    associatedUsers: number;
    numberPost: number;
    pointsPost: number;
    postsApproved: number;
}

export interface locationSchema {
    type: string;
    coordinates: number[];
}

export interface reviewData {
    reviewText: string;
    statusReviews: "Approved" | "Declined";
    reviewer: ObjectId;

};
export interface ContentPost extends CustomSchema {
    id: string;
    topic: string;
    description: string;
    community: ObjectId;
    user: ObjectId;
    postType: "Video" | "Audio" | "Image";
    location: locationSchema;
    likes: number;
    dislikes: number;
    reviews: reviewData[];
    status: "Active" | "Inactive";
    filePath: string;
    inReview: boolean;
    date: Date;
};

export interface LikeRegistry extends CustomSchema {
    user: ObjectId;
    contentPost: ObjectId;
    type: string;
};

export interface Comment extends CustomSchema {
    post: ObjectId;
    user: ObjectId;
    userName: string;
    content: string;
    date: Date;
}

export interface Query extends CustomSchema {
    user: ObjectId;
    community: ObjectId;
    inReview: boolean;
}
