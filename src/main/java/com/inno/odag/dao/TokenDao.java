package com.inno.odag.dao;

import java.util.List;
import com.inno.odag.dto.TokenDto;

public interface TokenDao {
    TokenDto getTokenInfo(TokenDto tokenDto);
    List<TokenDto> getTokenInfos(TokenDto tokenDto);
    int createTokenInfo(TokenDto tokenDto);
    int updateTokenInfo(TokenDto tokenDto);
    int deleteTokenInfo(TokenDto tokenDto);
}
