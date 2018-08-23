package com.inno.odag.dto;

public class UserOpenapiDto {
	private int userOpenapiNo;
	private int openapiNo;
	private String updateTime;
	private int userNo;
    private int openapiState;
    
	public int getOpenapiState() {
        return openapiState;
    }
    public void setOpenapiState(int openapiState) {
        this.openapiState = openapiState;
    }
	public int getUserOpenapiNo() {
		return userOpenapiNo;
	}
	public void setUserOpenapiNo(int userOpenapiNo) {
		this.userOpenapiNo = userOpenapiNo;
	}
	public int getOpenapiNo() {
		return openapiNo;
	}
	public void setOpenapiNo(int openapiNo) {
		this.openapiNo = openapiNo;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
}
