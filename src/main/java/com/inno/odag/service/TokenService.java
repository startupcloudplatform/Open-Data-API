package com.inno.odag.service;

import java.util.List;
import com.inno.odag.dto.TokenDto;

public interface TokenService {
    TokenDto getTokenInfo(TokenDto tokenDto);
    List<TokenDto> getTokenInfos(TokenDto tokenDto);
    int createToken(TokenDto tokenDto);
    int updateToken(TokenDto tokenDto);
    int deleteToken(TokenDto tokenDto) throws Exception;
}
