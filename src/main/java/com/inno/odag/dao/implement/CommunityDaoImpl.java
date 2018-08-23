package com.inno.odag.dao.implement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inno.odag.dao.CommunityDao;
import com.inno.odag.dto.CommunityDto;
import com.inno.odag.dto.NoticeDto;

@Repository
public class CommunityDaoImpl implements CommunityDao{

    @Autowired
    private SqlSession sql;

    @Override
    public CommunityDto getCommunityInfo(CommunityDto communityDto) {
        return sql.selectOne("community", communityDto);        
    }

    @Override
    public List<CommunityDto> getCommunityInfos(CommunityDto communityDto){
        return sql.selectList("communityList", communityDto);        
    }

    @Override
    public List<CommunityDto> getCommunityDetailInfos(CommunityDto communityDto){
        return sql.selectList("communityDetail", communityDto);         
    }

    @Override
    public List<CommunityDto> getCommunityGroup(int communityGroupNum, int currentPage){

        Map<String, Integer> parameters = new HashMap<String, Integer>();
        parameters.put("communityGroupNum", communityGroupNum);
        parameters.put("currentPage", (currentPage-1)*communityGroupNum);
        
        return sql.selectList("communityGroupList", parameters);
    }
    
    @Override
    public int getCommunityNumber() {
        return sql.selectOne("communityNumber");
    }
    
    @Override
    public int createCommunityInfo(CommunityDto communityDto) {
        return sql.insert("communityInsert", communityDto);
    }
    
    @Override
    public int updateCommunityInfo(CommunityDto communityDto) {
        return sql.update("communityUpdate", communityDto);
    }
    
    @Override
    public int deleteCommunityInfo(CommunityDto communityDto) {
        return sql.delete("communityDelete", communityDto);
    }
}