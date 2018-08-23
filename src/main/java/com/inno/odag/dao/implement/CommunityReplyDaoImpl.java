package com.inno.odag.dao.implement;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inno.odag.dao.CommunityReplyDao;
import com.inno.odag.dto.CommunityReplyDto;

@Repository
public class CommunityReplyDaoImpl implements CommunityReplyDao{

    @Autowired
    private SqlSession sql;

    @Override
    public CommunityReplyDto getCommunityReplyInfo(CommunityReplyDto communityReplyDto) {
        return sql.selectOne("communityReply", communityReplyDto); 
    }
    
    @Override
    public List<CommunityReplyDto> getCommunityReplyInfos(CommunityReplyDto communityReplyDto){
        return sql.selectList("communityReplyList", communityReplyDto);
    }
    
    @Override
    public int createCommunityReplyInfo(CommunityReplyDto communityReplyDto) {
        return sql.insert("communityReplyInsert", communityReplyDto);
    }
    
    @Override
    public int updateCommunityReplyInfo(CommunityReplyDto communityReplyDto) {
        return sql.update("communityReplyUpdate", communityReplyDto);
    }
    
    @Override
    public int deleteCommunityReplyInfo(CommunityReplyDto communityReplyDto) {
        return sql.delete("communityReplyDelete", communityReplyDto);
    }
}

/*
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
*/