package com.inno.odag.controller;

import com.inno.odag.service.UserService;
import java.util.Locale;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

  //private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
  private Logger logger = LoggerFactory.getLogger(HomeController.class);

  @Autowired
  private UserService userService;

  @RequestMapping("/sitemap")
  public String sitemap(){
    return "sitemap";
  }

  @RequestMapping("/myapi")
  public String myapi(){
    return "myapi";
  }

  @RequestMapping("/myapi_bookmark")
  public String myapiBookmark(){
    return "myapi_bookmark";
  }

  @RequestMapping("/recommendMycategory")
  public String recommendMycategory(){
      return "recommend_mycategory";
  }

  @RequestMapping("/recommendPopular")
  public String recommendPopular(){
      return "recommend_popular";
  }
  
  @RequestMapping(value = {"/", ""}, method=RequestMethod.GET)
  public String main(){
      return "forward:/index";
  }

  @RequestMapping(value = {"/index"}, method = RequestMethod.GET)
  public String home(Locale locale, Model model) {
    logger.info("<<index>>");
    return "index";
  }

  @RequestMapping(value = "/login", method=RequestMethod.GET)
  public String login(){
    return "login";
  }

  @RequestMapping(value="/logout", method=RequestMethod.GET)
  public String logoutProcess(HttpSession session){

    try{
      session.invalidate();
    }catch(Exception e){ 
    }

    return "redirect:/";
  }

/*
  @RequestMapping(value="/login", method=RequestMethod.POST)
  public String loginProcessing(@ModelAttribute UserDto userDto, HttpSession session) {

    //userDto.setUserName("오픈데이터1");
    //userDto.setUserNo(1);
    
    //System.out.println(">>>>>>song>>>>>>"+userDto.toString());
    logger.info(">>>>>>song>>>>>>"+userDto.toString());
    
    session.setAttribute(User.SESSION_USER, userDto);
    session.setAttribute(User.SESSION_USER_LOGIN_ID, userDto.getUserId());
    session.setAttribute(User.SESSION_USER_USER_ID, userDto.getUserNo());
    
    return "redirect:/api";
    
    //return "/";
  }
*/

  @RequestMapping("/signup")
  public String signup(){
    return "signup";
  }
  
  @RequestMapping("/introduce")
  public String introduce(){
    return "/guide/introduce";
  }

  @RequestMapping("/userSetting")
  public String userSetting(){ 
    return "/setting/user_setting";
  }
  
  @RequestMapping("/adminUser")
  public String adminUser(){
    return "/admin/admin_user";
  }

  @RequestMapping("/adminService")
  public String adminService(){
    return "/admin/admin_service";
  }

  @RequestMapping("/adminOpenapi")
  public String adminOpenapi(){
    return "/admin/admin_openapi";
  }

}