package com.inno.odag.provider;

import com.inno.odag.dto.AuthDto;
import com.inno.odag.service.AuthService;
import java.util.Collection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

  private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);
  @Autowired
  AuthService authService;

//  @Autowired
//  ShaPasswordEncoder passwordEncoder;

  @Override
  public Authentication authenticate(Authentication authentication) throws AuthenticationException {
    String username = authentication.getName();
    String password = (String) authentication.getCredentials();
    AuthDto authDto;
    Collection<? extends GrantedAuthority> authorities;

    ShaPasswordEncoder passwordEncoder = new ShaPasswordEncoder(256);
    
    try {
      authDto = (AuthDto)authService.loadUserByUsername(username);

      passwordEncoder.setEncodeHashAsBase64(true);
      String hashedPassword = passwordEncoder.encodePassword(password, null);

      logger.info("username : " + username + " / password : " + password + " / hash password : "+ hashedPassword);
      logger.info("username : " + authDto.getUsername() + " / password : " + authDto.getPassword());

      if (!hashedPassword.equals(authDto.getPassword())) {
        throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
      }
      authorities = authDto.getAuthorities();
    } catch (UsernameNotFoundException e) {
      logger.info(e.toString());
      throw new UsernameNotFoundException(e.getMessage());
    } catch (BadCredentialsException e) {
      logger.info(e.toString());
      throw new BadCredentialsException(e.getMessage());
    } catch (Exception e) {
      logger.info(e.toString());
      throw new RuntimeException(e.getMessage());
    }
    return new UsernamePasswordAuthenticationToken(authDto, password, authorities);
  }

  @Override
  public boolean supports(Class<?> arg0) {
    return true;
  }
}


