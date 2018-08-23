package com.inno.odag.service;

import java.util.List;
import com.inno.odag.dto.NoticeDto;

public interface NoticeService {
    
    NoticeDto getNoticeInfo(NoticeDto noticeDto);
    List<NoticeDto> getNoticeDetailInfos(NoticeDto noticeDto);
    List<NoticeDto> getNoticeInfos(NoticeDto noticeDto);

    List<NoticeDto> getNoticeGroup(int noticeGroupNum, int currentPage);
    int getNoticeNumber();
    
    int createNotice(NoticeDto noticeDto);
    int updateNotice(NoticeDto noticeDto);
    int deleteNotice(NoticeDto noticeDto) throws Exception;
    
}