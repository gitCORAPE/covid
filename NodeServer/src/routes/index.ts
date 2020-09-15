import { Application } from "express";
import { userRoute } from "./user.routes";
import { communityRoute } from "./communities.routes";
import { nationRoute } from "./nationalities.routes";
import { contentPostRoute } from "./contentPost.routes";
import { commentRoute } from "./comment.routes";

export const setRoutes = (app: Application): Application => {
    app.use('/users', userRoute);
    app.use('/nationalities', nationRoute);
    app.use('/communities', communityRoute);
    app.use('/contentPosts', contentPostRoute);
    app.use('/comments', commentRoute);
    return app;
};
