import { NextFunction, Request, Response } from "express";

import { checkJwt } from "../../operations/Auth/manageJWT";



export const checkToken = (req: Request, res: Response, next: NextFunction) => {

    const token = req.headers.authorization;

    if (!token) {
        res.status(400).json({message: "Not Token"});
        return;
    }
    const resultVerification = checkJwt(token);

    if (resultVerification === "INVALID") {
        res.status(401).json({message: "Invalid Token"});
        return;
    }

    if (resultVerification === "EXPIRED") {
        res.status(403).json({message: "Expired Token"});
        return;
    }

    next();
};