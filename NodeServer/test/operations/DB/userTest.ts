import {
    createUser as createUserDB,
    updateUserStatus as activateUserDB,
    updateUserImei as updateUserImeiDB,
    updateAddPostToUser,
    findUserByNamePaging,
    updatePointsToUser,
    updateUserBadge,
    findUserById,
    updatePointsApprovedToUser
} from "../../../src/operations/DB/user";

import { user } from "../../utilS";
import mongoose from "mongoose";
import dotenv from "dotenv";
import {ObjectId} from "bson";
dotenv.config();

const assert = require("chai").assert;
const expect = require('chai').expect;

// Example of unit test using BDD.
// Reference https://martinfowler.com/bliki/GivenWhenThen.html

describe("User Tests", () => { // Contex
    before(function (done) {
        mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true });
        const db = mongoose.connection;
        db.on('error', console.error.bind(console, 'connection error'));
        db.once('open', function () {
            console.log('We are connected to test database!');
            done();
        });
    });
    describe("When the user created has data: ", () => { // Scenary
        it("result should be the same user created with all defaults values defined ", (done) => { // Result
            createUserDB(user).then((data) => {
                assert.equal(data._doc.email, user.email);
                done();
            }).catch(done);

        });
    });
    describe("When the user need to be activated with its Id: ", () => { // Scenary
        it("result should be the user set to an activated state ", (done) => { // Result
            activateUserDB("5d5f331e4bedae2a7c2fa1e8", "A").then((data) => {
                assert.equal(data._doc.status, "A");
                done();
            }).catch(done);

        });
    });

    describe("When a user creates a post and the post is asigned to the user: ", () => { // Scenary
        it("result should be the user with a new post", (done) => { // Result
            updateAddPostToUser("5d5f331e4bedae2a7c2fa1e8", "5d719bba6bc5c43f14a8fae5").then((data) => {
                assert.equal(data._doc.contents.length, 1);
                done();
            }).catch(done);

        });
    });

    describe("When a user has new badge ", () => { // Scenary
        it("result should be the user with a new badge", (done) => { // Result
            updateUserBadge(new ObjectId("5d5f331e4bedae2a7c2fa1e8"), "COMPA").then((data) => {
                assert.equal(data._doc.badge, "COMPA");
                done();
            }).catch(done);

        });
    });

    describe("When the user need to be change its imei: ", () => { // Scenary
        it("result should be the user set to a new imei", (done) => { // Result
            updateUserImeiDB("5d5f331e4bedae2a7c2fa1e8", "12345678").then((data) => {
                assert.equal(data._doc.imei, "12345678");
                done();
            }).catch(done);

        });
    });
    describe("When users are searched by name: ", () => { // Scenary
        it("result should be all users that match with the name (no case sensitive) ", (done) => { // Result
            findUserByNamePaging("TeS", 0).then((data) => {
                expect(data[0]._doc).to.have.property("_id");
                expect(data[0]._doc).to.have.property("name");
                done();
            }).catch(done);
        });
    });
    describe("When contentPosts is approved: ", () => { // Scenary
        it("result should be the author of the  with a new approved point in it ", (done) => { // Result
            updatePointsApprovedToUser(new ObjectId("5d5f331e4bedae2a7c2fa1e8"), 1).then((data) => {
                assert.equal(data._doc.pointsPostApproved, 1);
                done();
            }).catch(done);
        });
    });
    describe("When contentPosts has a like added: ", () => { // Scenary
        it("result should be the author of the  with a new point in it ", (done) => { // Result
            updatePointsToUser(new ObjectId("5d5f331e4bedae2a7c2fa1e8"), 1).then((data) => {
                assert.equal(data._doc.pointsPost, 1);
                done();
            }).catch(done);
        });
    });
    describe("When a user is called: ", () => { // Scenary
        it("result should be a specific user ", (done) => { // Result
            findUserById(new ObjectId("5d5f331e4bedae2a7c2fa1e8")).then((data) => {
                expect(data._doc).to.have.property("_id");
                expect(data._doc).to.have.property("email");
                done();
            }).catch(done);

        });
    });
    after(function(done) {
        mongoose.connection.close();
        done();
    });
});
