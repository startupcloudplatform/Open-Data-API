package com.inno.odag.service;

import java.util.List;
import com.inno.odag.dto.BookmarkDto;

public interface BookmarkService {
    BookmarkDto getBookmarkInfo(BookmarkDto bookmarkDto);
    List<BookmarkDto> getBookmarkInfos(BookmarkDto bookmarkDto);
    int createBookmark(BookmarkDto bookmarkDto);
    int updateBookmark(BookmarkDto bookmarkDto);
    int deleteBookmark(BookmarkDto bookmarkDto) throws Exception;
}