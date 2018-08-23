package com.inno.odag.service;

import java.util.List;
import com.inno.odag.dto.UserDto;

public interface UserService {
    UserDto getUserInfo(UserDto userDto);
    List<UserDto> getUserInfos(UserDto userDto);
    int createUser(UserDto userDto);
    int updateUser(UserDto userDto);
    int deleteUserInfo(UserDto userDto) throws Exception;
}