package com.inno.odag.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inno.odag.dao.CategoryDao;
import com.inno.odag.dto.CategoryDto;
import com.inno.odag.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
    
    @Autowired
    private CategoryDao categoryDao;
    
    @Override  
    public CategoryDto getCategoryInfo(CategoryDto categoryDto) {
        return categoryDao.getCategoryInfo(categoryDto);
    }

    @Override  
    public List<CategoryDto> getCategoryInfos(CategoryDto categoryDto){
        return categoryDao.getCategoryInfos(categoryDto);       
    }
    
    @Override
    public List<CategoryDto> getCategoryInfosByDepth(CategoryDto categoryDto){
        return categoryDao.getCategoryInfosByDepth(categoryDto);
    }
    
    @Override  
    public int createCategory(CategoryDto categoryDto) {
        return categoryDao.createCategoryInfo(categoryDto);
    }
    
    @Override  
    public int updateCategory(CategoryDto categoryDto) {
        return categoryDao.updateCategoryInfo(categoryDto);
    }
    
    @Override  
    public int deleteCategory(CategoryDto categoryDto) throws Exception{
        return categoryDao.deleteCategoryInfo(categoryDto);
    }

    @Override
    public List<CategoryDto> getCategoryRecursive(CategoryDto categoryDto) {
      return categoryDao.getCategoryRecursive(categoryDto);
    }
 
    @Override
    public List<CategoryDto> getCategoryChildList(CategoryDto categoryDto){
        return categoryDao.getCategoryChildList(categoryDto);       
    }
}
