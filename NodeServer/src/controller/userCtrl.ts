import { Request, Response } from "express";
import { AccountUpdateToken, checkJwt, createNewToken } from "../operations/Auth/manageJWT";
import {
    createUser as createUserDB,
    findUserByEmail,
    findUserById,
    findUserByNamePaging,
    updateUserImei as updateUserImeiDB,
    updateUserStatus as updateUserStatusDB,
} from "../operations/DB/user";
import { addassociatedUsers } from "../operations/DB/community";
import { MailResponse, sendUpdateAccountMail, sendVerificationMail } from "../operations/Util/mailOperations";
import { User } from "../types/types";
import { ObjectId } from "bson";

export interface AccessUserData {
    email: string;
    imei: string;
}

export const createUser = async (req: Request, res: Response) => {

    try {
        const user: User = req.body;
        if (user != undefined) {
            const createdUser = await createUserDB(user);
            if (!createdUser) {
                res.status(400).json({ message: "It's no possible create the user, data incomplete" });
                return;
            }
            // sent mail to user
            const sentMail = await sendVerificationMail(createdUser._id, createdUser.email);
            if (sentMail.accepted != createdUser.email) {
                res.status(400).json({ message: "It's not possible to send mail to user, check data is correct" });
                return;
            }
            // there should be a way to rollback the save or delete the created user if necessary
            res.status(202).json(createdUser);
        } else {
            res.status(400).json({ message: "It's no possible create the user, no data sent"});
            return;
        }
    } catch (error) {
        res.status(500).json(error);
        return;
    }

};

export const generateUserToken = async (req: Request, res: Response) => {

    const accessUserData: AccessUserData =  req.body;

    try {
        const user: User = await findUserByEmail (accessUserData.email);

        if (!user) {
            res.status(404).json({message: "User not found"});
            return;
        }

        if (user.imei != accessUserData.imei) {
            const sentMail = await sendUpdateAccountMail( user._id+"",accessUserData.imei,user.email);
            if (sentMail.accepted != user.email) {
                res.status(400).json({ message: "It's not possible to send mail to user, check data is correct" });
                return;
            }
            res.status(400).json({message: "This imei is not register"});
            return;
        }

        const token = createNewToken(user.name, user.badge);

        res.json({token});

    } catch (error) {
        res.status(500).json(error);
        return;
    }
};

export const activateUser = async (req: Request, res: Response) => {
    try {
        const request: any = req.params;
        const token: string = request.activateToken;
        const tokenData: any = checkJwt(token);
        const user: AccountUpdateToken = tokenData;
        if (token != undefined) {
            const updatedUser: User = await updateUserStatusDB(user.id, "A");
            await addassociatedUsers(updatedUser.community, 1);
            if (!updatedUser) {
                res.status(400).json({ message: "No user was updated"});
                return;
            }

            res.status(200).render("activationPage", { user: updatedUser.name });

        } else {
            res.status(400).json({ message: "No user id provided"});
            return;
        }

    } catch (error) {
        console.log(error);
        res.status(500).json(error);
        return;
    }
};


export const changeUserImei = async(req:Request,res:Response) => {
    try {
        const request: any = req.params;
        const token: string = request.updateToken;
        const tokenData:any = checkJwt(token);
        const user:AccountUpdateToken = tokenData;
        if (token != undefined) {
            const updatedUser = await updateUserImeiDB(user.id, user.imei);
            if (!updatedUser) {
                res.status(400).json({ message: "No user was updated"});
                return;
            }

            res.status(200).json(updatedUser);

        } else {
            res.status(400).json({ message: "No user id provided"});
            return;
        }

    } catch (error) {
        console.log(error);
        res.status(500).json(error);
        return;
    }
}


export const getUserbyMail = async(req:Request, res:Response) => {
    try {
        const request: any = req.params;
        const userMail : string = request.mail;
        if (userMail != undefined) {
            const user = await findUserByEmail(userMail);
            if (!user) {
                res.status(400).json({ message: "No user was found"});
                return;
            }
            res.status(200).json(user);
            return;
        } else {
            res.status(400).json({ message: "No user mail provided"});
            return;
        }
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
        return;
    }
};

export const sampleFunction = (_req: Request, res: Response) => {
    res.send("I'm here");
};

export const resendActivationMail = async (req: Request, res: Response) => {
    const userMail: string = req.body.mail;
    try {
        if (userMail !== undefined) {
            const user: User = await findUserByEmail(userMail);
            if (!user) {
                res.status(404).json({ message: "User not found" });
                return;
            }
            const sentMail: MailResponse = await sendVerificationMail(user._id + "", user.email);
            if (sentMail.accepted[0] !== user.email) {
                res.status(400).json({ message: "It's not possible to send mail to user, check data is correct" });
                return;
            }
            res.status(200).json(sentMail.accepted);
        }
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
        return;
    }
};

export const getUserbyName = async (req: Request, res: Response) => {
    try {
        const request: any = req.params;
        const query: any = req.query;
        let userName: string = query.user;
        const page: number = request.page;

        if ( !userName ) {
            userName = "";
        }

        if (page !== undefined) {
            const users = await findUserByNamePaging(userName, page);
            if (!users) {
                res.status(400).json({ message: "No user was found" });
                return;
            }
            res.status(200).json(users);
        } else {
            res.status(400).json({ message: "No user name or page provided" });
            return;
        }
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
        return;
    }
};

export const getUserById = async (req: Request, res: Response) => {
    try {
        const request: any = req.params;
        const id: string = request.id;
        if (id !== undefined) {
            const user = await findUserById(new ObjectId(id));
            if (!user) {
                res.status(404).json({ message: "No user was found" });
                return;
            }
            res.status(200).json(user);
            return;
        } else {
            res.status(400).json({ message: "No user id provided" });
            return;
        }
    } catch (error) {
        res.status(500).json(error);
        return;
    }
};
