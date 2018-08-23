package com.inno.odag.dao.implement;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inno.odag.dao.NoticeDao;
import com.inno.odag.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{
    
    @Autowired
    private SqlSession sql;

    @Override
    public NoticeDto getNoticeInfo(NoticeDto noticeDto) {
        return sql.selectOne("notice", noticeDto);
    }
    
    @Override
    public List<NoticeDto> getNoticeInfos(NoticeDto noticeDto){
        return sql.selectList("noticeList", noticeDto); 
    }
    
    @Override
    public List<NoticeDto> getNoticeDetailInfos(NoticeDto noticeDto){
        return sql.selectList("noticeDetail", noticeDto);         
    }

    @Override
    public List<NoticeDto> getNoticeGroup(int noticeGroupNum, int currentPage){

        Map<String, Integer> parameters = new HashMap<String, Integer>();
        parameters.put("noticeGroupNum", noticeGroupNum);
        parameters.put("currentPage", (currentPage-1)*noticeGroupNum);
        
        return sql.selectList("noticeGroupList", parameters);
    }
    
    @Override
    public int getNoticeNumber() {
        return sql.selectOne("noticeNumber");
    }
    
    @Override
    public int createNoticeInfo(NoticeDto noticeDto) {
        return sql.insert("noticeInsert", noticeDto);
    }
    
    @Override
    public int updateNoticeInfo(NoticeDto noticeDto) {
        return sql.update("noticeUpdate", noticeDto);
    }
    
    @Override
    public int deleteNoticeInfo(NoticeDto noticeDto) {
        return sql.delete("noticeDelete", noticeDto);
    }
}