package com.inno.odag.dao.implement;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inno.odag.dao.RecommendOpenapiDao;
import com.inno.odag.dto.RecommendOpenapiDto;

@Repository
public class RecommendOpenapiDaoImpl implements RecommendOpenapiDao {
    @Autowired
    private SqlSession sql;

    @Override     
    public RecommendOpenapiDto getRecommendOpenapiInfo(RecommendOpenapiDto recommendOpenapiDto) {
        return sql.selectOne("recommendOpenapi", recommendOpenapiDto);
    }
    @Override     
    public List<RecommendOpenapiDto> getRecommendOpenapiInfos(RecommendOpenapiDto recommendOpenapiDto){
        return sql.selectList("recommendOpenapiList", recommendOpenapiDto);
    }
    @Override 
    public int createRecommendOpenapiInfo(RecommendOpenapiDto recommendOpenapiDto) {
        return sql.insert("recommendOpenapiInsert", recommendOpenapiDto);
    }
    @Override 
    public int updateRecommendOpenapiInfo(RecommendOpenapiDto recommendOpenapiDto) {
        return sql.insert("recommendOpenapiUpdate", recommendOpenapiDto);
    }
    @Override 
    public int deleteRecommendOpenapiInfo(RecommendOpenapiDto recommendOpenapiDto) {
        return sql.delete("recommendOpenapiDelete", recommendOpenapiDto);
    }
}