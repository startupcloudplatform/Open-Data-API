package com.inno.odag.dto;

public class UserDto {

  private int userNo;
  private String userId;
  private String userPw;
  private String userName;
  private int userType;
  private String companyName;
  
  private String companyCategory;
  private int companyType;
  private String companyIntroduce;
  private String keyword;
  
  private int userCntBookmark;
  private int userCntToken;
  private int userEnable;
  private String lastLoginTime;
  private String createTime;
  
  public int getUserCntBookmark() {
      return userCntBookmark;
  }

  public void setUserCntBookmark(int userCntBookmark) {
      this.userCntBookmark = userCntBookmark;
  }

  public int getUserCntToken() {
      return userCntToken;
  }

  public void setUserCntToken(int userCntToken) {
      this.userCntToken = userCntToken;
  }

  public int getUserEnable() {
      return userEnable;
  }

  public void setUserEnable(int userEnable) {
      this.userEnable = userEnable;
  }

  public String getLastLoginTime() {
      return lastLoginTime;
  }

  public void setLastLoginTime(String lastLoginTime) {
      this.lastLoginTime = lastLoginTime;
  }


  public String getCompanyCategory() {
    return companyCategory;
  }

  public void setCompanyCategory(String companyCategory) {
    this.companyCategory = companyCategory;
  }

  public int getUserNo() {
    return userNo;
  }

  public void setUserNo(int userNo) {
    this.userNo = userNo;
  }

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getUserPw() {
    return userPw;
  }

  public void setUserPw(String userPw) {
    this.userPw = userPw;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public int getUserType() {
    return userType;
  }

  public void setUserType(int userType) {
    this.userType = userType;
  }

  public String getCompanyName() {
    return companyName;
  }

  public void setCompanyName(String companyName) {
    this.companyName = companyName;
  }

  public int getCompanyType() {
    return companyType;
  }

  public void setCompanyType(int companyType) {
    this.companyType = companyType;
  }

  public String getCompanyIntroduce() {
    return companyIntroduce;
  }

  public void setCompanyIntroduce(String companyIntroduce) {
    this.companyIntroduce = companyIntroduce;
  }

  public String getKeyword() {
    return keyword;
  }

  public void setKeyword(String keyword) {
    this.keyword = keyword;
  }
  
  public String getCreateTime() {
      return createTime;
    }

    public void setCreateTime(String createTime) {
      this.createTime = createTime;
  }
    
  @Override
  public String toString() {
    return "UserDto [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userName="
        + userName + ", userType=" + userType + ", companyName=" + companyName
        + ", companyCategory=" + companyCategory + ", companyType=" + companyType
        + ", companyIntroduce=" + companyIntroduce + ", keyword=" + keyword + "]";
  }
}