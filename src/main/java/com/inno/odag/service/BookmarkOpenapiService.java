package com.inno.odag.service;

import java.util.List;
import com.inno.odag.dto.BookmarkOpenapiDto;
import com.inno.odag.dto.BookmarkDto;

public interface BookmarkOpenapiService {

    BookmarkOpenapiDto getBookmarkOpenapiInfo(BookmarkOpenapiDto bookmarkOpenapiDto);
    List<BookmarkOpenapiDto> getBookmarkOpenapiInfos(BookmarkOpenapiDto bookmarkOpenapiDto);
    int createBookmarkOpenapi(BookmarkOpenapiDto bookmarkOpenapiDto);
    int updateBookmarkOpenapi(BookmarkOpenapiDto bookmarkOpenapiDto);
    int deleteBookmarkOpenapi(BookmarkOpenapiDto bookmarkOpenapiDto) throws Exception;
    int deleteBookmarkOpenapiInfos(BookmarkDto bookmarkDto) throws Exception;
}

