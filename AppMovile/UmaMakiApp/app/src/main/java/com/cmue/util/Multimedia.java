package com.cmue.util;

public class Multimedia {

    private String path;
    private String type;

    public Multimedia(String path, String type) {
        this.path = path;
        this.type = type;
    }

    public Multimedia(){
        path = "";
        type = "";
    }

    public String getPath() {
        return path;
    }

    public String getType() {
        return type;
    }

}
