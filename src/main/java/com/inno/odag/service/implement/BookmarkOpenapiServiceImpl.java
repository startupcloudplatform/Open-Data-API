package com.inno.odag.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inno.odag.dao.BookmarkOpenapiDao;
import com.inno.odag.dto.BookmarkOpenapiDto;
import com.inno.odag.dto.BookmarkDto;
import com.inno.odag.service.BookmarkOpenapiService;

@Service
public class BookmarkOpenapiServiceImpl implements BookmarkOpenapiService{

    @Autowired
    private BookmarkOpenapiDao bookmarkOpenapiDao;

    @Override
    public BookmarkOpenapiDto getBookmarkOpenapiInfo(BookmarkOpenapiDto bookmarkOpenapiDto) {
        return bookmarkOpenapiDao.getBookmarkOpenapiInfo(bookmarkOpenapiDto);
    }

    @Override
    public List<BookmarkOpenapiDto> getBookmarkOpenapiInfos(BookmarkOpenapiDto bookmarkOpenapiDto){
        return bookmarkOpenapiDao.getBookmarkOpenapiInfos(bookmarkOpenapiDto);
    }

    @Override
    public int createBookmarkOpenapi(BookmarkOpenapiDto bookmarkOpenapiDto) {
        return bookmarkOpenapiDao.createBookmarkOpenapiInfo(bookmarkOpenapiDto);
    }

    @Override
    public int updateBookmarkOpenapi(BookmarkOpenapiDto bookmarkOpenapiDto) {
        return bookmarkOpenapiDao.updateBookmarkOpenapiInfo(bookmarkOpenapiDto);
    }

    @Override
    public int deleteBookmarkOpenapi(BookmarkOpenapiDto bookmarkOpenapiDto) throws Exception{
        return bookmarkOpenapiDao.deleteBookmarkOpenapiInfo(bookmarkOpenapiDto);
    }

    @Override
    public int deleteBookmarkOpenapiInfos(BookmarkDto bookmarkDto) throws Exception{
        return bookmarkOpenapiDao.deleteBookmarkOpenapiInfos(bookmarkDto);
    }
}