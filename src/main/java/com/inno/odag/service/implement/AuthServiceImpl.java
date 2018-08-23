package com.inno.odag.service.implement;

import com.inno.odag.dao.UserDao;
import com.inno.odag.dto.AuthDto;
import com.inno.odag.dto.UserDto;
import com.inno.odag.service.AuthService;
import java.util.ArrayList;
import java.util.Collection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AuthServiceImpl implements AuthService {

  private static final Logger logger = LoggerFactory.getLogger(AuthServiceImpl.class);

  @Autowired
  private UserDao userDao;

  @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
  @Override
  public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
    UserDto userDto = userDao.getUserInfo(new UserDto(){{
      setUserId(username);
    }});

    if (userDto == null)
      throw new UsernameNotFoundException("Username not found : " + username);

    AuthDto loginUser = new AuthDto();
    loginUser.setUsername(userDto.getUserId());
    loginUser.setPassword(userDto.getUserPw());
    loginUser.setEnabled(true);
    
    Collection<GrantedAuthority> authorities = new ArrayList<>();

    SimpleGrantedAuthority authority;

    authority = new SimpleGrantedAuthority("ROLE_USER");
    
    /*
    if(userDto.getUserType()==2) {
        authority = new SimpleGrantedAuthority("ROLE_MANAGER");
    }
    else if(userDto.getUserType()==0) {
        authority = new SimpleGrantedAuthority("ROLE_ADMIN");
    }
    else {
        authority = new SimpleGrantedAuthority("ROLE_USER");
    }
    */
    
    authorities.add(authority);
    loginUser.setAuthorities(authorities);

    return loginUser;
  }
}
