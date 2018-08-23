package com.inno.odag.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inno.odag.dto.UserOpenapiDto;
import com.inno.odag.dao.UserOpenapiDao;
import com.inno.odag.service.UserOpenapiService;

@Service
public class UserOpenapiServiceImpl implements UserOpenapiService {

    @Autowired
    private UserOpenapiDao userOpenapiDao;
    
    @Override
    public UserOpenapiDto getUserOpenapiInfo(UserOpenapiDto userOpenapiDto) {
        return userOpenapiDao.getUserOpenapiInfo(userOpenapiDto);
    }
    @Override
    public List<UserOpenapiDto> getUserOpenapiInfos(UserOpenapiDto userOpenapiDto){
        return userOpenapiDao.getUserOpenapiInfos(userOpenapiDto);        
    }
    @Override
    public int createUserOpenapi(UserOpenapiDto userOpenapiDto) {
        return userOpenapiDao.createUserOpenapiInfo(userOpenapiDto);
    }
    @Override
    public int updateUserOpenapi(UserOpenapiDto userOpenapiDto) {
        return userOpenapiDao.updateUserOpenapiInfo(userOpenapiDto);
    }
    @Override
    public int deleteUserOpenapi(UserOpenapiDto userOpenapiDto) throws Exception{
        return userOpenapiDao.deleteUserOpenapiInfo(userOpenapiDto);
    }
}