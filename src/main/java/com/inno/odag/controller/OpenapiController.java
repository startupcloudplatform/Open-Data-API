package com.inno.odag.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.inno.odag.constants.User;
import com.inno.odag.dto.BookmarkDto;
import com.inno.odag.dto.BookmarkOpenapiDto;
import com.inno.odag.dto.OpenapiDto;
import com.inno.odag.dto.SearchDto;

import com.inno.odag.service.CategoryService;
import com.inno.odag.service.OpenapiService;
import com.inno.odag.service.SearchService;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class OpenapiController {

  Logger logger = LoggerFactory.getLogger(OpenapiController.class);
  private static int currentNo = 0;

  private static int totalOpenapiNum = 0;
  private static int openapiGroupNum = 5;
  private static int pageGroupNum = 5;

  @Autowired
  private CategoryService categoryService;

  @Autowired
  private OpenapiService openapiService;

  @Autowired
  private SearchService searchService;
 
  @RequestMapping(value = "/api", method = RequestMethod.GET)
  public String api(Model model, HttpSession session) {
      
      session.setAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE", 1);
      session.setAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE_GROUP", 1);
      
      return "api";
  }

  @RequestMapping(value = "/apiProvider", method = RequestMethod.GET)
  public String apiProvider(Model model, HttpSession session) {
      
      session.setAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE", 1);
      session.setAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE_GROUP", 1);
      
      return "api_provider";
  }

  @RequestMapping("/provider")
  public String provicer(){
    return "provider";
  }

  @RequestMapping("/providerForm")
  public String provicerForm(){
    return "provider_form";
  }

  @RequestMapping(value="/providerEdit", method=RequestMethod.GET)
  public String provicerEdit(@ModelAttribute OpenapiDto  openapiDto){

    if(openapiDto.getOpenapiNo() != 0) {
      currentNo = openapiDto.getOpenapiNo();
    }

    logger.info("currentNo : " + currentNo);

    return "provider_edit";
  }

// CREATE
  @RequestMapping(value="/openapiCreate", method=RequestMethod.POST)
  public String create(@ModelAttribute OpenapiDto  openapiDto, HttpSession session, HttpServletRequest servletRequest) {
      ModelAndView modelAndView = new ModelAndView("jsonView");

      Date date = new Date();
      SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");      
      String strDate = sdf.format(date);

      openapiDto.setUpdateTime(strDate);
      openapiDto.setUserNo(Integer.parseInt((String) session.getAttribute(User.SESSION_USER_USER_ID)));

      logger.info("apiCreate");
      logger.info("updateTime : " + openapiDto.getUpdateTime());
      logger.info("openapiName : " + openapiDto.getOpenapiName());
      logger.info("openapiCategory : " + openapiDto.getOpenapiCategory());      
      logger.info("openapiUseType : " + openapiDto.getOpenapiUseType());
      logger.info("openapiResultType : " + openapiDto.getOpenapiResultType());
      logger.info("openapiProvider : " + openapiDto.getOpenapiProvider());
      logger.info("openapiComment : " + openapiDto.getOpenapiComment());      

      logger.info("openapiUseUrl : " + openapiDto.getOpenapiUseUrl());      
      logger.info("openapiJoinUrl : " + openapiDto.getOpenapiJoinUrl());

      logger.info("openapiKeyword : " + openapiDto.getOpenapiKeyword());
      logger.info("openapiUserNo : " + openapiDto.getUserNo());

      try {
          openapiService.createOpenapi(openapiDto);
          modelAndView.addObject("openapiCreateResult", 1);
      }
      catch (Exception e) {
          modelAndView.addObject("openapiCreateResult", 0);
      }

      return "redirect:provider";
  }

  /*
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
  */
  
//READ
  @RequestMapping(value = "/apiSearch", method = RequestMethod.GET)
  public ModelAndView apiSearch(@ModelAttribute SearchDto searchDto) {
      ModelAndView modelAndView = new ModelAndView("jsonView");
      SearchDto searchDtoTemp;
      
      Date date = new Date();
      SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
      String strDate = sdf.format(date);
      
      logger.info("apiSearch");
      
      List<OpenapiDto> openapiList = new ArrayList<OpenapiDto>();
      
      try {
        openapiList = openapiService.searchOpenapiInfos(searchDto);
      } catch (Exception e) {
        e.printStackTrace();
      }

      // searchDto를 기반으로 카운터를 조회 작업
      try {

          searchDtoTemp = searchService.getSearchInfo(searchDto);

          logger.info("searchDtoTemp : " + searchDtoTemp.getSearchKeyword());

          searchDtoTemp.setSearchCount(searchDtoTemp.getSearchCount()+1);

          try {
            searchDtoTemp.setSearchTime(strDate);
            searchService.updateSearch(searchDtoTemp);
          }
          catch (Exception ue)
          {
            ue.printStackTrace();
          }
      } catch (Exception e) {
          // searchDto의 키워드가 DB에 존재하지 않을 경우
          logger.info("This keyword is not stored in the search table");
          e.printStackTrace();
          // 검색 키워드를 DB에 추가 (카운터는 1이 기본값)
          try {
            searchDto.setSearchTime(strDate);
            searchService.createSearch(searchDto);
          } catch (Exception ce) {
              ce.printStackTrace();
          }
      }

    modelAndView.addObject("openapiList", openapiList);

    return modelAndView;
  }

  @RequestMapping(value = "/apiNumber", method = RequestMethod.GET)
  public ModelAndView apiNumber(Model model, HttpSession session) {

    ModelAndView modelAndView = new ModelAndView("jsonView");
    int apiNum;
    OpenapiDto openapiDto = new OpenapiDto();

    apiNum = openapiService.getOpenapiNumber(openapiDto);
    modelAndView.addObject("openapiNum", apiNum);

    return modelAndView;
  }

  @RequestMapping(value = "/recentApiNumber", method = RequestMethod.GET)
  public ModelAndView recentApiNumber(@ModelAttribute OpenapiDto openapiDto) {

    ModelAndView modelAndView = new ModelAndView("jsonView");
    int apiNum;

    //Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
    Calendar cal = Calendar.getInstance();
    cal.add(Calendar.DATE, -7);
    String strDate = sdf.format(cal.getTime());
    
    logger.info("date : " + strDate);
    
    openapiDto.setUpdateTime(strDate);
    
    apiNum = openapiService.getRecentOpenapiNumber(openapiDto);
    modelAndView.addObject("recentOpenapiNum", apiNum);
    
    return modelAndView;
  }

  @RequestMapping(value = "/apiList", method = RequestMethod.GET)
  public ModelAndView getApiList(@ModelAttribute OpenapiDto openapiDto) {

    ModelAndView modelAndView = new ModelAndView("jsonView");
    List<OpenapiDto> openapiList = new ArrayList<OpenapiDto>();
    
    try {
      openapiList = openapiService.getOpenapiInfos(openapiDto);
    } catch (Exception e) {
      e.printStackTrace();
    }

    modelAndView.addObject("openapiList", openapiList);

    return modelAndView;
  }

  @RequestMapping(value = "/apiInfo", method = RequestMethod.GET)
  public ModelAndView getApiInfo(@ModelAttribute OpenapiDto openapiDto) {
    ModelAndView modelAndView = new ModelAndView("jsonView");
    OpenapiDto openapi;
    try {
        openapi = openapiService.getOpenapiInfo(openapiDto);
        modelAndView.addObject("openapiInfo", openapi);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return modelAndView;
  }

  @RequestMapping(value = "/apiInfos", method = RequestMethod.GET)
  public ModelAndView getApiInfos(@ModelAttribute OpenapiDto openapiDto) {
    ModelAndView modelAndView = new ModelAndView("jsonView");
    List<OpenapiDto> openapiList = new ArrayList<OpenapiDto>();

    try {
        openapiList = openapiService.getOpenapiInfos(openapiDto);
        modelAndView.addObject("openapiInfos", openapiList);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return modelAndView;
  }

  @RequestMapping(value = "/openapiGroupList", method = RequestMethod.GET)
  public ModelAndView openapiGroupList(@ModelAttribute OpenapiDto openapiDto, HttpSession session, int currentOpenapiGroupNum) {
    ModelAndView modelAndView = new ModelAndView("jsonView");
    List<OpenapiDto> openapiList = new ArrayList<OpenapiDto>();

    session.setAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE", currentOpenapiGroupNum);

    try {
        openapiList = openapiService.getOpenapiGroup(openapiDto, openapiGroupNum, (int)session.getAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE"));
        modelAndView.addObject("openapiInfos", openapiList);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return modelAndView;
  }

  @RequestMapping("/openapiPageGroupList")
  public ModelAndView openapiPageGroupList(HttpSession session, OpenapiDto openapiDto, int currentPageGroupMove){

      ModelAndView modelAndView = new ModelAndView("jsonView");

      ArrayList<Integer> openapiPageList = new ArrayList<>();
      ArrayList<Integer> openapiGroupPageList = new ArrayList<>();

      int openapiPageLast = 0;
      int totalPageNum = 0;
      int maximumpageGroupNum = 0;
      int openapiDirection = 1;
      int openapiNum = 0;
      
      try {
          openapiNum = openapiService.getOpenapiNumber(openapiDto);
      }
      catch (Exception e){
          
      }
      
      logger.info("openapiNum : " + openapiNum);
      
      if(openapiNum != 0) {
          for(int i=1; openapiNum-((i-1)*openapiGroupNum) > 0; i++) {
              openapiPageList.add(i);

              if(openapiNum-(i*openapiGroupNum)<=0)
                  openapiPageLast = i;

              totalPageNum++;
          } // ex1) 7, 3 > 7, 4, 1(1, 2, 3) ex2) 32, 5 > 32, 27, 22, 17, 12, 7, 2(1, 2, 3, 4, 5, 6, 7)
          
          maximumpageGroupNum = totalPageNum/pageGroupNum;
          if(totalPageNum%pageGroupNum>0)
              maximumpageGroupNum++;
      }

      if(currentPageGroupMove == 1 && (int)session.getAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE_GROUP") != maximumpageGroupNum)
          session.setAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE_GROUP", (int)session.getAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE_GROUP")+1);
      else if(currentPageGroupMove == 2 && (int)session.getAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE_GROUP") != 1) {
          session.setAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE_GROUP", (int)session.getAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE_GROUP")-1);
          openapiDirection = 2;
      }
      else if(currentPageGroupMove == 3)
          session.setAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE_GROUP", 1);
      else if(currentPageGroupMove == 4) {
          session.setAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE_GROUP", maximumpageGroupNum);
          openapiDirection = 2;
      }
      else if(currentPageGroupMove == 5) {
          session.setAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE", 1);
          session.setAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE_GROUP", 1);
      }
      
      for(int j=0; j<pageGroupNum; j++){

          openapiGroupPageList.add(openapiPageList.get(j+(pageGroupNum*((int)session.getAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE_GROUP")-1))));

          if(openapiPageList.get(j+(pageGroupNum*((int)session.getAttribute("SESSION_USER_CURRENT_OPENAPI_PAGE_GROUP")-1))) == openapiPageLast)
              break;
      }

      modelAndView.addObject("openapiPageList", openapiPageList);
      modelAndView.addObject("openapiPageLast", openapiPageLast);
      modelAndView.addObject("openapiGroupPageList", openapiGroupPageList);
      modelAndView.addObject("maximumpageGroupNum", maximumpageGroupNum);
      modelAndView.addObject("openapiDirection", openapiDirection);

      return modelAndView;
  }

  @RequestMapping(value = "/popularApiInfos", method = RequestMethod.GET)
  public ModelAndView getPopluarApiInfos(@ModelAttribute OpenapiDto openapiDto) {
    ModelAndView modelAndView = new ModelAndView("jsonView");
    List<OpenapiDto> popularOpenapiList = new ArrayList<OpenapiDto>();

    try {
        popularOpenapiList = openapiService.getPopularOpenapiInfos(openapiDto);
        modelAndView.addObject("popularOpenapiInfos", popularOpenapiList);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return modelAndView;
  }

  @RequestMapping(value = "/popularUseApiInfos", method = RequestMethod.GET)
  public ModelAndView getPopluarUseApiInfos(@ModelAttribute OpenapiDto openapiDto) {
    ModelAndView modelAndView = new ModelAndView("jsonView");
    List<OpenapiDto> popularUseOpenapiList = new ArrayList<OpenapiDto>();

    // useType 2
    openapiDto.setOpenapiUseType(2);
    
    try {
        popularUseOpenapiList = openapiService.getPopularUseOpenapiInfos(openapiDto);
        modelAndView.addObject("popularUseOpenapiInfos", popularUseOpenapiList);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return modelAndView;
  }

  @RequestMapping(value = "/popularDownloadApiInfos", method = RequestMethod.GET)
  public ModelAndView getPopluarDownloadApiInfos(@ModelAttribute OpenapiDto openapiDto) {
    ModelAndView modelAndView = new ModelAndView("jsonView");
    List<OpenapiDto> popularDownloadOpenapiList = new ArrayList<OpenapiDto>();

    // useType 1
    openapiDto.setOpenapiUseType(1);
    
    try {
        popularDownloadOpenapiList = openapiService.getPopularDownloadOpenapiInfos(openapiDto);
        modelAndView.addObject("popularDownloadOpenapiInfos", popularDownloadOpenapiList);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return modelAndView;
  }

  @RequestMapping(value = "/popularBookmarkApiInfos", method = RequestMethod.GET)
  public ModelAndView getPopluarBookmarkApiInfos(@ModelAttribute OpenapiDto openapiDto) {
    ModelAndView modelAndView = new ModelAndView("jsonView");
    List<OpenapiDto> popularBookmarkOpenapiList = new ArrayList<OpenapiDto>();

    try {
        popularBookmarkOpenapiList = openapiService.getPopularBookmarkOpenapiInfos(openapiDto);
        modelAndView.addObject("popularBookmarkOpenapiInfos", popularBookmarkOpenapiList);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return modelAndView;
  }

  @RequestMapping(value = "/currentApiInfo", method = RequestMethod.GET)
  public ModelAndView getCurrentApiInfo() {
      ModelAndView modelAndView = new ModelAndView("jsonView");
      OpenapiDto openapiDto = new OpenapiDto();
      
      logger.info("openapiDto.getOpenapiNo() : " + openapiDto.getOpenapiNo());
      
      //if(openapiDto.getOpenapiNo() != 0)
      
      openapiDto.setOpenapiNo(currentNo);

      OpenapiDto resultOpenapi;

      try {
          
          resultOpenapi = openapiService.getOpenapiInfo(openapiDto);
          modelAndView.addObject("openapiInfo", resultOpenapi);
          
      } catch (Exception e) {
          e.printStackTrace();          
      }
      
    return modelAndView;
  }
  
  @RequestMapping(value = "/keywordList", method = RequestMethod.GET)
  public ModelAndView getKeywordList(@ModelAttribute SearchDto searchDto) {

    ModelAndView modelAndView = new ModelAndView("jsonView");
    List<SearchDto> searchList = new ArrayList<SearchDto>();
    
    try {
        searchList = searchService.getSearchInfos(searchDto);
    } catch (Exception e) {
      e.printStackTrace();
    }

    modelAndView.addObject("keywordList", searchList);

    return modelAndView;
  }
  
// UPDATE
  @RequestMapping(value="/openapiUpdate", method=RequestMethod.POST)
  public String updateOpenapi(@ModelAttribute OpenapiDto  openapiDto, HttpSession session, HttpServletRequest servletRequest) {
      //ModelAndView modelAndView = new ModelAndView("jsonView");
      
      openapiDto.setOpenapiNo(currentNo);
      
      //logger.info("openapiName:  " + openapiDto.getBookmarkOpenapiNo());
      
      try {
          openapiService.updateOpenapi(openapiDto);
          //modelAndView.addObject("openapiUpdateResult", 1);
      }
      catch (Exception e)
      {
          //modelAndView.addObject("openapiUpdateResult", 0);
          e.printStackTrace();
      }
      
      //return modelAndView;
      
      return "redirect:/provider";
  }

  
  
// DELETE
  @RequestMapping(value="/openapiDelete", method=RequestMethod.GET)
  public ModelAndView deleteOpenapi(@ModelAttribute OpenapiDto  openapiDto, HttpSession session, HttpServletRequest servletRequest) {
      ModelAndView modelAndView = new ModelAndView("jsonView");
      
      //logger.info("openapiName:  " + openapiDto.getBookmarkOpenapiNo());
      
      try {
          openapiService.deleteOpenapi(openapiDto);
          modelAndView.addObject("openapiDeleteResult", 1);
      }
      catch (Exception e)
      {
          modelAndView.addObject("openapiDeleteResult", 0);
          e.printStackTrace();
      }
      
      
      return modelAndView;
  }
  /*
    @RequestMapping(value="/bookmarkOpenapiDelete", method=RequestMethod.GET)
    public ModelAndView deleteOpenapi(@ModelAttribute BookmarkOpenapiDto  bookmarkOpenapiDto, HttpSession session, HttpServletRequest servletRequest) {
      ModelAndView modelAndView = new ModelAndView("jsonView");

      logger.info("bookmarkName:  " + bookmarkOpenapiDto.getBookmarkOpenapiNo());
      
      //logger.info("userNo: " + bookmarkDto.getUserNo());

      try {
        bookmarkOpenapiService.deleteBookmarkOpenapi(bookmarkOpenapiDto);
        modelAndView.addObject("bookmarkOpenapiDeleteResult", 1);
      }
      catch(Exception e)
      {
        e.printStackTrace();
        modelAndView.addObject("bookmarkOpenapiDeleteResult", 0);
      }

      return modelAndView;
    }
  */
  
  
  
  
}
