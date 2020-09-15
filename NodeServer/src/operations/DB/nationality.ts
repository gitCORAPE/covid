import {  NATIONALITY } from "../../model/nationality";

export const getNationalities = async (): Promise<any> => NATIONALITY.find();