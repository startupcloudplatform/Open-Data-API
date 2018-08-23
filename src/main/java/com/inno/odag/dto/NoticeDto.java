package com.inno.odag.dto;

public class NoticeDto {
    private int noticeNo;
    private String noticeTitle;
    private String noticeContents;
    private int createUserNo;
    private int updateUserNo;
    private String createTime;
    private String updateTime;
    private String endTime;
    private int target;
    private int count;

    public int getNoticeNo() {
        return noticeNo;
    }
    public void setNoticeNo(int noticeNo) {
        this.noticeNo = noticeNo;
    }
    public String getNoticeTitle() {
        return noticeTitle;
    }
    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }
    public String getNoticeContents() {
        return noticeContents;
    }
    public void setNoticeContents(String noticeContents) {
        this.noticeContents = noticeContents;
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