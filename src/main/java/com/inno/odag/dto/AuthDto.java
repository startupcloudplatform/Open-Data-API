package com.inno.odag.dto;

import java.util.ArrayList;
import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class AuthDto implements UserDetails {

  private String _username;
  private String _password;
  private boolean _enabled;
  private Collection<? extends GrantedAuthority> _authorities = new ArrayList<>();

  @Override
  public String getUsername() {
    return _username;
  }

  public void setUsername(String username) {
    _username = username;
  }

  @Override
  public String getPassword() {
    return _password;
  }

  public void setPassword(String password) {
    _password = password;
  }

  public boolean getEnabled() {
    return _enabled;
  }

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    return _authorities;
  }

  public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
    _authorities = authorities;
  }

  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return getEnabled();
  }

  public void setEnabled(boolean enabled) {
    _enabled = enabled;
  }

  @Override
  public boolean equals(Object otherUser) {

    if (!(otherUser instanceof UserDetails)) {
      return false;
    }

    AuthDto user = (AuthDto) otherUser;
    if (!getUsername().equals(user.getUsername())
        || !getPassword().equals(user.getPassword())) {
      return false;
    }

    return true;
  }

  @Override
  public int hashCode() {
    return _username.hashCode();
  }
}
