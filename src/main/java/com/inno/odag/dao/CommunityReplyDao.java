package com.inno.odag.dao;

import java.util.List;
import com.inno.odag.dto.CommunityReplyDto;

public interface CommunityReplyDao {

    CommunityReplyDto getCommunityReplyInfo(CommunityReplyDto communityReplyDto);
    List<CommunityReplyDto> getCommunityReplyInfos(CommunityReplyDto communityReplyDto);
    int createCommunityReplyInfo(CommunityReplyDto communityReplyDto);
    int updateCommunityReplyInfo(CommunityReplyDto communityReplyDto);
    int deleteCommunityReplyInfo(CommunityReplyDto communityReplyDto);
    
}