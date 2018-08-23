package com.inno.odag.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inno.odag.dao.CommunityDao;
import com.inno.odag.dto.CommunityDto;
import com.inno.odag.dto.NoticeDto;
import com.inno.odag.service.CommunityService;

@Service
public class CommunityServiceImpl implements CommunityService{

    @Autowired
    private CommunityDao communityDao;
    
    @Override
    public CommunityDto getCommunityInfo(CommunityDto communityDto) {
        return communityDao.getCommunityInfo(communityDto);        
    }
    
    @Override
    public List<CommunityDto> getCommunityInfos(CommunityDto communityDto){
        return communityDao.getCommunityInfos(communityDto);        
    }

    @Override
    public List<CommunityDto> getCommunityDetailInfos(CommunityDto communityDto){
        return communityDao.getCommunityDetailInfos(communityDto);
    }

    @Override
    public List<CommunityDto> getCommunityGroup(int communityGroupNum, int currentPage){
        return communityDao.getCommunityGroup(communityGroupNum, currentPage);
    }
    
    @Override
    public int getCommunityNumber() {
        return communityDao.getCommunityNumber();
    }
    
    @Override
    public int createCommunity(CommunityDto communityDto) {
        return communityDao.createCommunityInfo(communityDto);
    }
    
    @Override
    public int updateCommunity(CommunityDto communityDto) {
        return communityDao.updateCommunityInfo(communityDto);
    }
    
    @Override
    public int deleteCommunity(CommunityDto communityDto) throws Exception{
        return communityDao.deleteCommunityInfo(communityDto);
    }
}