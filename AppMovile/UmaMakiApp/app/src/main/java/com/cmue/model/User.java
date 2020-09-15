package com.cmue.model;


public class User {

    private String status;
    private String badge;
    private float numberPost;
    private float pointsPost;
    private float pointsPostApproved;
    private Object[] contents;
    private boolean isModerator;
    private String _id;
    private String email;
    private String name;

    public boolean isModerator() {
        return isModerator;
    }

    public void setModerator(boolean moderator) {
        isModerator = moderator;
    }

    private String nationality;
    private String community;



    public String getCommunityId() {
        return communityId;
    }

    public void setCommunityId(String communityId) {
        this.communityId = communityId;
    }

    private String communityId;
    private String imei;
    private float __v;

    public String getStatus() {
        return status;
    }

    public String getBadge() {
        return badge;
    }

    public float getNumberPost() {
        return numberPost;
    }

    public float getPointsPost() {
        return pointsPost;
    }

    public float getPointsPostApproved() {
        return pointsPostApproved;
    }

    public boolean getIsModerator() {
        return isModerator;
    }

    public String get_id() {
        return _id;
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getNationality() {
        return nationality;
    }

    public String getCommunity() {
        return community;
    }

    public String getImei() {
        return imei;
    }

    public float get__v() {
        return __v;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setBadge(String badge) {
        this.badge = badge;
    }

    public void setNumberPost(float numberPost) {
        this.numberPost = numberPost;
    }

    public void setPointsPost(float pointsPost) {
        this.pointsPost = pointsPost;
    }

    public void setPointsPostApproved(float pointsPostApproved) {
        this.pointsPostApproved = pointsPostApproved;
    }

    public void setIsModerator(boolean isModerator) {
        this.isModerator = isModerator;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public void setCommunity(String community) {
        this.community = community;
    }

    public void setImei(String imei) {
        this.imei = imei;
    }

    public void set__v(float __v) {
        this.__v = __v;
    }

    public Object[] getContents() {
        return contents;
    }

    public void setContents(Object[] contents) {
        this.contents = contents;
    }

}
