package com.inno.odag.service;

import java.util.List;

import com.inno.odag.dto.OpenapiDto;
import com.inno.odag.dto.SearchDto;

public interface OpenapiService {
    OpenapiDto getOpenapiInfo(OpenapiDto openapiDto);
    
    int getOpenapiNumber(OpenapiDto openapiDto);
    List<OpenapiDto> getOpenapiGroup(OpenapiDto openapiDto, int openapiGroupNum, int currentPage);

    int getRecentOpenapiNumber(OpenapiDto openapiDto);
    
    List<OpenapiDto> getOpenapiInfos(OpenapiDto openapiDto);
    
    List<OpenapiDto> getPopularOpenapiInfos(OpenapiDto openapiDto);
    List<OpenapiDto> getPopularUseOpenapiInfos(OpenapiDto openapiDto);
    List<OpenapiDto> getPopularDownloadOpenapiInfos(OpenapiDto openapiDto);
    List<OpenapiDto> getPopularBookmarkOpenapiInfos(OpenapiDto openapiDto);
    
    List<OpenapiDto> searchOpenapiInfos(SearchDto searchDto);
    
    int createOpenapi(OpenapiDto openapiDto);
    int updateOpenapi(OpenapiDto openapiDto);
    int deleteOpenapi(OpenapiDto openapiDto) throws Exception;
}
