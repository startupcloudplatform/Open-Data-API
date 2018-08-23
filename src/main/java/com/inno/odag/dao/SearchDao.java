package com.inno.odag.dao;

import java.util.List;

import com.inno.odag.dto.SearchDto;

public interface SearchDao {
    SearchDto getSearchInfo(SearchDto searchDto);
    List<SearchDto> getSearchInfos(SearchDto searchDto);
    int createSearchInfo(SearchDto openidDto);
    int updateSearchInfo(SearchDto openidDto);
    int deleteSearchInfo(SearchDto openidDto);
}
