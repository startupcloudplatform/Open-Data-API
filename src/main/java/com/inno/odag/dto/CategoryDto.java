package com.inno.odag.dto;

import java.util.List;

public class CategoryDto {
    
    private String categoryNo;
    private String categoryText;
    private String categoryParents;
    private int categoryUse;
    private int categoryDepth;
    
    private List<CategoryDto> categoryList;
    
    public String getCategoryNo() {
        return categoryNo;
    }
    public void setCategoryNo(String categoryNo) {
        this.categoryNo = categoryNo;
    }
    public String getCategoryText() {
        return categoryText;
    }
    public void setCategoryText(String categoryText) {
        this.categoryText = categoryText;
    }
    public String getCategoryParents() {
        return categoryParents;
    }
    public void setCategoryParents(String categoryParents) {
        this.categoryParents = categoryParents;
    }
    public int getCategoryUse() {
        return categoryUse;
    }
    public void setCategoryUse(int categoryUse) {
        this.categoryUse = categoryUse;
    }
    public int getCategoryDepth() {
        return categoryDepth;
    }
    public void setCategoryDepth(int categoryDepth) {
        this.categoryDepth = categoryDepth;
    }
    public List<CategoryDto> getCategoryList() {
      return categoryList;
    }
    public void setCategoryList(List<CategoryDto> categoryList) {
      this.categoryList = categoryList;
    }
}
