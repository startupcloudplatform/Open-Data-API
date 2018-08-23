package com.inno.odag.dto;

public class BookmarkDto {

	private int bookmarkNo;
	private String bookmarkName;
    private int userNo;
    
	public int getBookmarkNo() {
		return bookmarkNo;
	}
	public void setBookmarkNo(int bookmarkNo) {
		this.bookmarkNo = bookmarkNo;
	}
	public String getBookmarkName() {
		return bookmarkName;
	}
	public void setBookmarkName(String bookmarkName) {
		this.bookmarkName = bookmarkName;
	}
    public int getUserNo() {
        return userNo;
    }
    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }
}
