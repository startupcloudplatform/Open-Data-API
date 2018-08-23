package com.inno.odag.dao;

import java.util.List;
import com.inno.odag.dto.NoticeDto;

public interface NoticeDao {

    NoticeDto getNoticeInfo(NoticeDto noticeDto);
    List<NoticeDto> getNoticeDetailInfos(NoticeDto noticeDto);
    List<NoticeDto> getNoticeInfos(NoticeDto noticeDto);
    
    List<NoticeDto> getNoticeGroup(int noticeGroupNum, int currentPage);
    int getNoticeNumber();
    
    int createNoticeInfo(NoticeDto noticeDto);
    int updateNoticeInfo(NoticeDto noticeDto);
    int deleteNoticeInfo(NoticeDto noticeDto);

}