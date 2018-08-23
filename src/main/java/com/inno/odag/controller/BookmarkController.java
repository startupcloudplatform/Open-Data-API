package com.inno.odag.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.inno.odag.dto.BookmarkDto;
import com.inno.odag.dto.BookmarkOpenapiDto;
import com.inno.odag.dto.OpenapiDto;

import com.inno.odag.service.BookmarkService;
import com.inno.odag.service.BookmarkOpenapiService;
import com.inno.odag.service.OpenapiService;


@Controller
public class BookmarkController {

    Logger logger = LoggerFactory.getLogger(BookmarkController.class);

    @Autowired
    private BookmarkService bookmarkService;

    @Autowired
    private OpenapiService openapiService;
    
    @Autowired
    private BookmarkOpenapiService bookmarkOpenapiService;

    @RequestMapping(value="/bookmarkList", method=RequestMethod.GET)
    public ModelAndView bookmarkList(@ModelAttribute BookmarkDto bookmarkDto) {
        ModelAndView modelAndView = new ModelAndView("jsonView");
        
        //bookmarkDto.setUserNo(1);
    
        List<BookmarkDto> bookmarkList = bookmarkService.getBookmarkInfos(bookmarkDto);
    //bookmarkService.getBookmarkInfo(bookmarkDto);
        modelAndView.addObject("bookmarkList", bookmarkList);
        
        return modelAndView;
    }

    @RequestMapping(value="/bookmarkOpenapiList", method=RequestMethod.GET)
    public ModelAndView bookmarkOpenapiList(@ModelAttribute BookmarkOpenapiDto bookmarkOpenapiDto) {
      ModelAndView modelAndView = new ModelAndView("jsonView");

      List<BookmarkOpenapiDto> bookmarkOpenapiList = bookmarkOpenapiService.getBookmarkOpenapiInfos(bookmarkOpenapiDto);   
      modelAndView.addObject("bookmarkOpenapiList", bookmarkOpenapiList);
      return modelAndView;
    }
 

//  CREATE    
    @RequestMapping(value="/bookmarkCreate", method=RequestMethod.GET)
    public ModelAndView create(@ModelAttribute BookmarkDto  bookmarkDto, HttpSession session, HttpServletRequest servletRequest) {
      ModelAndView modelAndView = new ModelAndView("jsonView");
      
      logger.info("bookmarkName:  " + bookmarkDto.getBookmarkName());
      logger.info("userNo: " + bookmarkDto.getUserNo());
      
      try {
        bookmarkService.createBookmark(bookmarkDto);          
        modelAndView.addObject("bookmarkCreateResult", 1);
      }
      catch(Exception e)
      {
        e.printStackTrace();
        modelAndView.addObject("bookmarkCreateResult", 0);
      }
      
      return modelAndView;
    }

//  UPDATE
    @RequestMapping(value="/bookmarkUpdate", method=RequestMethod.GET)
    public ModelAndView bookmarkUpdate(@ModelAttribute BookmarkDto  bookmarkDto) {
        ModelAndView modelAndView = new ModelAndView("jsonView");
        
        try {
            bookmarkService.updateBookmark(bookmarkDto);
            modelAndView.addObject("bookmarkUpdateResult", 1);
        }
        catch(Exception e){
            e.printStackTrace();
            modelAndView.addObject("bookmarkUpdateResult", 0);
        }
        
        return modelAndView;
    }
    
    
//  CREATE    
    @RequestMapping(value="/bookmarkOpenapiCreate", method=RequestMethod.GET)
    public ModelAndView insertOpenapi(@ModelAttribute BookmarkOpenapiDto  bookmarkOpenapiDto, HttpSession session, HttpServletRequest servletRequest) {
      ModelAndView modelAndView = new ModelAndView("jsonView");
      
      logger.info("bookmarkName: " + bookmarkOpenapiDto.getBookmarkOpenapiNo());
      OpenapiDto tmpOpenapiDto = new OpenapiDto();
      tmpOpenapiDto.setOpenapiNo(bookmarkOpenapiDto.getOpenapiNo());
      tmpOpenapiDto = openapiService.getOpenapiInfo(tmpOpenapiDto);
      tmpOpenapiDto.setOpenapiCntBookmark(tmpOpenapiDto.getOpenapiCntBookmark()+1);

      try {
        bookmarkOpenapiService.createBookmarkOpenapi(bookmarkOpenapiDto);
        modelAndView.addObject("bookmarkOpenapiCreateResult", 1);
        
        try {
            openapiService.updateOpenapi(tmpOpenapiDto);
        }
        catch(Exception e) {
            e.printStackTrace();
        }
      }
      catch(Exception e)
      {
        e.printStackTrace();
        modelAndView.addObject("bookmarkOpenapiCreateResult", 0);
      }
      return modelAndView;
    }
    
// UPDATE
    @RequestMapping(value="/bookmarkOpenapiUpdate", method=RequestMethod.GET)
    public ModelAndView updateBookmarkOpenapi(@ModelAttribute BookmarkOpenapiDto  bookmarkOpenapiDto, HttpSession session, HttpServletRequest servletRequest) {
      ModelAndView modelAndView = new ModelAndView("jsonView");
      
      try {
        bookmarkOpenapiService.updateBookmarkOpenapi(bookmarkOpenapiDto);
        modelAndView.addObject("bookmarkOpenapiCreateResult", 1);
      }
      catch(Exception e)
      {
        e.printStackTrace();
        modelAndView.addObject("bookmarkOpenapiCreateResult", 0);
      }
      
      return modelAndView;
    }

// DELETE
    @RequestMapping(value="/bookmarkDelete", method=RequestMethod.GET)
    public ModelAndView delete(@ModelAttribute BookmarkDto  bookmarkDto, HttpSession session, HttpServletRequest servletRequest) {
      ModelAndView modelAndView = new ModelAndView("jsonView");

      //logger.info("bookmarkName:  " + bookmarkDto.getBookmarkName());
      //logger.info("userNo: " + bookmarkDto.getUserNo());

      try {
        bookmarkService.deleteBookmark(bookmarkDto);
        modelAndView.addObject("bookmarkDeleteResult", 1);
        try {
            bookmarkOpenapiService.deleteBookmarkOpenapiInfos(bookmarkDto);
            modelAndView.addObject("bookmarkDeleteResult", 1);
        }
        catch(Exception e)
        {
            e.printStackTrace();
            modelAndView.addObject("bookmarkDeleteResult", 0);
        }
      }
      catch(Exception e)
      {
        e.printStackTrace();
        modelAndView.addObject("bookmarkDeleteResult", 0);
      }

      return modelAndView;
    }

// DELETE
    @RequestMapping(value="/bookmarkOpenapiDelete", method=RequestMethod.GET)
    public ModelAndView deleteOpenapi(@ModelAttribute BookmarkOpenapiDto  bookmarkOpenapiDto, HttpSession session, HttpServletRequest servletRequest) {
      ModelAndView modelAndView = new ModelAndView("jsonView");

      try {
        bookmarkOpenapiService.deleteBookmarkOpenapi(bookmarkOpenapiDto);
        modelAndView.addObject("bookmarkOpenapiDeleteResult", 1);
      }
      catch(Exception e) {
          e.printStackTrace();
          modelAndView.addObject("bookmarkOpenapiDeleteResult", 0);
      }

      return modelAndView;
    }
}

