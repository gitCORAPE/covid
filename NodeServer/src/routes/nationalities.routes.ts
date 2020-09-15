import { Router } from 'express';
import { getNationalites } from "../controller/nationCtrl";


const apiNation : Router = Router();

apiNation.route('')
    .get(getNationalites);

export const nationRoute = apiNation;