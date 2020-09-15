package com.cmue.util;

import android.app.Activity;

import com.cmue.model.ContentPost;
import com.cmue.model.User;

public class Singleton {

    private Singleton() {

    }

    private static final Singleton instance = new Singleton();

    private Activity mainContent;
    private Activity offlineActivity;
    private ContentPost contentPost;
    private User currentUser;
    private User specificUser;

    public static Singleton getInstance() {
        return instance;
    }

    public Activity getMainContent() {
        return mainContent;
    }

    public void setMainContent(Activity mainContent) {
        this.mainContent = mainContent;
    }

    public Activity getOfflineActivity() {
        return offlineActivity;
    }

    public void setOfflineActivity(Activity offlineActivity) {
        this.offlineActivity = offlineActivity;
    }

    public ContentPost getContentPost() {
        return contentPost;
    }

    public void setContentPost(ContentPost contentPost) {
        this.contentPost = contentPost;
    }

    public User getCurrentUser() {
        return currentUser;
    }

    public void setCurrentUser(User currentUser) {
        this.currentUser = currentUser;
    }

    public User getSpecificUser() {
        return specificUser;
    }

    public void setSpecificUser(User specificUser) {
        this.specificUser = specificUser;
    }

}
