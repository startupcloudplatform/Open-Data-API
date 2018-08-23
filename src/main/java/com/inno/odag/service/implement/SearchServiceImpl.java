package com.inno.odag.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inno.odag.dao.SearchDao;
import com.inno.odag.dto.SearchDto;
import com.inno.odag.service.SearchService;

@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    private SearchDao searchDao;
    
    @Override
    public SearchDto getSearchInfo(SearchDto searchDto) {
        return searchDao.getSearchInfo(searchDto);
    }

    @Override
    public List<SearchDto> getSearchInfos(SearchDto searchDto) {
        return searchDao.getSearchInfos(searchDto);
    }
    
    @Override
    public int createSearch(SearchDto searchDto) {
        return searchDao.createSearchInfo(searchDto);
    }

    @Override  
    public int updateSearch(SearchDto searchDto) {
        return searchDao.updateSearchInfo(searchDto);
    }
    
    @Override
    public int deleteSearch(SearchDto searchDto) throws Exception{
        return searchDao.deleteSearchInfo(searchDto);
    }
}