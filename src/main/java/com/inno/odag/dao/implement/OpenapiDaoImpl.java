package com.inno.odag.dao.implement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inno.odag.dao.OpenapiDao;
import com.inno.odag.dto.NoticeDto;
import com.inno.odag.dto.OpenapiDto;
import com.inno.odag.dto.SearchDto;

@Repository
public class OpenapiDaoImpl implements OpenapiDao{

    @Autowired
    private SqlSession sql;

    @Override    
    public OpenapiDto getOpenapiInfo(OpenapiDto openapiDto) {
        return sql.selectOne("openapi", openapiDto);
    }

    @Override
    public int getOpenapiNumber(OpenapiDto openapiDto) {
        return sql.selectOne("openapiNumber", openapiDto);
    }
    
    
    @Override
    public int getRecentOpenapiNumber(OpenapiDto openapiDto) {
        return sql.selectOne("recentOpenapiNumber", openapiDto);
    }

    @Override
    public List<OpenapiDto> getOpenapiGroup(OpenapiDto openapiDto, int openapiGroupNum, int currentPage){

        Map<String, Object> parameters = new HashMap<String, Object>();

        parameters.put("openapiNo", openapiDto.getOpenapiNo());
        parameters.put("userNo", openapiDto.getUserNo());
        parameters.put("openapiName", openapiDto.getOpenapiName());
        parameters.put("openapiCategory", openapiDto.getOpenapiCategory());
        parameters.put("openapiProvider", openapiDto.getOpenapiProvider());

        parameters.put("openapiGroupNum", openapiGroupNum);
        parameters.put("currentPage", (currentPage-1)*openapiGroupNum);
        
        return sql.selectList("openapiGroupList", parameters);
    }
    
    @Override    
    public List<OpenapiDto> getOpenapiInfos(OpenapiDto openapiDto){
        return sql.selectList("openapi", openapiDto);        
    }

    @Override
    public List<OpenapiDto> getPopularOpenapiInfos(OpenapiDto openapiDto){ 
        return sql.selectList("populaOpenapi", openapiDto);
    }

    @Override    
    public List<OpenapiDto> getPopularUseOpenapiInfos(OpenapiDto openapiDto){
        return sql.selectList("populaUseOpenapi", openapiDto);
    }

    @Override    
    public List<OpenapiDto> getPopularDownloadOpenapiInfos(OpenapiDto openapiDto){
        return sql.selectList("populaDownloadOpenapi", openapiDto);
    }

    @Override    
    public List<OpenapiDto> getPopularBookmarkOpenapiInfos(OpenapiDto openapiDto){
        return sql.selectList("populaBookmarkOpenapi", openapiDto);
    }

    @Override    
    public List<OpenapiDto> searchOpenapiInfos(SearchDto searchDto){
        return sql.selectList("openapiSearch", searchDto);
    }

    @Override
    public int createOpenapiInfo(OpenapiDto openapiDto) {
        return sql.insert("openapiInsert", openapiDto);
    }

    @Override
    public int updateOpenapiInfo(OpenapiDto openapiDto) {
        return sql.update("openapiUpdate", openapiDto);
    }

    @Override
    public int deleteOpenapiInfo(OpenapiDto openapiDto) {
        return sql.delete("openapiDelete", openapiDto);
    }

}
