package com.inno.odag.dao;

import java.util.List;
import com.inno.odag.dto.BookmarkOpenapiDto;
import com.inno.odag.dto.BookmarkDto;

public interface BookmarkOpenapiDao {
    int createBookmarkOpenapiInfo(BookmarkOpenapiDto bookmarkOpenapiDto);
    BookmarkOpenapiDto getBookmarkOpenapiInfo(BookmarkOpenapiDto bookmarkOpenapiDto);
    List<BookmarkOpenapiDto> getBookmarkOpenapiInfos(BookmarkOpenapiDto bookmarkOpenapiDto);
    int updateBookmarkOpenapiInfo(BookmarkOpenapiDto bookmarkOpenapiDto);
    int deleteBookmarkOpenapiInfo(BookmarkOpenapiDto bookmarkOpenapiDto);
    int deleteBookmarkOpenapiInfos(BookmarkDto bookmarkDto);
}