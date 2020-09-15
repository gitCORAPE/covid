import { Router } from "express";
import { checkToken } from "../controller/middlewares/auth";
import {
        activateUser, changeUserImei, createUser,
        generateUserToken, getUserById, getUserbyMail,
        getUserbyName, resendActivationMail, sampleFunction
} from "../controller/userCtrl";

const apiUser: Router = Router();

apiUser.route("")
    .post(createUser);

apiUser.route("/tokens")
    .post(generateUserToken);

apiUser.route("/activate/:activateToken")
    .get(activateUser);

apiUser.route("/accountupdate/:updateToken")
    .get(changeUserImei);

apiUser.route("/:mail")
    .get(getUserbyMail);

apiUser.route("/id/:id")
    .get(getUserById);

apiUser.route("/activate/resend")
    .put(resendActivationMail);

apiUser.route("/page/:page")
    .get(getUserbyName);
// Example of use tokens.
apiUser.route("/test")
    .get(checkToken, sampleFunction);

export const userRoute = apiUser;
