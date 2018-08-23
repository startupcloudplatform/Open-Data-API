package com.inno.odag.dao.implement;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inno.odag.dao.BookmarkOpenapiDao;
import com.inno.odag.dto.BookmarkOpenapiDto;
import com.inno.odag.dto.BookmarkDto;


@Repository
public class BookmarkOpenapiDaoImpl implements BookmarkOpenapiDao{

    @Autowired
    private SqlSession sql;

    @Override
    public BookmarkOpenapiDto getBookmarkOpenapiInfo(BookmarkOpenapiDto bookmarkOpenapiDto) {
        return sql.selectOne("bookmarkOpenapi", bookmarkOpenapiDto);
    }
    
    @Override
    public List<BookmarkOpenapiDto> getBookmarkOpenapiInfos(BookmarkOpenapiDto bookmarkOpenapiDto){
        return sql.selectList("bookmarkOpenapiList", bookmarkOpenapiDto);
    }

    @Override
    public int createBookmarkOpenapiInfo(BookmarkOpenapiDto bookmarkOpenapiDto) {
        return sql.insert("bookmarkOpenapiInsert", bookmarkOpenapiDto);
    }
    
    @Override
    public int updateBookmarkOpenapiInfo(BookmarkOpenapiDto bookmarkOpenapiDto) {
        return sql.update("bookmarkOpenapiUpdate", bookmarkOpenapiDto);
    }
    
    @Override    
    public int deleteBookmarkOpenapiInfo(BookmarkOpenapiDto bookmarkOpenapiDto) {
        return sql.delete("bookmarkOpenapiDelete", bookmarkOpenapiDto);
    }
    
    @Override
    public int deleteBookmarkOpenapiInfos(BookmarkDto bookmarkDto) {
        return sql.delete("bookmarkOpenapiInfosDelete", bookmarkDto);        
    }
    
}

