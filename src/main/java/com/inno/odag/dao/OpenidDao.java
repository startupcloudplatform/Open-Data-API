package com.inno.odag.dao;

import java.util.List;
import com.inno.odag.dto.OpenidDto;

public interface OpenidDao {
    OpenidDto getOpenidInfo(OpenidDto openidDto);
    List<OpenidDto> getOpenidInfos(OpenidDto openidDto);
    int createOpenidInfo(OpenidDto openidDto);
    int updateOpenidInfo(OpenidDto openidDto);
    int deleteOpenidInfo(OpenidDto openidDto);
}
