package com.inno.odag.service;

import java.util.List;
import com.inno.odag.dto.CommunityDto;
import com.inno.odag.dto.NoticeDto;

public interface CommunityService {

    CommunityDto getCommunityInfo(CommunityDto communityDto);
    List<CommunityDto> getCommunityInfos(CommunityDto communityDto);
    List<CommunityDto> getCommunityDetailInfos(CommunityDto communityDto);
    
    List<CommunityDto> getCommunityGroup(int communityGroupNum, int currentPage);
    int getCommunityNumber();
    
    int createCommunity(CommunityDto communityDto);
    int updateCommunity(CommunityDto communityDto);
    int deleteCommunity(CommunityDto communityDto) throws Exception;

}