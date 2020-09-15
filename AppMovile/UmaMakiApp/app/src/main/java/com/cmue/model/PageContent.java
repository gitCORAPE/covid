package com.cmue.model;

public class PageContent {

    private int pageNumber;
    private int totalPages;
    private ContentPost[] contentPosts;

    public PageContent(){

    }

    public PageContent(int pageNumber, int totalPages, ContentPost[] contentPosts) {
        this.pageNumber = pageNumber;
        this.totalPages = totalPages;
        this.contentPosts = contentPosts;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public ContentPost[] getContentPosts() {
        return contentPosts;
    }

    public void setContentPosts(ContentPost[] contentPosts) {
        this.contentPosts = contentPosts;
    }

}
