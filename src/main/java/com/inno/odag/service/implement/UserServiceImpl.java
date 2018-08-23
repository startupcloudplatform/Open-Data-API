/**
 * 
 */
package com.inno.odag.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inno.odag.dao.UserDao;
import com.inno.odag.dto.UserDto;
import com.inno.odag.service.UserService;

/**
 * @author cgs
 *
 */
@Service
public class UserServiceImpl implements UserService {
    
    @Autowired
    private UserDao userDao;

    /* (non-Javadoc)
     * @see com.inno.study.service.UserService#createUser(com.inno.study.dto.UserDto)
     */
    @Override
    public int createUser(UserDto userDto) {
        // TODO Auto-generated method stub
        return userDao.createUserInfo(userDto);
    }

    /* (non-Javadoc)
     * @see com.inno.study.service.UserService#updateUser(com.inno.study.dto.UserDto)
     */
    @Override
    public int updateUser(UserDto userDto) {
        // TODO Auto-generated method stub
        return userDao.updateUserInfo(userDto);
    }

    /* (non-Javadoc)
     * @see com.inno.study.service.UserService#getUserInfo(com.inno.study.dto.UserDto)
     */
    @Override
    public UserDto getUserInfo(UserDto userDto) {
        // TODO Auto-generated method stub
        return userDao.getUserInfo(userDto);
    }

    /* (non-Javadoc)
     * @see com.inno.study.service.UserService#getUserInfos(com.inno.study.dto.UserDto)
     */
    @Override
    public List<UserDto> getUserInfos(UserDto userDto) {
        // TODO Auto-generated method stub
        return userDao.getUserInfos(userDto);
    }
    
    @Override
    public int deleteUserInfo(UserDto userDto) throws Exception{
        
        int result = userDao.deleteUserInfo(userDto);
        
        if (result == 0) {
            throw new Exception("That's No No No!");
        }
                
        return result;
    }
}
