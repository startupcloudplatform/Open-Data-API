package com.inno.odag.handler;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import com.inno.odag.constants.User;
import com.inno.odag.dto.UserDto;
import com.inno.odag.service.UserService;

/**
 * @brief 인증 성공 이벤트를 처리하는 핸들러 클래스
 */

public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

  private Logger logger = LoggerFactory.getLogger(getClass());
  
  //private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);

  @Autowired
  ShaPasswordEncoder passwordEncoder;
  
  @Autowired
  private UserService userService;

  @Override
  public void onAuthenticationSuccess(HttpServletRequest request,
                                      HttpServletResponse response, Authentication authentication)
    throws ServletException, IOException {
      this.setDefaultTargetUrl("/index");

      logger.info("userName : " + authentication.getName());
      logger.info("userAuthority : " + authentication.getAuthorities());
      logger.info("userCredentials : " + authentication.getCredentials());

      Date date = new Date();
      SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
      String strDate = sdf.format(date);
      //userDto.setCreateTime(strDate);
      
      UserDto usertmp = new UserDto();
      usertmp.setUserId(authentication.getName());
      UserDto user = userService.getUserInfo(usertmp);
      
      user.setLastLoginTime(strDate);      
      userService.updateUser(user);
      
      int userNo = 0;
      userNo = user.getUserNo();
      
      request.getSession().removeAttribute(User.SESSION_USER);
      request.getSession().removeAttribute(User.SESSION_USER_LOGIN_ID);
      request.getSession().removeAttribute(User.SESSION_USER_USER_ID);
    
      request.getSession().setAttribute(User.SESSION_USER, user);
      request.getSession().setAttribute(User.SESSION_USER_LOGIN_ID, user.getUserId());
      request.getSession().setAttribute(User.SESSION_USER_USER_ID, Integer.toString(userNo));
      
      //request.getSession().setAttribute(User.SESSION_USER_USER_ID, user.getUserNo());
      //session.setAttribute(User.SESSION_USER, userDto);
      //session.setAttribute(User.SESSION_USER_LOGIN_ID, userDto.getUserId());
      //session.setAttribute(User.SESSION_USER_USER_ID, userDto.getUserNo());
      
      super.onAuthenticationSuccess(request, response, authentication);
  }
}