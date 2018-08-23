package com.inno.odag.handler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;

import com.inno.odag.constants.User;

public class LogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {

  private static final Logger logger = LoggerFactory.getLogger(LogoutSuccessHandler.class);

  @Override
  public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
    this.setDefaultTargetUrl("/index");
    
    request.getSession().removeAttribute(User.SESSION_USER);
    request.getSession().removeAttribute(User.SESSION_USER_LOGIN_ID);
    request.getSession().removeAttribute(User.SESSION_USER_USER_ID);
    request.getSession().invalidate();

    super.onLogoutSuccess(request, response, authentication);
  }
}
