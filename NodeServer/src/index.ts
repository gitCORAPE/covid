import dotenv from "dotenv";
import express from "express";
import {setUpExpress} from './app';
dotenv.config();

export const app: express.Express = express();

app.listen(process.env.PORT, () => {
    console.log(`Running in the port: ${process.env.PORT}`);
});

setUpExpress(app);