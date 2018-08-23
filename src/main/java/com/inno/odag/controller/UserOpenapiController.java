package com.inno.odag.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.inno.odag.dto.UserOpenapiDto;
import com.inno.odag.service.UserOpenapiService;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class UserOpenapiController {

    @Autowired
    private UserOpenapiService useropenapiService;

    @RequestMapping(value="/userOpenapiList", method=RequestMethod.GET)
    public ModelAndView userOpenapiList(@ModelAttribute UserOpenapiDto userOpenapiDto) {
        ModelAndView modelAndView = new ModelAndView("jsonView");

        List<UserOpenapiDto> userOpenapiList = useropenapiService.getUserOpenapiInfos(userOpenapiDto);
        modelAndView.addObject("userOpenapiList", userOpenapiList);
        return modelAndView;
    }

//    @RequestMapping(value="/categoryChildList", method=RequestMethod.GET)
//    public ModelAndView categoryChildList(@ModelAttribute CategoryDto  categoryDto)
//    {
//        ModelAndView modelAndView = new ModelAndView("jsonView");
//        
//        List<CategoryDto> categoryList = categoryService.getCategoryChildList(categoryDto);
//        modelAndView.addObject("categoryList", categoryList);
//        
//        return modelAndView;
//    }

    @RequestMapping(value="/userOpenapiInsert", method=RequestMethod.GET)
    public ModelAndView userOpenapiInsert(@ModelAttribute UserOpenapiDto  userOpenapiDto)
    {
        ModelAndView modelAndView = new ModelAndView("jsonView");
        
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
        String strDate = sdf.format(date);
        userOpenapiDto.setUpdateTime(strDate);
        userOpenapiDto.setOpenapiState(1);
        
        useropenapiService.createUserOpenapi(userOpenapiDto); 
        return modelAndView; 
    }

    @RequestMapping(value="/userOpenapiDelete", method=RequestMethod.GET)
    public ModelAndView userOpenapiDelete(@ModelAttribute UserOpenapiDto  userOpenapiDto)
    {
        ModelAndView modelAndView = new ModelAndView("jsonView");
        try {
          useropenapiService.deleteUserOpenapi(userOpenapiDto);
        }
        catch(Exception e) {
          
        }
        
        return modelAndView;
    }
}
