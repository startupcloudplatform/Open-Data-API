package com.inno.odag.service;

import java.util.List;

import com.inno.odag.dto.RecommendOpenapiDto;

public interface RecommendOpenapiService {
    RecommendOpenapiDto getRecommendOpenapiInfo(RecommendOpenapiDto recommendOpenapiDto);
    List<RecommendOpenapiDto> getRecommendOpenapiInfos(RecommendOpenapiDto recommendOpenapiDto);
    int createRecommendOpenapi(RecommendOpenapiDto recommendOpenapiDto);
    int updateRecommendOpenapi(RecommendOpenapiDto recommendOpenapiDto);
    int deleteRecommendOpenapi(RecommendOpenapiDto recommendOpenapiDto) throws Exception;
}
