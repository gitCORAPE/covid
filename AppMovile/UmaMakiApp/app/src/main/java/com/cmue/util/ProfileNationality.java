package com.cmue.util;

public class ProfileNationality {

    private String townName;
    private String  nationality;
    private Integer numRegisterUser;
    private Integer numPost;
    private Integer numAppPost;

    public ProfileNationality( ) {

    }

    public String getTownName() {
        return townName;
    }

    public void setTownName(String townName) {
        this.townName = townName;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public Integer getNumRegisterUser() {
        return numRegisterUser;
    }

    public void setNumRegisterUser(Integer numRegisterUser) {
        this.numRegisterUser = numRegisterUser;
    }

    public Integer getNumPost() {
        return numPost;
    }

    public void setNumPost(Integer numPost) {
        this.numPost = numPost;
    }

    public Integer getNumAppPost() {
        return numAppPost;
    }

    public void setNumAppPost(Integer numAppPost) {
        this.numAppPost = numAppPost;
    }

}
