package com.inno.odag.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inno.odag.dao.OpenidDao;
import com.inno.odag.dto.OpenidDto;
import com.inno.odag.service.OpenidService;

@Service
public class OpenidServiceImpl implements OpenidService{
    
    @Autowired
    private OpenidDao openidDao;
 
    @Override 
    public OpenidDto getOpenidInfo(OpenidDto openidDto) {
        return openidDao.getOpenidInfo(openidDto);
    }
    
    @Override 
    public List<OpenidDto> getOpenidInfos(OpenidDto openidDto){
        return openidDao.getOpenidInfos(openidDto); 
    }
    
    @Override 
    public int createOpenid(OpenidDto openidDto) {
        return openidDao.createOpenidInfo(openidDto);
    }
    
    @Override 
    public int updateOpenid(OpenidDto openidDto) {
        return openidDao.updateOpenidInfo(openidDto);
    }
    
    @Override 
    public int deleteOpenid(OpenidDto openidDto) throws Exception{
        return openidDao.deleteOpenidInfo(openidDto);
    }
}
