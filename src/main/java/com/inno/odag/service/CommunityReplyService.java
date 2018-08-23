package com.inno.odag.service;

import java.util.List;
import com.inno.odag.dto.CommunityReplyDto;

public interface CommunityReplyService {

    CommunityReplyDto getCommunityReplyInfo(CommunityReplyDto communityReplyDto);
    List<CommunityReplyDto> getCommunityReplyInfos(CommunityReplyDto communityReplyDto);
    int createCommunityReply(CommunityReplyDto communityReplyDto);
    int updateCommunityReply(CommunityReplyDto communityReplyDto);
    int deleteCommunityReply(CommunityReplyDto communityReplyDto) throws Exception;
    
}