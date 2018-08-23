package com.inno.odag.dao.implement;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inno.odag.dao.OpenidDao;
import com.inno.odag.dto.OpenidDto;

@Repository
public class OpenidDaoImpl implements OpenidDao {
    @Autowired
    private SqlSession sql;
    
    @Override    
    public OpenidDto getOpenidInfo(OpenidDto openidDto) {
        return sql.selectOne("openid", openidDto);
    }
    @Override
    public List<OpenidDto> getOpenidInfos(OpenidDto openidDto){
        return sql.selectList("openidList", openidDto);
    }
    @Override
    public int createOpenidInfo(OpenidDto openidDto) {
        return sql.insert("openidInsert", openidDto);
    }
    @Override
    public int updateOpenidInfo(OpenidDto openidDto) {
        return sql.update("openidUpdate", openidDto);
    }
    @Override
    public int deleteOpenidInfo(OpenidDto openidDto) {
        return sql.delete("openidDelete", openidDto);
    }
}