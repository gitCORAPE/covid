import {
    createPost as createPostDB,
    findPostById as findPostByIdDB,
    listContentPostPaged,
    addDislike,
    addLike,
    searchContentPostPaged,
    addReview,
    getReviewCountByStatus,
    getReviewCountByUser,
    updateReviewStatus
} from "../../../src/operations/DB/contentPost";

import { contentPost,review } from "../../utilS";
import mongoose from "mongoose";
import dotenv from "dotenv";
import { ObjectId } from "bson";
dotenv.config();

const assert = require("chai").assert;
const expect = require('chai').expect;
// Example of unit test using BDD.
// Reference https://martinfowler.com/bliki/GivenWhenThen.html

describe("Content Post Tests", () => { // Contex
    before(function (done) {
        mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true });
        mongoose.set('useFindAndModify', false);
        const db = mongoose.connection;
        db.on('error', console.error.bind(console, 'connection error'));
        db.once('open', function () {
            console.log('We are connected to test database!');
            done();
        });
    });

    describe("When the post created has data: ", () => { // Scenary
        it("result should be the same post created with all defaults values defined ", (done) => { // Result
            createPostDB(contentPost).then((data) => {
                assert.equal(data._doc.filePath, contentPost.filePath);
                done();
            }).catch(done);

        });
    });

    describe("When a post is called: ", () => { // Scenary
        it("result should be a specific post ", (done) => { // Result
            findPostByIdDB(new ObjectId("5d719bba6bc5c43f14a8fae5")).then((data) => {
                expect(data._doc).to.have.property("_id");
                expect(data._doc).to.have.property("id");
                done();
            }).catch(done);

        });
    });
    describe("When contentPosts are searched: ", () => { // Scenary
        it("result should be all contentPosts ", (done) => { // Result
            listContentPostPaged(0).then((data) => {
                expect(data[0]._doc).to.have.property("_id");
                expect(data[0]._doc).to.have.property("topic");
                done();
            }).catch(done);
        });
    });
    describe("When contentPosts are searched: ", () => { // Scenary
        const query = {
            user: new ObjectId("5d5f33514bedae2a7c2fa1e9"),
            community: new ObjectId("5d64686d30c3f431f8c876a8"),
            inReview: true
        };
        it("result should be all contentPosts matched by query ", (done) => { // Result
            searchContentPostPaged(query,0).then((data) => {
                expect(data[0]._doc).to.have.property("_id");
                expect(data[0]._doc).to.have.property("topic");
                done();
            }).catch(done);
        });
    });
  describe("When contentPosts has a like added: ", () => { // Scenary
        it("result should be the contentPost with a new like in it ", (done) => { // Result
            addLike(new ObjectId("5d756f2bfb72cc2234e8ad71"), 1).then((data) => {
                assert.equal(data._doc.likes, 2);
                done();
            }).catch(done);
        });
    });
    describe("When contentPosts has a dislike added: ", () => { // Scenary
        it("result should be the contentPost with a new dislike in it ", (done) => { // Result
            addDislike(new ObjectId("5d756f2bfb72cc2234e8ad71"), 1).then((data) => {
                assert.equal(data._doc.dislikes, 3);
                done();
            }).catch(done);
        });
    });
    describe("When contentPosts has a review added: ", () => { // Scenary
        it("result should be the contentPost with a new review in it ", (done) => { // Result
            addReview(new ObjectId("5d756f2bfb72cc2234e8ad71"), review).then((data) => {
                assert.equal(data._doc.reviews[0].statusReviews, review.statusReviews);
                done();
            }).catch(done);
        });
    });
    describe("When contentPosts has a aproved reviews checked: ", () => { // Scenary
        it("result should be the number of reviews approved", (done) => { // Result
            getReviewCountByStatus(new ObjectId("5d756f2bfb72cc2234e8ad71"), "Approved").then((data) => {
                assert.equal(data[0].reviewsCount,8);
                done();
            }).catch(done);
        });
    });
    describe("When contentPosts has disapproved reviews checked: ", () => { // Scenary
        it("result should be the number of reviews disapproved", (done) => { // Result
            getReviewCountByStatus(new ObjectId("5d756f2bfb72cc2234e8ad71"), "Disapproved").then((data) => {
                assert.equal(data[0].reviewsCount, 0);
                done();
            }).catch(done);
        });
    });
    describe("When contentPosts has number reviews by user checked: ", () => { // Scenary
        it("result should be the number of reviews by the user", (done) => { // Result
            getReviewCountByUser(new ObjectId("5d756f2bfb72cc2234e8ad71"), new ObjectId("5d5f331e4bedae2a7c2fa1e8")).then((data) => {
                assert.equal(data[0].reviewsCount,9);
                done();
            }).catch(done);
        });
    });
    describe("When contentPosts has a inReview changed: ", () => { // Scenary
        it("result should be the contentPost with a new inReview data in it ", (done) => { // Result
            updateReviewStatus(new ObjectId("5d756f2bfb72cc2234e8ad71"), false).then((data) => {
                assert.equal(data._doc.inReview, false);
                done();
            }).catch(done);
        });
    });
    after(function(done){
          mongoose.connection.close();
          done();
    });
});
