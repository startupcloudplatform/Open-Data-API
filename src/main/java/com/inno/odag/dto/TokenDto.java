package com.inno.odag.dto;

public class TokenDto {
    
    private int tokenNo;
    private String tokenKey;    
    private String provider;
    private int openapiNo;
    private String parameter;
    private int userNo;    
    private String createTime;
    
    public int getTokenNo() {
        return tokenNo;
    }
    
    public void setTokenNo(int tokenNo) {
        this.tokenNo = tokenNo;
    }
    
    public String getTokenKey() {
        return tokenKey;
    }
    
    public void setTokenKey(String tokenKey) {
        this.tokenKey = tokenKey;
    }
    
    public String getProvider() {
        return provider;
    }
    
    public void setProvider(String provider) {
        this.provider = provider;
    }
    
    public int getOpenapiNo() {
        return openapiNo;
    }
    
    public void setOpenapiNo(int openapiNo) {
        this.openapiNo = openapiNo;
    }
    
    public String getParameter() {
        return parameter;
    }
    
    public void setParameter(String parameter) {
        this.parameter = parameter;
    }
    
    public int getUserNo() {
        return userNo;
    }
    
    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }
    
    public String getCreateTime() {
        return createTime;
    }
    
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

}
