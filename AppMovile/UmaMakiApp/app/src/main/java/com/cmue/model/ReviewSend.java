package com.cmue.model;

public class ReviewSend {

    private String reviewText;
    private String statusReviews;
    private String reviewer;

    public ReviewSend() {
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

    public String getReviewer() {
        return reviewer;
    }

    public void setReviewer(String reviewer) {
        this.reviewer = reviewer;
    }
}
