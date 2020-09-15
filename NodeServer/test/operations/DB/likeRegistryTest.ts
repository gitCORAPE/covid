import {
    getRegistryByUserAndPost,
    updateRegistryType,
    addRegistry
} from "../../../src/operations/DB/likeRegistry";
import mongoose from "mongoose";
import dotenv from "dotenv";
import { ObjectId } from "bson";
import { LikeRegistry } from "../../../src/types/types";
dotenv.config();

const assert = require("chai").assert;
const expect = require("chai").expect;
// Example of unit test using BDD.
// Reference https://martinfowler.com/bliki/GivenWhenThen.html

describe("Content Post Tests", () => { // Contex
    before(function (done) {
        mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true });
        const db = mongoose.connection;
        db.on('error', console.error.bind(console, 'connection error'));
        db.once('open', function() {
          console.log('We are connected to test database!');
          done();
        });
    });

    describe("When the like is submited: ", () => { // Scenary
        const like: LikeRegistry = {
                user: new ObjectId("5d5f331e4bedae2a7c2fa1e8"),
                contentPost: new ObjectId("5d756f2bfb71cc2234e8ad71"),
                type: "DISLIKE"
        }
        it("result should be the same like created", (done) => { // Result
                addRegistry(like).then((data) => {
                    assert.equal(data._doc.type, like.type);
                    done();
                }).catch(done);
        });
    });

    describe("When the like is updated: ", () => { // Scenary
        it("the type of like should change", (done) => { // Result
                updateRegistryType(new ObjectId("5da3531f6257b42a5cd5eec4"), "LIKE").then((data) => {
                    assert.equal(data._doc.type, "LIKE");
                    done();
                }).catch(done);
        });
    });

    describe("When a like is called: ", () => { // Scenary
        it("result should be a specific like ", (done) => { // Result
                getRegistryByUserAndPost(new ObjectId("5d5f331e4bedae2a7c2fa1e8"),
                    new ObjectId("5d756f2bfb71cc2234e8ad71")).then((data) => {
                        expect(data._doc).to.have.property("_id");
                        expect(data._doc).to.have.property("type");
                        done();
                }).catch(done);
        });
    });
    after(function(done){
          mongoose.connection.close();
          done();
    });
});
