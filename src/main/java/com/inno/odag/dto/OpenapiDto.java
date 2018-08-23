package com.inno.odag.dto;

public class OpenapiDto {
	
	private int openapiNo;
	private String updateTime;
	private String openapiName;
	private String openapiCategory;
	private int openapiUseType;
	private int openapiResultType;
	private String openapiProvider;
	private String openapiComment;
    private int openapiCntUse;
    private int openapiCntBookmark;
    private int openapiCntDownload;
    private String openapiUseUrl;
    private String openapiJoinUrl;
    private String openapiKeyword;
    private int userNo;
    
    private boolean used;
    
    public String getOpenapiKeyword() {
        return openapiKeyword;
    }

    public void setOpenapiKeyword(String openapiKeyword) {
        this.openapiKeyword = openapiKeyword;
    }

	public int getOpenapiCntUse() {
        return openapiCntUse;
    }
	
    public void setOpenapiCntUse(int openapiCntUse) {
        this.openapiCntUse = openapiCntUse;
    }
    
    public int getOpenapiCntBookmark() {
        return openapiCntBookmark;
    }
    
    public void setOpenapiCntBookmark(int openapiCntBookmark) {
        this.openapiCntBookmark = openapiCntBookmark;
    }
    
    public int getOpenapiCntDownload() {
        return openapiCntDownload;
    }
    
    public void setOpenapiCntDownload(int openapiCntDownload) {
        this.openapiCntDownload = openapiCntDownload;
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
	public String getOpenapiName() {
		return openapiName;
	}
	public void setOpenapiName(String openapiName) {
		this.openapiName = openapiName;
	}
	
	public String getOpenapiCategory() {
      return openapiCategory;
    }

    public void setOpenapiCategory(String openapiCategory) {
      this.openapiCategory = openapiCategory;
    }

    public int getOpenapiUseType() {
		return openapiUseType;
	}
	public void setOpenapiUseType(int openapiUseType) {
		this.openapiUseType = openapiUseType;
	}
	public int getOpenapiResultType() {
		return openapiResultType;
	}
	public void setOpenapiResultType(int openapiResultType) {
		this.openapiResultType = openapiResultType;
	}
	public String getOpenapiProvider() {
		return openapiProvider;
	}
	public void setOpenapiProvider(String openapiProvider) {
		this.openapiProvider = openapiProvider;
	}
	public String getOpenapiComment() {
		return openapiComment;
	}
	public void setOpenapiComment(String openapiComment) {
		this.openapiComment = openapiComment;
	}	
    public boolean isUsed() {
      return used;
    }

    public void setUsed(boolean used) {
      this.used = used;
    }
    
    public String getOpenapiUseUrl() {
        return openapiUseUrl;
    }

    public void setOpenapiUseUrl(String openapiUseUrl) {
        this.openapiUseUrl = openapiUseUrl;
    }

    public String getOpenapiJoinUrl() {
        return openapiJoinUrl;
    }

    public void setOpenapiJoinUrl(String openapiJoinUrl) {
        this.openapiJoinUrl = openapiJoinUrl;
    }

    public int getUserNo() {
        return userNo;
    }

    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }
}
