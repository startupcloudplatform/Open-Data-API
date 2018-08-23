package com.inno.odag.dto;

public class CommunityReplyDto {
    private int communityReplyNo;
    private String communityReplyTitle;
    private String communityReplyContents;
    private int communityNo;
    private int createUserNo;
    private String createUserName;
    private int updateUserNo;
    private String createTime;
    private String updateTime;

    public int getCommunityReplyNo() {
        return communityReplyNo;
    }
    public void setCommunityReplyNo(int communityReplyNo) {
        this.communityReplyNo = communityReplyNo;
    }
    public String getCommunityReplyTitle() {
        return communityReplyTitle;
    }
    public void setCommunityReplyTitle(String communityReplyTitle) {
        this.communityReplyTitle = communityReplyTitle;
    }
    public String getCommunityReplyContents() {
        return communityReplyContents;
    }
    public void setCommunityReplyContents(String communityReplyContents) {
        this.communityReplyContents = communityReplyContents;
    }
    public int getCommunityNo() {
        return communityNo;
    }
    public void setCommunityNo(int communityNo) {
        this.communityNo = communityNo;
    }
    public int getCreateUserNo() {
        return createUserNo;
    }
    public void setCreateUserNo(int createUserNo) {
        this.createUserNo = createUserNo;
    }
    public String getCreateUserName() {
        return createUserName;
    }
    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName;
    }
    public int getUpdateUserNo() {
        return updateUserNo;
    }
    public void setUpdateUserNo(int updateUserNo) {
        this.updateUserNo = updateUserNo;
    }
    public String getCreateTime() {
        return createTime;
    }
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
    public String getUpdateTime() {
        return updateTime;
    }
    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
}