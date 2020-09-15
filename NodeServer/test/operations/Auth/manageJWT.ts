import chai from 'chai';
const expect = require('chai').expect;
import chaiJWT from "chai-jwt";
import dotenv from "dotenv";
dotenv.config();

chai.use(chaiJWT);

import { checkJwt, createNewToken, createUpdateToken } from "../../../src/operations/Auth/manageJWT";

describe("Creating JWT", () => { // Contex
    describe("When the input are name and badge", () => { // Scenary
        const name = "jean";
        const badge = "CONOCEDOR";

        describe("And we create a new token",() => {
            const token = createNewToken(name, badge );
            it("result should be a valid JWT", () => { // Result
                expect( token ).to.be.a.jwt;
            });

            it("the valid JWT should be signed with correct key" ,() =>{
                expect(token).to.be.signedWith(process.env.AUTH_KEY);
            });

            it("the valid JWT should be the properties name and badge" ,() =>{
                expect(token).to.be.a.jwt.and.have.claim('userName'); // Doesn't fail
                expect(token).to.be.a.jwt.and.have.claim('badge'); // fails
            });
        });
    });

    describe("When the input are an id and imei", () => { // Scenary
        const id = "1235fses4";
        const imei = "123432sfrw";

        describe("And we create a new token for account update",() => {
            const token = createUpdateToken(id, imei);
            it("result should be a valid JWT", () => { // Result
                expect( token ).to.be.a.jwt;
            });

            it("the valid JWT should be signed with correct key" ,() =>{
                expect(token).to.be.signedWith(process.env.AUTH_KEY);
            });

            it("the valid JWT should be the properties id and imei" ,() =>{
                expect(token).to.be.a.jwt.and.have.claim('id'); // Doesn't fail
                expect(token).to.be.a.jwt.and.have.claim('imei'); // fails
            });
        });
    });
});

describe("Checking JWT", () => { // Contex
    describe("When the input is a valid token", () => { // Scenary
        const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6ImplYW4iLCJiYWRnZSI6IkNPTk9DRURPUiIsImlhdCI6MTU2NjQ0OTU2NywiZXhwIjoxNTcxNjMzNTY3fQ.hMRIc4mpd5EZOFKtnC8gFny9BVidN30OgbtpH_WKe6w";
        it("result should have the property userName and badge", () => { // Result
            const result = checkJwt( token );
            expect(result).to.have.property("userName");
            expect(result).to.have.property("badge");
        });
    });

    describe("When the input is a valid update token", () => { // Scenary
        const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6ImplYW4iLCJiYWRnZSI6IkNPTk9DRURPUiIsImlhdCI6MTU2NjQ0OTU2NywiZXhwIjoxNTcxNjMzNTY3fQ.hMRIc4mpd5EZOFKtnC8gFny9BVidN30OgbtpH_WKe6w";
        it("result should have the property id and imei", () => { // Result
            const result = checkJwt( token );
            expect(result).to.have.property("id");
            expect(result).to.have.property("imei");
        });
    });

    describe("When the input is an invalid hash code", () => { // Scenary
        const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6ImplYW4iLCJiYWRnZSI6IkNPTk9DRURPUiIsImlhdCI6MTU2NjQ0OTU2NywiZXhwIjoxNTcxNjMzNTY3fQ.hMRIc4mpd5EZOFKtnC8gFny9BVidN30OgbtpH_WKe6t";
        it("result should be INVALID", () => { // Result
            expect(checkJwt( token )).to.eql("INVALID");
        });
    });

    describe("When the input is an expired hash code", () => { // Scenary
        const token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjE1NjY0NTAzNzgsImV4cCI6MTU2NjQ1MDUxMywiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoianJvY2tldEBleGFtcGxlLmNvbSIsIkdpdmVuTmFtZSI6IkpvaG5ueSIsIlN1cm5hbWUiOiJSb2NrZXQiLCJFbWFpbCI6Impyb2NrZXRAZXhhbXBsZS5jb20iLCJSb2xlIjpbIk1hbmFnZXIiLCJQcm9qZWN0IEFkbWluaXN0cmF0b3IiXX0.CBwnx7O070tEDiotTil_vnGT7aelW-DifW3SQ0Amz64";
        it("result should be EXPIRED", () => { // Result
            expect(checkJwt( token )).to.eql("EXPIRED");
        });
    });
});
