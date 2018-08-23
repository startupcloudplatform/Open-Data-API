package com.inno.odag.dto;

public class CommunityDto {
    
    private int communityNo;
    private String communityTitle;
    private String communityContents;
    private int createUserNo;
    private int updateUserNo;
    private String createTime;
    private String updateTime;
    private String endTime;
    private int target;
    private int count;
    
    public int getCommunityNo() {
        return communityNo;
    }
    public void setCommunityNo(int communityNo) {
        this.communityNo = communityNo;
    }
    public String getCommunityTitle() {
        return communityTitle;
    }
    public void setCommunityTitle(String communityTitle) {
        this.communityTitle = communityTitle;
    }
    public String getCommunityContents() {
        return communityContents;
    }
    public void setCommunityContents(String communityContents) {
        this.communityContents = communityContents;
    }
    public int getCreateUserNo() {
        return createUserNo;
    }
    public void setCreateUserNo(int createUserNo) {
        this.createUserNo = createUserNo;
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
    public String getEndTime() {
        return endTime;
    }
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
    public int getTarget() {
        return target;
    }
    public void setTarget(int target) {
        this.target = target;
    }
    public int getCount() {
        return count;
    }
    public void setCount(int count) {
        this.count = count;
    }
}
