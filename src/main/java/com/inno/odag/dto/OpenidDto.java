package com.inno.odag.dto;

public class OpenidDto {
	
	private int openidNo;
	private int userNo;
	private String openapiData;
	private int openapiType;
	private String openapiProvider;
	
	public int getOpenidNo() {
		return openidNo;
	}
	public void setOpenidNo(int openidNo) {
		this.openidNo = openidNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getOpenapiData() {
		return openapiData;
	}
	public void setOpenapiData(String openapiData) {
		this.openapiData = openapiData;
	}
	public int getOpenapiType() {
		return openapiType;
	}
	public void setOpenapiType(int openapiType) {
		this.openapiType = openapiType;
	}
	public String getOpenapiProvider() {
		return openapiProvider;
	}
	public void setOpenapiProvider(String openapiProvider) {
		this.openapiProvider = openapiProvider;
	}
}
