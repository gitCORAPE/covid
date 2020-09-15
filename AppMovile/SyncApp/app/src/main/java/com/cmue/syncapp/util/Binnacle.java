package com.cmue.syncapp.util;



public class Binnacle {
    int ID;
    int ID_Data;
    int operation;

    public Binnacle(){
        this.ID = Constants.WITHOUT_VALUE_INT;
        this.ID_Data = Constants.WITHOUT_VALUE_INT;
        this.operation = Constants.WITHOUT_VALUE_INT;
    }

    public Binnacle(int ID, int ID_Data, int operation) {
        this.ID = ID;
        this.ID_Data = ID_Data;
        this.operation = operation;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getID_Data() {
        return ID_Data;
    }

    public void setID_Data(int ID_Data) {
        this.ID_Data = ID_Data;
    }

    public int getOperation() {
        return operation;
    }

    public void setOperation(int operation) {
        this.operation = operation;
    }
}
