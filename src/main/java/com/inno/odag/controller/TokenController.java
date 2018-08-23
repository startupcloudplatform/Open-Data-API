package com.inno.odag.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.inno.odag.dto.TokenDto;
import com.inno.odag.service.TokenService;

@Controller
public class TokenController {
    
    private Logger logger = LoggerFactory.getLogger(TokenController.class);
    
    
    @Autowired
    private TokenService tokenService;

    @RequestMapping(value="/tokenInsert", method=RequestMethod.POST)
    public ModelAndView tokenInsert(@ModelAttribute TokenDto tokenDto) {
        logger.info("tokenInsert");
        ModelAndView modelAndView = new ModelAndView("jsonView");       
 
        try {
            tokenService.createToken(tokenDto);
            //modelAndView.addObject("tokenList", tokenList);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
        return modelAndView;
    }
    
    
    @RequestMapping(value="/tokenList", method=RequestMethod.GET)
    public ModelAndView tokenList(@ModelAttribute TokenDto tokenDto) {
        
        logger.info("tokenList!!!");
        ModelAndView modelAndView = new ModelAndView("jsonView");
        List<TokenDto> tokenList;
        
        try {
            tokenList = tokenService.getTokenInfos(tokenDto); // call by userNo
            modelAndView.addObject("tokenList", tokenList);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
        return modelAndView;
    }
    
    @RequestMapping(value="/token", method=RequestMethod.GET)
    public String token() {
        return "token";
    }

/*
    @RequestMapping(value="/tokenCreate", method=RequestMethod.POST)
    public void tokenCreate() {
    }
*/

}