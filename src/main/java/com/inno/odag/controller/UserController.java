package com.inno.odag.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;

import com.inno.odag.dto.BookmarkDto;
import com.inno.odag.dto.CategoryDto;
import com.inno.odag.dto.UserDto;
import com.inno.odag.service.UserService;
import com.inno.odag.constants.User;

@Controller
public class UserController {
//	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
    private Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@RequestMapping(value="/userList", method=RequestMethod.GET)
    public ModelAndView userList(@ModelAttribute UserDto  userDto){
	  logger.info("userList");
	    
	  ModelAndView modelAndView = new ModelAndView("jsonView");
	  List<UserDto> userList;
	  
	  userList = userService.getUserInfos(userDto);
      
      modelAndView.addObject("userList", userList);
      return modelAndView;
    }

	/*
    @RequestMapping(value="/bookmarkList", method=RequestMethod.GET)
    public ModelAndView bookmarkList(@ModelAttribute BookmarkDto bookmarkDto) {
        ModelAndView modelAndView = new ModelAndView("jsonView");
        
        //bookmarkDto.setUserNo(1);
    
        List<BookmarkDto> bookmarkList = bookmarkService.getBookmarkInfos(bookmarkDto);
        
    //bookmarkService.getBookmarkInfo(bookmarkDto);
     * 
        modelAndView.addObject("bookmarkList", bookmarkList);
        
        return modelAndView;
    }	
	*/
 
	@RequestMapping(value="/userCreate", method=RequestMethod.POST)
	public String create(@ModelAttribute UserDto  userDto, HttpSession session, HttpServletRequest servletRequest) {

	  Date date = new Date();
	  SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
	  String strDate = sdf.format(date);
      userDto.setCreateTime(strDate);

	  ShaPasswordEncoder spe = new ShaPasswordEncoder(256);
	  spe.setEncodeHashAsBase64(true);
	  userDto.setUserPw(spe.encodePassword(userDto.getUserPw(), null));

	  logger.info("userPw : " + userDto.getUserPw());
	  logger.info("userCreateTime : " + userDto.getCreateTime());

	        try {
	            userService.createUser(userDto);
	            logger.info("userCreate success");
	        }catch(Exception e) {
	            logger.info("userCreate fail");
	        }

	  return "redirect:/signupResult";
	  //return "<script>location.href = '/signupResult'</script>";
	  //return "forward:index";
	}

	@RequestMapping("/signupResult")
	public String signupResult(){
	  return "signup_result";
	}
	
	@RequestMapping(value="/userUpdate", method=RequestMethod.POST)
	public String update(@ModelAttribute UserDto  userDto, HttpSession session, HttpServletRequest servletRequest){

	    ShaPasswordEncoder spe = new ShaPasswordEncoder(256);
	    spe.setEncodeHashAsBase64(true);
	    userDto.setUserPw(spe.encodePassword(userDto.getUserPw(), null));
	    userDto.setUserNo(Integer.parseInt((String) session.getAttribute(User.SESSION_USER_USER_ID)));
	    
	    logger.info("userUpdate");
	    logger.info("userDto userNo : " + userDto.getUserNo());
	    
	    try {
	        userService.updateUser(userDto);
	        logger.info("userUpdate success");
	    }catch(Exception e) {
	        logger.info("userUpdate fail");
	    }

	    return "redirect:userUpdateResult";
	}

    @RequestMapping("/userUpdateResult")
    public String userUpdateResult(){
      return "setting/user_setting_result_success";
    }	
	
	@RequestMapping(value="/userDelete", method=RequestMethod.POST)
	public String delete(@ModelAttribute UserDto  userDto, HttpSession session, HttpServletRequest servletRequest)
	{
	    
	    
	    UserDto getUserInfo = userService.getUserInfo(userDto);
	    servletRequest.setAttribute("userInfo", getUserInfo);
	    try {
	        userService.deleteUserInfo(userDto);
	    }catch(Exception e) {
	    }
		return "login";
	}

	@RequestMapping(value="/adminUserDelete", method=RequestMethod.POST)
	public void adminUserdelete(@ModelAttribute UserDto  userDto, HttpSession session, HttpServletRequest servletRequest) {
	    
	    logger.info("userDelete");
	    
	    //UserDto getUserInfo = userService.getUserInfo(userDto);
	    //servletRequest.setAttribute("userInfo", getUserInfo);
	    
	    
	    try {
	        userService.deleteUserInfo(userDto);
	        //return "redirect:login";
	    }
	    catch(Exception e) {
	        //return "redirect:login";
	    }
	}
	
	@RequestMapping(value="/userInfo", method=RequestMethod.GET)
	public ModelAndView userInfo(@ModelAttribute UserDto userDto) {
	    
	    ModelAndView modelAndView = new ModelAndView("jsonView");
	    
	    try {
	        UserDto userDto1 = userService.getUserInfo(userDto);
	        modelAndView.addObject("user", userDto1);
	    }
	    catch (Exception e){
	    
	    }  
	    return modelAndView;
	}
}