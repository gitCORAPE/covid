import bodyParser from "body-parser";
import express, { Application } from "express";
import mongoose from "mongoose";
import morgan from "morgan";
import R from "ramda";
import {setRoutes} from "./routes";

export const  setUpExpress = (app: Application) => {
    setUpMongo();
    setConfigurations(app);
    return app;
};

const setMiddlewares = (app: Application): Application => {
    app.use(bodyParser.urlencoded({ extended: false }));
    app.use(bodyParser.json());
    app.use(morgan("dev"));
    return app;
};

const setViewEngine = (app: Application): Application => {
    app.use(express.static(__dirname + "/public"));
    app.set('view engine','ejs');
    app.set("views",__dirname+"/views");
    return app;
};

const setConfigurations = R.pipe(setMiddlewares, setRoutes, setViewEngine );

const setUpMongo = (): void => {
    mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useFindAndModify: false });
    mongoose.set("useCreateIndex", true);
};
