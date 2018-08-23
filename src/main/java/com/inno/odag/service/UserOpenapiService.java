package com.inno.odag.service;

import java.util.List;

import com.inno.odag.dto.UserOpenapiDto;

public interface UserOpenapiService {
    UserOpenapiDto getUserOpenapiInfo(UserOpenapiDto userOpenapiDto);
    List<UserOpenapiDto> getUserOpenapiInfos(UserOpenapiDto userOpenapiDto);
    int createUserOpenapi(UserOpenapiDto userOpenapiDto);
    int updateUserOpenapi(UserOpenapiDto userOpenapiDto);
    int deleteUserOpenapi(UserOpenapiDto userOpenapiDto) throws Exception;
}
