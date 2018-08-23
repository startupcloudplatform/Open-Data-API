package com.inno.odag.dao.implement;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inno.odag.dao.BookmarkDao;
import com.inno.odag.dto.BookmarkDto;

@Repository
public class BookmarkDaoImpl implements BookmarkDao{

    @Autowired
    private SqlSession sql;

    @Override
    public BookmarkDto getBookmarkInfo(BookmarkDto bookmarkDto) {
        return sql.selectOne("bookmark", bookmarkDto);
    }
    
    @Override
    public List<BookmarkDto> getBookmarkInfos(BookmarkDto bookmarkDto){
        return sql.selectList("bookmarkList", bookmarkDto);
    }

    @Override
    public int createBookmarkInfo(BookmarkDto bookmarkDto) {
        return sql.insert("bookmarkInsert", bookmarkDto);
    }
    
    @Override
    public int updateBookmarkInfo(BookmarkDto bookmarkDto) {
        return sql.update("bookmarkUpdate", bookmarkDto);
    }
    
    @Override    
    public int deleteBookmarkInfo(BookmarkDto bookmarkDto) {
        return sql.delete("bookmarkDelete", bookmarkDto);
    }
}