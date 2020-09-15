import dotenv from "dotenv";
import * as jwt from "jsonwebtoken";
dotenv.config();

// The token is valid for 3 months.

export interface ResultVerifyToke {
    userName: string;
    badge: string;
}

export interface AccountUpdateToken {
    id: string;
    imei: string;
}

export const createUpdateToken = (id: string, imei: string): string =>
  jwt.sign({id, imei}, process.env.AUTH_KEY, {
        expiresIn: "2d"});

export const createNewToken = (userName: string, badge: string): string =>
        jwt.sign({ userName, badge}, process.env.AUTH_KEY, {
        expiresIn: "60d"});

export const checkJwt = (token: string ): ResultVerifyToke|AccountUpdateToken|"INVALID"|"EXPIRED" => {
        try {
        return jwt.verify(token, process.env.AUTH_KEY);
      } catch (error) {
        if ( error.message === "invalid signature" ) {
            return "INVALID";
        }

        if ( error.message === "jwt expired" ) {
            return "EXPIRED";
        }
        return error;
      }
};