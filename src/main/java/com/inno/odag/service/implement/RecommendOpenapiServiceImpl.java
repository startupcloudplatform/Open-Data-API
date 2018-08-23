package com.inno.odag.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inno.odag.dao.RecommendOpenapiDao;
import com.inno.odag.dto.RecommendOpenapiDto;
import com.inno.odag.service.RecommendOpenapiService;

@Service
public class RecommendOpenapiServiceImpl implements RecommendOpenapiService{
    
    @Autowired
    private RecommendOpenapiDao recommendOpenapiDao;
    
    @Override 
    public RecommendOpenapiDto getRecommendOpenapiInfo(RecommendOpenapiDto recommendOpenapiDto) {
        return recommendOpenapiDao.getRecommendOpenapiInfo(recommendOpenapiDto);
    }
    
    @Override 
    public List<RecommendOpenapiDto> getRecommendOpenapiInfos(RecommendOpenapiDto recommendOpenapiDto){
        return recommendOpenapiDao.getRecommendOpenapiInfos(recommendOpenapiDto);
    }
    
    @Override 
    public int createRecommendOpenapi(RecommendOpenapiDto recommendOpenapiDto) {
        return recommendOpenapiDao.createRecommendOpenapiInfo(recommendOpenapiDto);
    }
    
    @Override 
    public int updateRecommendOpenapi(RecommendOpenapiDto recommendOpenapiDto) {
        return recommendOpenapiDao.updateRecommendOpenapiInfo(recommendOpenapiDto);
    }
    
    @Override 
    public int deleteRecommendOpenapi(RecommendOpenapiDto recommendOpenapiDto) throws Exception{
        return recommendOpenapiDao.deleteRecommendOpenapiInfo(recommendOpenapiDto);
    }
}
