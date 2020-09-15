import { createComment } from "../../../src/operations/DB/comment";
import mongoose from "mongoose";
import dotenv from "dotenv";
import { ObjectId } from "bson";
import {Comment} from "../../../src/types/types";
dotenv.config();

const assert = require("chai").assert;
const expect = require('chai').expect;

// Example of unit test using BDD.
// Reference https://martinfowler.com/bliki/GivenWhenThen.html

describe("Comment Tests", () => { // Contex
    before(function (done) {
        mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true });
        const db = mongoose.connection;
        db.on('error', console.error.bind(console, 'connection error'));
        db.once('open', function () {
            console.log('We are connected to test database!');
            done();
        });
    });

    describe("When the comment created has data: ", () => { // Scenary
        const comment: Comment = {
            post: new ObjectId("5d756f2bfb72cc2234e8ad71"),
            user: new ObjectId("5d5f331e4bedae2a7c2fa1e8"),
            userName: "TEST USER",
            content: "Hola Mundo",
            date: new Date()
        };
        it("result should be the same comment created with all defaults values defined ", (done) => { // Result
            createComment(comment).then((data) => {
                assert.equal(data.post, comment.post);
                assert.equal(data.user, comment.user);
                assert.equal(data.userName, comment.userName);
                assert.equal(data.content, comment.content);
                expect(data).to.have.property("_id");
                done();
            }).catch(done);

        });
    });

    after(function (done) {
        mongoose.connection.close();
        done();
    });
});