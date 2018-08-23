package com.inno.odag.dao;

import java.util.List;
import com.inno.odag.dto.RecommendOpenapiDto;

public interface RecommendOpenapiDao {
    RecommendOpenapiDto getRecommendOpenapiInfo(RecommendOpenapiDto recommendOpenapiDto);
    List<RecommendOpenapiDto> getRecommendOpenapiInfos(RecommendOpenapiDto recommendOpenapiDto);   
    int createRecommendOpenapiInfo(RecommendOpenapiDto recommendOpenapiDto);
    int updateRecommendOpenapiInfo(RecommendOpenapiDto recommendOpenapiDto);
    int deleteRecommendOpenapiInfo(RecommendOpenapiDto recommendOpenapiDto);
}
