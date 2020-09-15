import {model, Schema} from "mongoose";


const userSchema = new Schema({

    //basic information
    email:{type:String, index:{unique:true},required:true},
    name: {type:String, required:true,  uppercase: true},
    gender:{type: String, enum:["F","M","O"]},
    profession:{type:String},
    nationality:{type: String, required: true},
    community:{type: String, required:true},
    //account validation information
    imei:{type: String, required:true},
    //account status/growth information
    status: {type: String, enum:["I","A","V"],default:"I"}, //I: Inactive, A: Active, V: Verified.
    badge:{type:String, enum:["CONOCEDOR","COMPA","COMUNICADOR"],default:"CONOCEDOR"},
    numberPost:{type:Number,default:0},
    pointsPost:{type: Number,default:0},
    pointsPostApproved:{type: Number,default:0},
    contents:[{type:Schema.Types.ObjectId, ref: "Content"}],
    isModerator:{type: Boolean,default:false}
});

export const USER = model("User",userSchema);