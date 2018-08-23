package com.inno.odag.dao;

import java.util.List;
import com.inno.odag.dto.BookmarkDto;

public interface BookmarkDao {
    
    int createBookmarkInfo(BookmarkDto bookmarkDto);
    BookmarkDto getBookmarkInfo(BookmarkDto bookmarkDto);
    List<BookmarkDto> getBookmarkInfos(BookmarkDto bookmarkDto);
    int updateBookmarkInfo(BookmarkDto bookmarkDto);
    int deleteBookmarkInfo(BookmarkDto bookmarkDto);
}