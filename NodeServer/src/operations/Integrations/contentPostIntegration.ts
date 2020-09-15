import axios from "axios";
import { Community, ContentPost, User } from "../../types/types";
import { getReviewCountByStatus, updateReviewStatus } from "../DB/contentPost";
import { updatePointsApprovedToUser } from "../DB/user";
import { addpointsApproved } from "../DB/community";

const endpoint: string = "http://ec2-18-220-45-155.us-east-2.compute.amazonaws.com";

export const submitPost = async (community: Community, user: User, post: ContentPost): Promise<any> => {
    const body = {
        category_id: community.id,
        name: post.topic,
        alias: post.topic,
        description: post.description,
        url: post.filePath,
        lang: "es",
        author: user.name,
        group: community.name,
        year: (new Date()).getFullYear(),
        tags: post.topic,
        doc_type: post.postType
    };
    return axios.post(endpoint + "/api/document/", body);
};

export const updatePostStatus = async (post: ContentPost): Promise<any> => {
    const approvedReviews = await getReviewCountByStatus(post._id, "Approved");
    if ( approvedReviews[0].reviewsCount >= Number(process.env.REVIEWSTOAPPROVE)) {
        const body = {
            document_id : post.id,
            enabled : 1
        };
        await updateReviewStatus(post._id, false);
        await updatePointsApprovedToUser(post.user, 1);
        await addpointsApproved(post.community, 1);
        axios.put(endpoint + "/api/document/", body);
    }
};
