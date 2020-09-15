# NodeJs API

## Enviroment Variables

You need to copy all variables of `.env.example` and config to run in your local environment, for that you can exec 

```
cp .env.example .env 
```

If you need add another enviroment variable, add in `.env.example` file. That help to share this information with the team without risks.

Note: You can set whatever key as `AUTH_KEY` but If you are implementing in the server use a complex password. 

## Test Environment

In this project, we are using BDD to apply unit tests to improve the quality of the code.

We are using the following tools:

* Mocha: Framework for the to Javascript projects.
(https://mochajs.org/)
* Chait: Assertion library.
(https://www.chaijs.com)

Each unit test is written accordingly the model "Given - When - Then. More information in this link:(https://martinfowler.com/bliki/GivenWhenThen.html)

Example.

```
describe("Test Sum", () => { // Contex
 describe("When the input is 2 and 3", () => { // Scenary
 it("result should be 5", () => { // Result
 assert.equal(2 + 3, 5);
 });
 });
});
```

All this test should be in the test directory with the same structure of the project (src dir).

To run tests you must exec `npm test`.

