package com.inno.odag.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.inno.odag.dto.NoticeDto;
import com.inno.odag.service.NoticeService;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class NoticeController {
    private Logger logger = LoggerFactory.getLogger(NoticeController.class);

    private static int currentPage = 0;

    private static int totalNoticeNum = 0;
    private static int noticeGroupNum = 5;
    private static int pageGroupNum = 5;

    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/notice")
    public String notice(HttpSession session){

        session.setAttribute("SESSION_USER_CURRENT_NOTICE_PAGE", 1);
        session.setAttribute("SESSION_USER_CURRENT_NOTICE_PAGE_GROUP", 1);

        return "/guide/notice";
    }

    @RequestMapping("/noticeForm")
    public String noticeForm(){

      return "/guide/notice_form";
    }

    @RequestMapping("/noticeGroupList")
    public ModelAndView noticeGroupList(HttpSession session, int currentNoticeGroupNum){
        ModelAndView modelAndView = new ModelAndView("jsonView");
        List<NoticeDto> noticeList = new ArrayList<NoticeDto>();
        
        session.setAttribute("SESSION_USER_CURRENT_NOTICE_PAGE", currentNoticeGroupNum);
        
        logger.info("SESSION_USER_CURRENT_NOTICE_PAGE : "+session.getAttribute("SESSION_USER_CURRENT_NOTICE_PAGE"));
        
        noticeList = noticeService.getNoticeGroup(noticeGroupNum, (int)session.getAttribute("SESSION_USER_CURRENT_NOTICE_PAGE")); 
        modelAndView.addObject("noticeGroupList", noticeList);
        
        return modelAndView;
    }

    @RequestMapping("/noticePageGroupList")
    public ModelAndView noticePageGroupList(HttpSession session, int currentPageGroupMove){

        ModelAndView modelAndView = new ModelAndView("jsonView");
        
        ArrayList<Integer> noticePageList = new ArrayList<>();
        ArrayList<Integer> noticeGroupPageList = new ArrayList<>();
                
        int noticePageLast = 0;
        int totalPageNum = 0;
        int maximumpageGroupNum = 0;
        int noticeDirection = 1;
              
        int noticeNum = noticeService.getNoticeNumber();

        for(int i=1; noticeNum-((i-1)*noticeGroupNum) > 0; i++) {
           noticePageList.add(i);
           
           if(noticeNum-(i*noticeGroupNum)<=0)
               noticePageLast = i;

           totalPageNum++;
        } // ex1) 7, 3 > 7, 4, 1(1, 2, 3) ex2) 32, 5 > 32, 27, 22, 17, 12, 7, 2(1, 2, 3, 4, 5, 6, 7)

        maximumpageGroupNum = totalPageNum/pageGroupNum;
        if(totalPageNum%pageGroupNum>0)
            maximumpageGroupNum++;
        
        if(currentPageGroupMove == 1 && (int)session.getAttribute("SESSION_USER_CURRENT_NOTICE_PAGE_GROUP") != maximumpageGroupNum)
            session.setAttribute("SESSION_USER_CURRENT_NOTICE_PAGE_GROUP", (int)session.getAttribute("SESSION_USER_CURRENT_NOTICE_PAGE_GROUP")+1);
        else if(currentPageGroupMove == 2 && (int)session.getAttribute("SESSION_USER_CURRENT_NOTICE_PAGE_GROUP") != 1) {
            session.setAttribute("SESSION_USER_CURRENT_NOTICE_PAGE_GROUP", (int)session.getAttribute("SESSION_USER_CURRENT_NOTICE_PAGE_GROUP")-1);
            noticeDirection = 2;    
        }
        else if(currentPageGroupMove == 3)
            session.setAttribute("SESSION_USER_CURRENT_NOTICE_PAGE_GROUP", 1);
        else if(currentPageGroupMove == 4) {
            session.setAttribute("SESSION_USER_CURRENT_NOTICE_PAGE_GROUP", maximumpageGroupNum);
            noticeDirection = 2;
        }
        //session.setAttribute("SESSION_USER_CURRENT_NOTICE_PAGE", noticePageLast);
        
        for(int j=0; j<pageGroupNum; j++){

            //if(noticePageList.get(j+(pageGroupNum*((int)session.getAttribute("SESSION_USER_CURRENT_NOTICE_PAGE")-1))) == null)
            //    break;
            
            noticeGroupPageList.add(noticePageList.get(j+(pageGroupNum*((int)session.getAttribute("SESSION_USER_CURRENT_NOTICE_PAGE_GROUP")-1))));
            //noticeGroupPageList.add(noticePageList.get(j+(pageGroupNum*(2-1))));
            
            if(noticePageList.get(j+(pageGroupNum*((int)session.getAttribute("SESSION_USER_CURRENT_NOTICE_PAGE_GROUP")-1))) == noticePageLast)
                break;
        }

        /*
        totalPageNum
        pageGroupNum

        for(int j=0; j<pageGroupNum; j++){
            noticeGroupPageList.add(noticePageList[j+(pageGroupNum*((int)session.getAttribute("SESSION_USER_CURRENT_NOTICE_PAGE")-1))]);
        }

        session.getAttribute("SESSION_USER_CURRENT_NOTICE_PAGE")
        */
        
        //modelAndView.addObject("noticeNumber", noticeNum);
        //modelAndView.addObject("pageGroupNum", pageGroupNum);
        
        modelAndView.addObject("noticePageList", noticePageList);
        modelAndView.addObject("noticePageLast", noticePageLast);
        modelAndView.addObject("noticeGroupPageList", noticeGroupPageList);
        modelAndView.addObject("maximumpageGroupNum", maximumpageGroupNum);
        modelAndView.addObject("noticeDirection", noticeDirection);        
        
        return modelAndView;
    }

    @RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
    public String noticeDetail(@ModelAttribute NoticeDto noticeDto, HttpSession session){
        
      session.setAttribute("SESSION_USER_CURRENT_NOTICE_NO", noticeDto.getNoticeNo());
      
      //currentPage = noticeDto.getNoticeNo();
      return "/guide/notice_detail";
    }

    @RequestMapping(value = "/noticeDetailInfos", method = RequestMethod.GET)
    public ModelAndView noticeDetailInfos(HttpSession session){
        
        List<NoticeDto> noticeList = new ArrayList<NoticeDto>();
        ModelAndView modelAndView = new ModelAndView("jsonView");

        NoticeDto noticeInfo = new NoticeDto();
        
//        noticeInfo.setNoticeNo(currentPage);
        noticeInfo.setNoticeNo((int)session.getAttribute("SESSION_USER_CURRENT_NOTICE_NO"));
        
        noticeList = noticeService.getNoticeDetailInfos(noticeInfo);
        
        modelAndView.addObject("noticeDetailInfos", noticeList);
        
        return modelAndView;
    }

    
    @RequestMapping(value = "/noticeEdit", method = RequestMethod.GET)
    public String noticeEdit(@ModelAttribute NoticeDto noticeDto){

      return "/guide/notice_edit";
    }

    // CREATE using #{noticeTitle}, #{noticeContents}, #{createUserNo}, #{createTime}, #{target}
    @RequestMapping(value = "/noticeInsert", method = RequestMethod.POST)    
    public String noticeInsert(@ModelAttribute NoticeDto noticeDto){
      ModelAndView modelAndView = new ModelAndView("jsonView");

      Date date = new Date();

      SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

      String strDate = sdf.format(date);
      
      noticeDto.setCreateTime(strDate);
      
      try {
        noticeService.createNotice(noticeDto);
        modelAndView.addObject("noticeInsertResult", 1);
      }
      catch (Exception e) {
          modelAndView.addObject("noticeInsertResult", 2);
      }
      //return modelAndView;
      
      return "/guide/notice";
    }

    // READ
    @RequestMapping(value = "/noticeInfo", method = RequestMethod.GET)    
    public ModelAndView noticeInfo(){
        
      logger.info("noticeInfo");
      logger.info("currentPage" + currentPage);
      
      ModelAndView modelAndView = new ModelAndView("jsonView");
      
      NoticeDto noticeInfo = new NoticeDto();
      noticeInfo.setNoticeNo(currentPage);

      noticeInfo = noticeService.getNoticeInfo(noticeInfo);
      
      modelAndView.addObject("noticeInfo", noticeInfo);
      return modelAndView;
    }
    
    // READ
    @RequestMapping(value = "/noticeList", method = RequestMethod.GET)    
    public ModelAndView noticeList(@ModelAttribute NoticeDto noticeDto){
      ModelAndView modelAndView = new ModelAndView("jsonView");
      
      List<NoticeDto> noticeList = new ArrayList<NoticeDto>();
      
      noticeList = noticeService.getNoticeInfos(noticeDto);
      
      modelAndView.addObject("noticeList", noticeList);
      return modelAndView;
    }

    // UPDATE
    @RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)    
    public String noticeUpdate(@ModelAttribute NoticeDto noticeDto, HttpSession session){
      ModelAndView modelAndView = new ModelAndView("jsonView");
      
      noticeDto.setNoticeNo((int)session.getAttribute("SESSION_USER_CURRENT_NOTICE_NO"));
      
      try {
        noticeService.updateNotice(noticeDto);
        modelAndView.addObject("noticeUpdateResult", 1);
      }
      catch (Exception e) {
        modelAndView.addObject("noticeUpdateResult", 2);          
      }
      
      //return modelAndView;
      
      return "/guide/notice_detail";
    }

    // DELETE
    @RequestMapping(value = "/noticeDelete", method = RequestMethod.GET)    
    public String noticeDelete(@ModelAttribute NoticeDto noticeDto){
      ModelAndView modelAndView = new ModelAndView("jsonView");
      
      try {
        noticeService.deleteNotice(noticeDto);
        modelAndView.addObject("noticeDeleteResult", 1);
      }
      catch (Exception e) {
        modelAndView.addObject("noticeDeleteResult", 2);          
      }
      
//      return modelAndView;
      return "/guide/notice";
    }
}
