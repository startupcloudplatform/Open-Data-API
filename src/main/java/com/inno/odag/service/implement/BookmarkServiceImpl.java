package com.inno.odag.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inno.odag.dao.BookmarkDao;
import com.inno.odag.dto.BookmarkDto;
import com.inno.odag.service.BookmarkService;

@Service
public class BookmarkServiceImpl implements BookmarkService{

    @Autowired
    private BookmarkDao bookmarkDao;

    @Override
    public BookmarkDto getBookmarkInfo(BookmarkDto bookmarkDto) {
        return bookmarkDao.getBookmarkInfo(bookmarkDto);
    }

    @Override
    public List<BookmarkDto> getBookmarkInfos(BookmarkDto bookmarkDto){
        return bookmarkDao.getBookmarkInfos(bookmarkDto);
    }

    @Override
    public int createBookmark(BookmarkDto bookmarkDto) {
        return bookmarkDao.createBookmarkInfo(bookmarkDto);
    }

    @Override
    public int updateBookmark(BookmarkDto bookmarkDto) {
        return bookmarkDao.updateBookmarkInfo(bookmarkDto);
    }

    @Override
    public int deleteBookmark(BookmarkDto bookmarkDto) throws Exception{
        return bookmarkDao.deleteBookmarkInfo(bookmarkDto);
    }
}
