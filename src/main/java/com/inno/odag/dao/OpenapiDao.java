package com.inno.odag.dao;

import java.util.List;

import com.inno.odag.dto.NoticeDto;
import com.inno.odag.dto.OpenapiDto;
import com.inno.odag.dto.SearchDto;

public interface OpenapiDao {

    OpenapiDto getOpenapiInfo(OpenapiDto openapiDto);

    int getOpenapiNumber(OpenapiDto openapiDto);
    int getRecentOpenapiNumber(OpenapiDto openapiDto);
    List<OpenapiDto> getOpenapiGroup(OpenapiDto openapiDto, int openapiGroupNum, int currentPage);

    List<OpenapiDto> getOpenapiInfos(OpenapiDto openapiDto);
    List<OpenapiDto> getPopularOpenapiInfos(OpenapiDto openapiDto);    
    List<OpenapiDto> getPopularUseOpenapiInfos(OpenapiDto openapiDto);
    List<OpenapiDto> getPopularDownloadOpenapiInfos(OpenapiDto openapiDto);
    List<OpenapiDto> getPopularBookmarkOpenapiInfos(OpenapiDto openapiDto);
    
    List<OpenapiDto> searchOpenapiInfos(SearchDto searchDto);
    int createOpenapiInfo(OpenapiDto openapiDto);
    int updateOpenapiInfo(OpenapiDto openapiDto);
    int deleteOpenapiInfo(OpenapiDto openapiDto);

}
