package com.inno.odag.dao.implement;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inno.odag.dao.TokenDao;
import com.inno.odag.dto.TokenDto;

@Repository
public class TokenDaoImpl implements TokenDao{
    @Autowired
    private SqlSession sql;

    @Override
    public TokenDto getTokenInfo(TokenDto tokenDto) {
        return sql.selectOne("token", tokenDto);
    }
    @Override
    public List<TokenDto> getTokenInfos(TokenDto tokenDto){
        return sql.selectList("token", tokenDto);
    }
    @Override
    public int createTokenInfo(TokenDto tokenDto) {
        return sql.insert("tokenInsert", tokenDto);   
    }
    @Override
    public int updateTokenInfo(TokenDto tokenDto) {
        return sql.update("tokenUpdate", tokenDto);  
    }
    @Override
    public int deleteTokenInfo(TokenDto tokenDto) {
        return sql.delete("tokenDelete", tokenDto);
    }
}
