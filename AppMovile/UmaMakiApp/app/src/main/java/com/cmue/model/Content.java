package com.cmue.model;

import java.util.Date;

public class Content {

    private String file;
    private String community;
    private Community communityObject;
    private String user_id;
    private String postType;
    private String topic;
    private String description;
    private Date date;

    public Content() {
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public String getCommunity() {
        return community;
    }

    public void setCommunity(String community) {
        this.community = community;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getPostType() {
        return postType;
    }

    public void setPostType(String postType) {
        this.postType = postType;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }


    public Community getCommunityObject() {
        return communityObject;
    }

    public void setCommunityObject(Community communityObject) {
        this.communityObject = communityObject;
    }

}
