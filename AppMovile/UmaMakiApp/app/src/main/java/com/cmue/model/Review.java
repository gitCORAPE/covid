package com.cmue.model;

public class Review {

    private String _id;
    private String reviewText;
    private String statusReviews;
    private User reviewer;

    public Review(){

    }

    public String get_id() {
        return _id;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public String getStatusReviews() {
        return statusReviews;
    }

    public void setStatusReviews(String statusReviews) {
        this.statusReviews = statusReviews;
    }

    public User getReviewer() {
        return reviewer;
    }

    public void setReviewer(User reviewer) {
        this.reviewer = reviewer;
    }

}

