import {
    getCommunitiesByNationality, getCommunities, findCommunityByNamePaging, findCommunityById, addnumberPost, addpointsPost, addpointsApproved, addassociatedUsers
} from "../../../src/operations/DB/community";
import mongoose from "mongoose";
import dotenv from "dotenv";
import {ObjectId} from "bson";
dotenv.config();

const expect = require('chai').expect;
const assert = require("chai").assert;

describe("Community Tests", () => { // Contex
    before(function (done) {
        mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true });
        const db = mongoose.connection;
        db.on('error', console.error.bind(console, 'connection error'));
        db.once('open', function () {
            console.log('We are connected to test database!');
            done();
        });
    });
    describe("When communities from nation Sekoya are called: ", () => { // Scenary
        it("result should be all communities of that nation ", (done) => { // Result
            getCommunitiesByNationality("5d6466588b162c31f8475a24").then((data) => {
                expect(data[0]._doc).to.have.property("_id");
                expect(data[0]._doc).to.have.property("id");
                done();
            }).catch(done);

        });
    });
    describe("When communities are called: ", () => { // Scenary
        it("result should be all communities ", (done) => { // Result
            getCommunities().then((data) => {
                expect(data[0]._doc).to.have.property("_id");
                expect(data[0]._doc).to.have.property("id");
                done();
            }).catch(done);

        });
    });
    describe("When communities are searched by name: ", () => { // Scenary
        it("result should be all comunities that match with the name (no case sensitive) ", (done) => { // Result
            findCommunityByNamePaging("aN", 0).then((data) => {
                expect(data[0]._doc).to.have.property("_id");
                expect(data[0]._doc).to.have.property("name");
                done();
            }).catch(done);
        });
    });
    describe("When a community is called: ", () => { // Scenary
        it("result should be a specific community ", (done) => { // Result
            findCommunityById(new ObjectId("5d6467998b162c31f8475a25")).then((data) => {
                expect(data._doc).to.have.property("_id");
                expect(data._doc).to.have.property("id");
                done();
            }).catch(done);

        });
    });
    describe("When user is added: ", () => { // Scenary
        it("result should be the community with one more user", (done) => { // Result
            addassociatedUsers("PANZALEO", 1).then((data) => {
                assert.equal(data._doc.numberPost, 1);
                done();
            }).catch(done);
        });
    });
    describe("When contentPosts is added: ", () => { // Scenary
        it("result should be the community with one more post", (done) => { // Result
            addnumberPost(new ObjectId("5d6467998b162c31f8475a25"), 1).then((data) => {
                assert.equal(data._doc.numberPost, 1);
                done();
            }).catch(done);
        });
    });
    describe("When contentPosts has a like/dislike added: ", () => { // Scenary
        it("result should be the contentPost with update points ", (done) => { // Result
            addpointsPost(new ObjectId("5d6467998b162c31f8475a25"), 1).then((data) => {
                assert.equal(data._doc.pointsPost, 1);
                done();
            }).catch(done);
        });
    });
    describe("When contentPosts is aproved: ", () => { // Scenary
        it("result should be the community with points approved added ", (done) => { // Result
            addpointsApproved(new ObjectId("5d6467998b162c31f8475a25"), 1).then((data) => {
                assert.equal(data._doc.pointsApproved, 1);
                done();
            }).catch(done);
        });
    });
    after(function (done) {
        mongoose.connection.close();
        done();
    });
});
