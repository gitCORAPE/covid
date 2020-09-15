import { Request, Response } from "express";
import {
    getNationalities as getNationalitiesDB
} from "../operations/DB/nationality";

export const getNationalites = async (_req: Request, res: Response) => {
    try {

        const nationalities = await getNationalitiesDB();
        if (!nationalities[0]) {
            res.status(404).json({ message: "No nationalities were found" });
            return;
        }
        res.status(200).json(nationalities);
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
        return;
    }
};