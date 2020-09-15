import {model, Schema} from 'mongoose';

const nationalitySchema = new Schema({
    id: {type: String, index:{unique:true}, required: true},//for interaction with the docuentation center
    name: {type: String, required: true, uppercase: true}
});

export const NATIONALITY = model('Nationality',nationalitySchema);