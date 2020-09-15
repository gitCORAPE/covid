package com.cmue.model;

public class ContentCommunity  {

    private String _id;
    private Integer associatedUsers;
    private Integer numberPost;
    private Integer pointsPost;
    private Integer pointsApproved;
    private String name;
    private Nationality nationality;

    public ContentCommunity() {

    }

    public String get_id() {
        return _id;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    public Integer getAssociatedUsers() {
        return associatedUsers;
    }

    public void setAssociatedUsers(Integer associatedUsers) {
        this.associatedUsers = associatedUsers;
    }

    public Integer getNumberPost() {
        return numberPost;
    }

    public void setNumberPost(Integer numberPost) {
        this.numberPost = numberPost;
    }

    public Integer getPointsPost() {
        return pointsPost;
    }

    public void setPointsPost(Integer pointsPost) {
        this.pointsPost = pointsPost;
    }

    public Integer getPointsApproved() {
        return pointsApproved;
    }

    public void setPointsApproved(Integer pointsApproved) {
        this.pointsApproved = pointsApproved;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Nationality getNationality() {
        return nationality;
    }

    public void setNationality(Nationality nationality) {
        this.nationality = nationality;
    }

}
