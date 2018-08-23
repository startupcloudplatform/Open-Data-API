package com.inno.odag.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inno.odag.dao.TokenDao;
import com.inno.odag.dto.TokenDto;
import com.inno.odag.service.TokenService;

@Service
public class TokenServiceImpl implements TokenService{
    @Autowired
    private TokenDao tokenDao;
    
    @Override 
    public TokenDto getTokenInfo(TokenDto tokenDto) {
        return tokenDao.getTokenInfo(tokenDto);
    }
    
    @Override 
    public List<TokenDto> getTokenInfos(TokenDto tokenDto){
        return tokenDao.getTokenInfos(tokenDto);
    }
    
    @Override 
    public int createToken(TokenDto tokenDto) {
        return tokenDao.createTokenInfo(tokenDto);
    }
    
    @Override 
    public int updateToken(TokenDto tokenDto) {
        return tokenDao.updateTokenInfo(tokenDto);        
    }
    
    @Override 
    public int deleteToken(TokenDto tokenDto) throws Exception{
        return tokenDao.deleteTokenInfo(tokenDto);
    }
}
