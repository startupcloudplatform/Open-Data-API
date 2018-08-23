package com.inno.odag.dao.implement;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.inno.odag.dao.CategoryDao;
import com.inno.odag.dto.CategoryDto;

@Repository
public class CategoryDaoImpl extends SqlSessionDaoSupport implements CategoryDao {
    public CategoryDaoImpl(){}

    @Autowired
    public CategoryDaoImpl(SqlSessionTemplate sqlSession){
        super.setSqlSessionTemplate(sqlSession);
    }

    @Override
    public CategoryDto getCategoryInfo(CategoryDto categoryDto) {
        return getSqlSession().selectOne("category", categoryDto);
    }

    @Override
    public List<CategoryDto> getCategoryInfos(CategoryDto categoryDto){
        return getSqlSession().selectList("category", categoryDto);
    }

    @Override
    public List<CategoryDto> getCategoryInfosByDepth(CategoryDto categoryDto){
        return getSqlSession().selectList("categoryDepth", categoryDto);
    }

    @Override
    public int createCategoryInfo(CategoryDto categoryDto) {
        return getSqlSession().insert("categoryInsert", categoryDto);
    }

    @Override
    public int updateCategoryInfo(CategoryDto categoryDto) {
        return getSqlSession().update("categoryUpdate", categoryDto);
    }

    @Override
    public int deleteCategoryInfo(CategoryDto categoryDto) {
        return getSqlSession().delete("categoryDelete", categoryDto);
    }

    @Override
    public List<CategoryDto> getCategoryRecursive(CategoryDto categoryDto) {
        return getSqlSession().selectList("categoryRecursiveList", categoryDto);
    }
    
    @Override    
    public List<CategoryDto> getCategoryChildList(CategoryDto categoryDto){
        return getSqlSession().selectList("categoryChildList", categoryDto);        
    };
}
