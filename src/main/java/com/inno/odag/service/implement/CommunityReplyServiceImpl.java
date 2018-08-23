package com.inno.odag.service.implement;

import java.util.List;

import com.inno.odag.dto.CommunityReplyDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inno.odag.dao.CommunityReplyDao;
import com.inno.odag.service.CommunityReplyService;

@Service
public class CommunityReplyServiceImpl implements CommunityReplyService{
    
    @Autowired
    private CommunityReplyDao communityReplyDao;

    @Override
    public CommunityReplyDto getCommunityReplyInfo(CommunityReplyDto communityReplyDto) {
        return communityReplyDao.getCommunityReplyInfo(communityReplyDto);        
    }
    
    @Override
    public List<CommunityReplyDto> getCommunityReplyInfos(CommunityReplyDto communityReplyDto){
        return communityReplyDao.getCommunityReplyInfos(communityReplyDto);
    }
    
    @Override
    public int createCommunityReply(CommunityReplyDto communityReplyDto) {
        return communityReplyDao.createCommunityReplyInfo(communityReplyDto);
    }
    
    @Override
    public int updateCommunityReply(CommunityReplyDto communityReplyDto) {
        return communityReplyDao.updateCommunityReplyInfo(communityReplyDto);
    }
    
    @Override
    public int deleteCommunityReply(CommunityReplyDto communityReplyDto) throws Exception{
        return communityReplyDao.deleteCommunityReplyInfo(communityReplyDto);
    }
}
