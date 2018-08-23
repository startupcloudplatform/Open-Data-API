package com.inno.odag.service;

import java.util.List;
import com.inno.odag.dto.SearchDto;

public interface SearchService {
    SearchDto getSearchInfo(SearchDto searchDto);
    List<SearchDto> getSearchInfos(SearchDto searchDto);
    int createSearch(SearchDto searchDto);
    int updateSearch(SearchDto searchDto);
    int deleteSearch(SearchDto searchDto) throws Exception;
}