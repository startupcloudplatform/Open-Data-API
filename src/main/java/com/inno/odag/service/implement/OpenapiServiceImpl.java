package com.inno.odag.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inno.odag.dao.OpenapiDao;
import com.inno.odag.dto.NoticeDto;
import com.inno.odag.dto.OpenapiDto;
import com.inno.odag.dto.SearchDto;
import com.inno.odag.service.OpenapiService;

@Service
public class OpenapiServiceImpl implements OpenapiService{
    
    @Autowired
    private OpenapiDao openapiDao;
    
    @Override
    public int getOpenapiNumber(OpenapiDto openapiDto) {
        return openapiDao.getOpenapiNumber(openapiDto);
    }

    @Override
    public List<OpenapiDto> getOpenapiGroup(OpenapiDto openapiDto, int openapiGroupNum, int currentPage){
        return openapiDao.getOpenapiGroup(openapiDto, openapiGroupNum, currentPage);
    }
    
    @Override
    public int getRecentOpenapiNumber(OpenapiDto openapiDto) {
        return openapiDao.getRecentOpenapiNumber(openapiDto);
    }
    
    @Override  
    public OpenapiDto getOpenapiInfo(OpenapiDto openapiDto) {
        return openapiDao.getOpenapiInfo(openapiDto);
    }
    
    @Override  
    public List<OpenapiDto> getOpenapiInfos(OpenapiDto openapiDto){
        return openapiDao.getOpenapiInfos(openapiDto);
    }
    
    @Override  
    public List<OpenapiDto> getPopularOpenapiInfos(OpenapiDto openapiDto){
        return openapiDao.getPopularOpenapiInfos(openapiDto);
    }
    
    @Override    
    public List<OpenapiDto> getPopularUseOpenapiInfos(OpenapiDto openapiDto){
        return openapiDao.getPopularUseOpenapiInfos(openapiDto);
    }
    
    @Override 
    public List<OpenapiDto> getPopularDownloadOpenapiInfos(OpenapiDto openapiDto){
        return openapiDao.getPopularDownloadOpenapiInfos(openapiDto);        
    }
    
    @Override
    public List<OpenapiDto> getPopularBookmarkOpenapiInfos(OpenapiDto openapiDto){
        return openapiDao.getPopularBookmarkOpenapiInfos(openapiDto);        
    }
    
    @Override
    public List<OpenapiDto> searchOpenapiInfos(SearchDto searchDto){
        return openapiDao.searchOpenapiInfos(searchDto);
    }
    
    @Override  
    public int createOpenapi(OpenapiDto openapiDto) {
        return openapiDao.createOpenapiInfo(openapiDto);
    }
    
    @Override  
    public int updateOpenapi(OpenapiDto openapiDto) {
        return openapiDao.updateOpenapiInfo(openapiDto);
    }
    
    @Override  
    public int deleteOpenapi(OpenapiDto openapiDto) throws Exception{
        return openapiDao.deleteOpenapiInfo(openapiDto);
    }
}

