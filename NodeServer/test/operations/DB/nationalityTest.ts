import {
    getNationalities
} from "../../../src/operations/DB/nationality";
import mongoose from "mongoose";
import dotenv from "dotenv";
dotenv.config();

const expect = require('chai').expect;
describe("Nationality Tests", () => { // Contex
    before(function (done) {
        mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true });
        const db = mongoose.connection;
        db.on('error', console.error.bind(console, 'connection error'));
        db.once('open', function() {
          console.log('We are connected to test database!');
          done();
        });
    });
    describe("When nationalities are called: ", () => { // Scenary
        it("result should be all nationalities ", (done) => { // Result
                getNationalities().then((data)=>{
                    expect(data[0]._doc).to.have.property("_id");
                    expect(data[0]._doc).to.have.property("id");
                    done();
                }).catch(done);
            
        });
    });
    after(function(done){
        mongoose.connection.close();
        done();
  });
});