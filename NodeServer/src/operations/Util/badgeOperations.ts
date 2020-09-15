import { ObjectId } from "bson";
import { User } from "../../types/types"
import {  findUserById, updateUserBadge } from "../DB/user";

export const updateBadgeConocedorToCompa = async (userId: ObjectId): Promise<any> => {
    const user: User = await findUserById(userId);
    if (user.badge === "CONOCEDOR") {
        if (user.pointsPost >= Number(process.env.POINTSTOCOMPA)) {
            await updateUserBadge(userId, "COMPA");
        }
    }
};

export const updateBadgeCompaToComunicador = async (userId: ObjectId): Promise<any> => {
    const user: User = await findUserById(userId);
    if (user.badge === "COMPA") {
        if (user.pointsPostApproved >= Number(process.env.POINTSTOCOMUNICADOR)) {
            await updateUserBadge(userId, "COMUNICADOR");
        }
    }
};
