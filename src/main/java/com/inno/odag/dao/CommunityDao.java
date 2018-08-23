package com.inno.odag.dao;

import java.util.List;
import com.inno.odag.dto.CommunityDto;
import com.inno.odag.dto.NoticeDto;

public interface CommunityDao {
    
    CommunityDto getCommunityInfo(CommunityDto communityDto);
    List<CommunityDto> getCommunityDetailInfos(CommunityDto communityDto);
    List<CommunityDto> getCommunityInfos(CommunityDto communityDto);

    List<CommunityDto> getCommunityGroup(int communityGroupNum, int currentPage);
    int getCommunityNumber();    
    
    int createCommunityInfo(CommunityDto communityDto);
    int updateCommunityInfo(CommunityDto communityDto);
    int deleteCommunityInfo(CommunityDto communityDto);

}