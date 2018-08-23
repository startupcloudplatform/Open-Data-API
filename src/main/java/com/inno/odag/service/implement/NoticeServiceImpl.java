package com.inno.odag.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inno.odag.dao.NoticeDao;
import com.inno.odag.dto.NoticeDto;
import com.inno.odag.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeDao noticeDao;

    @Override
    public NoticeDto getNoticeInfo(NoticeDto noticeDto) {
        return noticeDao.getNoticeInfo(noticeDto);        
    }

    @Override
    public List<NoticeDto> getNoticeDetailInfos(NoticeDto noticeDto){
        return noticeDao.getNoticeDetailInfos(noticeDto);
    }
    
    @Override
    public List<NoticeDto> getNoticeInfos(NoticeDto noticeDto){
        return noticeDao.getNoticeInfos(noticeDto);
    }

    @Override
    public List<NoticeDto> getNoticeGroup(int noticeGroupNum, int currentPage){
        return noticeDao.getNoticeGroup(noticeGroupNum, currentPage);
    }
    
    @Override
    public int getNoticeNumber() {
        return noticeDao.getNoticeNumber();
    }
    
    @Override
    public int createNotice(NoticeDto noticeDto) {
        return noticeDao.createNoticeInfo(noticeDto);
    }
    
    @Override
    public int updateNotice(NoticeDto noticeDto) {
        return noticeDao.updateNoticeInfo(noticeDto);
    }
    
    @Override
    public int deleteNotice(NoticeDto noticeDto) throws Exception{
        return noticeDao.deleteNoticeInfo(noticeDto);
    }
}