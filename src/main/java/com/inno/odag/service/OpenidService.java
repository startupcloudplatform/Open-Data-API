package com.inno.odag.service;

import java.util.List;
import com.inno.odag.dto.OpenidDto;

public interface OpenidService {
    OpenidDto getOpenidInfo(OpenidDto openidDto);
    List<OpenidDto> getOpenidInfos(OpenidDto openidDto);
    int createOpenid(OpenidDto openidDto);
    int updateOpenid(OpenidDto openidDto);
    int deleteOpenid(OpenidDto openidDto) throws Exception;
}
