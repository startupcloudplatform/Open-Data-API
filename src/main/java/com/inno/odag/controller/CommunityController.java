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

import com.inno.odag.dto.CommunityDto;
import com.inno.odag.service.CommunityService;

import com.inno.odag.dto.CommunityReplyDto;
import com.inno.odag.service.CommunityReplyService;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class CommunityController {
    private Logger logger = LoggerFactory.getLogger(CommunityController.class);

    private static int currentPage = 0;

    private static int totalCommunityNum = 0;
    private static int communityGroupNum = 5;
    private static int pageGroupNum = 5;
    
    @Autowired
    private CommunityService communityService;

    @Autowired
    private CommunityReplyService communityReplyService;

    @RequestMapping("/community")
    public String community(HttpSession session){
        session.setAttribute("SESSION_USER_CURRENT_COMMUNITY_PAGE", 1);
        session.setAttribute("SESSION_USER_CURRENT_COMMUNITY_PAGE_GROUP", 1);
        return "/guide/community";
    }
    
    @RequestMapping("/communityForm")
    public String communityForm(){
      return "/guide/community_form";
    }
    
    @RequestMapping("/communityGroupList")
    public ModelAndView communityGroupList(HttpSession session, int currentCommunityGroupNum){
        ModelAndView modelAndView = new ModelAndView("jsonView");
        List<CommunityDto> communityList = new ArrayList<CommunityDto>();
        
        session.setAttribute("SESSION_USER_CURRENT_COMMUNITY_PAGE", currentCommunityGroupNum);
        
        logger.info("SESSION_USER_CURRENT_COMMUNITY_PAGE : "+session.getAttribute("SESSION_USER_CURRENT_COMMUNITY_PAGE"));
        
        communityList = communityService.getCommunityGroup(communityGroupNum, (int)session.getAttribute("SESSION_USER_CURRENT_COMMUNITY_PAGE")); 
        modelAndView.addObject("communityGroupList", communityList);
        
        return modelAndView;
    }
    
    @RequestMapping("/communityPageGroupList")
    public ModelAndView communityPageGroupList(HttpSession session, int currentPageGroupMove){
        
        ModelAndView modelAndView = new ModelAndView("jsonView");
        
        ArrayList<Integer> communityPageList = new ArrayList<>();
        ArrayList<Integer> communityGroupPageList = new ArrayList<>();
                
        int communityPageLast = 0;
        int totalPageNum = 0;
        int maximumpageGroupNum = 0;
        int communityDirection = 1;

        int communityNum = communityService.getCommunityNumber();

        for(int i=1; communityNum-((i-1)*communityGroupNum) > 0; i++) {
           communityPageList.add(i);
           
           if(communityNum-(i*communityGroupNum)<=0)
               communityPageLast = i;

           totalPageNum++;
        } // ex1) 7, 3 > 7, 4, 1(1, 2, 3) ex2) 32, 5 > 32, 27, 22, 17, 12, 7, 2(1, 2, 3, 4, 5, 6, 7)

        maximumpageGroupNum = totalPageNum/pageGroupNum;
        if(totalPageNum%pageGroupNum>0)
            maximumpageGroupNum++;
        
        if(currentPageGroupMove == 1 && (int)session.getAttribute("SESSION_USER_CURRENT_COMMUNITY_PAGE_GROUP") != maximumpageGroupNum)
            session.setAttribute("SESSION_USER_CURRENT_COMMUNITY_PAGE_GROUP", (int)session.getAttribute("SESSION_USER_CURRENT_COMMUNITY_PAGE_GROUP")+1);
        else if(currentPageGroupMove == 2 && (int)session.getAttribute("SESSION_USER_CURRENT_COMMUNITY_PAGE_GROUP") != 1) {
            session.setAttribute("SESSION_USER_CURRENT_COMMUNITY_PAGE_GROUP", (int)session.getAttribute("SESSION_USER_CURRENT_COMMUNITY_PAGE_GROUP")-1);
            communityDirection = 2;
        }
        else if(currentPageGroupMove == 3)
            session.setAttribute("SESSION_USER_CURRENT_COMMUNITY_PAGE_GROUP", 1);
        else if(currentPageGroupMove == 4) {
            session.setAttribute("SESSION_USER_CURRENT_COMMUNITY_PAGE_GROUP", maximumpageGroupNum);
            communityDirection = 2;
        }
        
        for(int j=0; j<pageGroupNum; j++){

            communityGroupPageList.add(communityPageList.get(j+(pageGroupNum*((int)session.getAttribute("SESSION_USER_CURRENT_COMMUNITY_PAGE_GROUP")-1))));

            if(communityPageList.get(j+(pageGroupNum*((int)session.getAttribute("SESSION_USER_CURRENT_COMMUNITY_PAGE_GROUP")-1))) == communityPageLast)
                break;
        }
                
        modelAndView.addObject("communityPageList", communityPageList);
        modelAndView.addObject("communityPageLast", communityPageLast);
        modelAndView.addObject("communityGroupPageList", communityGroupPageList);
        modelAndView.addObject("maximumpageGroupNum", maximumpageGroupNum);
        modelAndView.addObject("communityDirection", communityDirection);
        
        return modelAndView;
    }
    
    @RequestMapping(value = "/communityDetail", method = RequestMethod.GET)
    public String communityDetail(@ModelAttribute CommunityDto communityDto, HttpSession session){
        
      session.setAttribute("SESSION_USER_CURRENT_COMMUNITY_NO", communityDto.getCommunityNo());
      
      //currentPage = communityDto.getCommunityNo();
      return "/guide/community_detail";
    }

    @RequestMapping(value = "/communityDetailInfos", method = RequestMethod.GET)
    public ModelAndView communityDetailInfos(HttpSession session){
        
        List<CommunityDto> communityList = new ArrayList<CommunityDto>();
        ModelAndView modelAndView = new ModelAndView("jsonView");

        CommunityDto communityInfo = new CommunityDto();
        
        communityInfo.setCommunityNo((int)session.getAttribute("SESSION_USER_CURRENT_COMMUNITY_NO"));
        
        communityList = communityService.getCommunityDetailInfos(communityInfo);
        
        modelAndView.addObject("communityDetailInfos", communityList);
        
        return modelAndView;
    }
    
    @RequestMapping(value = "/communityEdit", method = RequestMethod.GET)
    public String communityEdit(@ModelAttribute CommunityDto communityDto){

      return "/guide/community_edit";
    }

    // CREATE using #{communityTitle}, #{communityContents}, #{createUserNo}, #{createTime}, #{target}
    @RequestMapping(value = "/communityInsert", method = RequestMethod.POST)    
    public String communityInsert(@ModelAttribute CommunityDto communityDto){
      ModelAndView modelAndView = new ModelAndView("jsonView");

      Date date = new Date();

      SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

      String strDate = sdf.format(date);
      communityDto.setCreateTime(strDate);
      
      try {
        communityService.createCommunity(communityDto);
        modelAndView.addObject("communityInsertResult", 1);
      }
      catch (Exception e) {
          modelAndView.addObject("communityInsertResult", 2);
      }
      
      return "/guide/community";
    }

    // CREATE using #{communityTitle}, #{communityContents}, #{createUserNo}, #{createTime}, #{target}
    @RequestMapping(value = "/communityReplyInsert", method = RequestMethod.GET)    
    public String communityReplyInsert(@ModelAttribute CommunityReplyDto communityReplyDto, HttpSession session){
      ModelAndView modelAndView = new ModelAndView("jsonView");

      Date date = new Date();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
      String strDate = sdf.format(date);
      
      communityReplyDto.setCreateTime(strDate);
      communityReplyDto.setCommunityNo((int)session.getAttribute("SESSION_USER_CURRENT_COMMUNITY_NO"));
      //communityReplyDto.setCommunityReplyTitle("test");
      
      logger.info("communityReplyDto :" + communityReplyDto);
      
      try {
        communityReplyService.createCommunityReply(communityReplyDto);
        modelAndView.addObject("communityInsertResult", 1);
      }
      catch (Exception e) {
          modelAndView.addObject("communityInsertResult", 2);          
      }
      
      return "/guide/community_detail";
    }

    // READ
    @RequestMapping(value = "/communityInfo", method = RequestMethod.GET)    
    public ModelAndView communityInfo(HttpSession session){
        
      logger.info("communityInfo");
      logger.info("currentPage" + currentPage);
      
      ModelAndView modelAndView = new ModelAndView("jsonView");
      
      CommunityDto communityInfo = new CommunityDto();
      communityInfo.setCommunityNo((int)session.getAttribute("SESSION_USER_CURRENT_COMMUNITY_NO"));

      communityInfo = communityService.getCommunityInfo(communityInfo);
      
      modelAndView.addObject("communityInfo", communityInfo);
      return modelAndView;
    }
    
    // READ    
    @RequestMapping(value = "/communityList", method = RequestMethod.GET)    
    public ModelAndView communityList(@ModelAttribute CommunityDto communityDto){
      ModelAndView modelAndView = new ModelAndView("jsonView");
      
      List<CommunityDto> communityList = new ArrayList<CommunityDto>();
      
      communityList = communityService.getCommunityInfos(communityDto);
      
      modelAndView.addObject("communityList", communityList);
      
      return modelAndView;
    }

    // READ
    @RequestMapping(value = "/communityReplyList", method = RequestMethod.GET)    
    public ModelAndView communityReplyList(HttpSession session){
      
      logger.info("communityReplyList");
      logger.info("currentPage : " + currentPage);
      ModelAndView modelAndView = new ModelAndView("jsonView");
      
      CommunityReplyDto communityReplyInfo = new CommunityReplyDto();
      communityReplyInfo.setCommunityNo((int)session.getAttribute("SESSION_USER_CURRENT_COMMUNITY_NO"));

      List<CommunityReplyDto> communityReplyList = new ArrayList<CommunityReplyDto>();
      
      communityReplyList = communityReplyService.getCommunityReplyInfos(communityReplyInfo);
      
      modelAndView.addObject("communityReplyList", communityReplyList);
      return modelAndView;
    }
    
/*
    // READ    
    @RequestMapping(value = "/communityReplyList", method = RequestMethod.GET)    
    public ModelAndView communityReplyList(@ModelAttribute CommunityDto communityDto){
      ModelAndView modelAndView = new ModelAndView("jsonView");
      
      List<CommunityDto> communityList = new ArrayList<CommunityDto>();
      
      communityList = communityService.getCommunityInfos(communityDto);
      
      modelAndView.addObject("communityList", communityList);
      
      return modelAndView;
    }
*/    
    // UPDATE
    @RequestMapping(value = "/communityUpdate", method = RequestMethod.POST)    
    public String communityUpdate(@ModelAttribute CommunityDto communityDto, HttpSession session){
        ModelAndView modelAndView = new ModelAndView("jsonView");
      
        communityDto.setCommunityNo((int)session.getAttribute("SESSION_USER_CURRENT_COMMUNITY_NO"));
      
        try {
            communityService.updateCommunity(communityDto);
            modelAndView.addObject("communityUpdateResult", 1);
            }
        catch (Exception e) {
            modelAndView.addObject("communityUpdateResult", 2);
            }
        return "/guide/community_detail";
    }
 
    // DELETE
    @RequestMapping(value = "/communityDelete", method = RequestMethod.GET)    
    public ModelAndView communityDelete(@ModelAttribute CommunityDto communityDto){
      ModelAndView modelAndView = new ModelAndView("jsonView");
      
      try {
        communityService.deleteCommunity(communityDto);
        modelAndView.addObject("communityDeleteResult", 1);
      }
      catch (Exception e) {
          modelAndView.addObject("communityDeleteResult", 2);          
      }
      
      return modelAndView;
    }
    
    
}
