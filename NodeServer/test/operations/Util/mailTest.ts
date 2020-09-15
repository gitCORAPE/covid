const assert = require("chai").assert;
import {
    sendVerificationMail, sendUpdateAccountMail,
} from "../../../src/operations/Util/mailOperations";
// Example of unit test using BDD.
// Reference https://martinfowler.com/bliki/GivenWhenThen.html

describe("Mail Test", () => { // Contex
    describe.only("When the input is an user id and user mail", () => { // Scenary
        it("result should be a succesful mail send", (done) => { // Result
            sendVerificationMail("5d618101e376f133eca9c100", "janka.obando@outlook.es").then((data) => {
                assert.equal(data.accepted, "janka.obando@outlook.es");
                done();
            }).catch(done);
        });
    });
    describe("When the input is an user id, imei and user mail", () => { // Scenary
        it("result should be a succesful mail send for update", (done) => { // Result
            sendUpdateAccountMail("123", "1234", "alexmejia199745@live.com").then((data) => {
                assert.equal(data.accepted, "alexmejia199745@live.com");
                done();
            }).catch(done);
        });
    });
});
