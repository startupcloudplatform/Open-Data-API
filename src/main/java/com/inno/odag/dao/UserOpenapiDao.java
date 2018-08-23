package com.inno.odag.dao;

import java.util.List;
import com.inno.odag.dto.UserOpenapiDto;

public interface UserOpenapiDao {
    UserOpenapiDto getUserOpenapiInfo(UserOpenapiDto userOpenapiDto);
    List<UserOpenapiDto> getUserOpenapiInfos(UserOpenapiDto userOpenapiDto);
    int createUserOpenapiInfo(UserOpenapiDto userOpenapiDto);
    int updateUserOpenapiInfo(UserOpenapiDto userOpenapiDto);
    int deleteUserOpenapiInfo(UserOpenapiDto userOpenapiDto);
}
