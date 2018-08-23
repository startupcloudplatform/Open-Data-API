package com.inno.odag.dto;

public class SearchDto {
    
    private int searchNo;
    private String searchKeyword;
    private int userNo;
    private int searchCount;
    private String searchTime;
    
    public int getSearchNo() {
        return searchNo;
    }
    public void setSearchNo(int searchNo) {
        this.searchNo = searchNo;
    }
    public String getSearchKeyword() {
        return searchKeyword;
    }
    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }
    public int getUserNo() {
        return userNo;
    }
    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }
    public int getSearchCount() {
        return searchCount;
    }
    public void setSearchCount(int searchCount) {
        this.searchCount = searchCount;
    }
    public String getSearchTime() {
        return searchTime;
    }
    public void setSearchTime(String searchTime) {
        this.searchTime = searchTime;
    }
}
