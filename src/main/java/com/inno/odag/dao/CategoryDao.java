package com.inno.odag.dao;

import java.util.List;
import com.inno.odag.dto.CategoryDto;

public interface CategoryDao {
    CategoryDto getCategoryInfo(CategoryDto categoryDto);
    List<CategoryDto> getCategoryInfos(CategoryDto categoryDto);
    List<CategoryDto> getCategoryInfosByDepth(CategoryDto categoryDto);
    List<CategoryDto> getCategoryRecursive(CategoryDto categoryDto);
    List<CategoryDto> getCategoryChildList(CategoryDto categoryDto);
    int createCategoryInfo(CategoryDto categoryDto);
    int updateCategoryInfo(CategoryDto categoryDto);
    int deleteCategoryInfo(CategoryDto categoryDto);
}
