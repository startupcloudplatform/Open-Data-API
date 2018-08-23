package com.inno.odag.service;

import java.util.List;
import com.inno.odag.dto.CategoryDto;

public interface CategoryService {
    CategoryDto getCategoryInfo(CategoryDto categoryDto);
    List<CategoryDto> getCategoryInfos(CategoryDto categoryDto);
    List<CategoryDto> getCategoryInfosByDepth(CategoryDto categoryDto);
    List<CategoryDto> getCategoryChildList(CategoryDto categoryDto);
    int createCategory(CategoryDto categoryDto);
    int updateCategory(CategoryDto categoryDto);
    int deleteCategory(CategoryDto categoryDto) throws Exception;
    List<CategoryDto> getCategoryRecursive(CategoryDto categoryDto);
}
