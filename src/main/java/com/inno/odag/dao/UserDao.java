package com.inno.odag.dao;

import java.util.List;
import com.inno.odag.dto.UserDto;

public interface UserDao {
    int createUserInfo(UserDto userDto);
    
    UserDto getUserInfo(UserDto userDto);
    
    List<UserDto> getUserInfos(UserDto userDto);
    
    int updateUserInfo(UserDto userDto);
    int deleteUserInfo(UserDto userDto);
}