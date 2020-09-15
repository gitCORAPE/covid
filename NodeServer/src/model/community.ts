import {model, Schema} from 'mongoose';

const communitySchema = new Schema({
    id: {type: String, index:{unique:true}, required: true},//for interaction with the docuentation center
    name: {type: String, uppercase: true},
    nationality:{type: Schema.Types.ObjectId, ref:"Nationality"},
    associatedUsers:{type:Number,default: 0},
    numberPost:{type:Number, default: 0},
    pointsPost:{type: Number, default: 0},
    pointsApproved:{type: Number, default: 0}
});

export const COMMUNITY = model('Community',communitySchema);