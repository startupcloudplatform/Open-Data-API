package com.inno.odag.dao.implement;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.inno.odag.dao.SearchDao;
import com.inno.odag.dto.SearchDto;

@Repository
public class SearchDaoImpl implements SearchDao {

    @Autowired
    private SqlSession sql;
    
    @Override
    public SearchDto getSearchInfo(SearchDto searchDto) {
        return sql.selectOne("search", searchDto);
    }
    @Override
    public List<SearchDto> getSearchInfos(SearchDto searchDto){
        return sql.selectList("search", searchDto);
    }
    @Override
    public int createSearchInfo(SearchDto searchDto) {
        return sql.insert("searchInsert", searchDto);   
    }
    @Override
    public int updateSearchInfo(SearchDto searchDto) {
        return sql.update("searchUpdate", searchDto);  
    }
    @Override
    public int deleteSearchInfo(SearchDto searchDto) {
        return sql.delete("searchDelete", searchDto);
    }
}
