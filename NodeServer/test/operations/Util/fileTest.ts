const assert = require("chai").assert;
import {
    uploadFileToS3,checkS3FileExistance
} from "../../../src/operations/Util/fileOperations";
import dotenv from "dotenv";
dotenv.config();
// Example of unit test using BDD.
// Reference https://martinfowler.com/bliki/GivenWhenThen.html

describe("File Test", () => { // Contex
    describe("When the input is a group of parameters", () => { // Scenary
        const params = {
            Body : "",
            Bucket: process.env.BUCKET,
            Key: "test",
            ACL: "public-read"
        }
        it("result should be a succesful upload", (done) => { // Result
            uploadFileToS3(params).then((data)=>{
                assert.equal(data.Key,"test");
                done();
            }).catch(done);
        });
    });
    describe("When the input is some parameter of an existing doc", () => { // Scenary
        const params = {
            Bucket: process.env.BUCKET,
            Key: "image.png",
        }
        it("result should be a the docs information", (done) => { // Result
            checkS3FileExistance(params).then((data)=>{
                assert.equal(data.ContentType,"application/octet-stream");
                done();
            }).catch(done);
        });
    });
});
