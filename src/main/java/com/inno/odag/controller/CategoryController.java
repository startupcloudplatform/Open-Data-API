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
import com.inno.odag.dto.CategoryDto;
import com.inno.odag.service.CategoryService;

@Controller
public class CategoryController {

  Logger logger = LoggerFactory.getLogger(CategoryController.class);
  
  @Autowired
  private CategoryService categoryService;

  @RequestMapping(value="/categoryRecursiveList", method=RequestMethod.GET)
  public ModelAndView categoryRecursiveList(@ModelAttribute CategoryDto categoryDto) {
    ModelAndView modelAndView = new ModelAndView("jsonView");

    List<CategoryDto> categoryList = categoryService.getCategoryRecursive(categoryDto);
    modelAndView.addObject("categoryList", categoryList);
    
    return modelAndView;
  }

  
  
//  @RequestMapping(value="/categoryChildList", method=RequestMethod.GET)
//  public ModelAndView categoryChildList(@ModelAttribute CategoryDto categoryDto) {
//    ModelAndView modelAndView = new ModelAndView("jsonView");
//
//    List<CategoryDto> categoryList = categoryService.getCategoryChildList(categoryDto);
//    modelAndView.addObject("categoryChildList", categoryList);
//    
//    return modelAndView;
//  }

  @RequestMapping(value="/categoryChildList", method=RequestMethod.GET)
  public ModelAndView categoryChildList(@ModelAttribute CategoryDto  categoryDto)
  {
      ModelAndView modelAndView = new ModelAndView("jsonView");
      
      List<CategoryDto> categoryList = categoryService.getCategoryChildList(categoryDto);
      modelAndView.addObject("categoryList", categoryList);
      
      return modelAndView;
  }

  @RequestMapping(value="/categoryParents", method=RequestMethod.GET)
  public ModelAndView categoryParents(@ModelAttribute CategoryDto  categoryDto)
  {
      ModelAndView modelAndView = new ModelAndView("jsonView");
      
      CategoryDto subCategory; 
      CategoryDto middleCategory;
      
      CategoryDto tmpCategory = new CategoryDto();
      
      try {
          subCategory = categoryService.getCategoryInfo(categoryDto); 
          tmpCategory.setCategoryNo(subCategory.getCategoryParents());
          
          modelAndView.addObject("middleParents", subCategory.getCategoryParents());
          try {
              middleCategory = categoryService.getCategoryInfo(tmpCategory);
              modelAndView.addObject("majorParents", middleCategory.getCategoryParents());
          }
          catch(Exception e)
          {  
            e.printStackTrace();
          }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      
      //subCategory = categoryService.getCategoryInfo(categoryDto);

      //logger.info("subCategory : " + subCategory.getCategoryNo());
      
      //tmpCategory.setCategoryNo(subCategory.getCategoryParents());
      
      //middleCategory = categoryService.getCategoryInfo(tmpCategory);
      
      //logger.info("middleCategory : " + middleCategory.getCategoryNo());
      
      
      
      
      //modelAndView.addObject("middleParents", subCategory.getCategoryParents());
      //subCategory = categoryService.getCategoryInfo(categoryDto);
      //tmpCategory.setCategoryNo(subCategory.getCategoryParents());
      
      //middleCategory = categoryService.getCategoryInfo(tmpCategory.getCategoryParents());
/*      
      CategoryDto tmpCategory = new CategoryDto();
      CategoryDto subCategory;
      CategoryDto middleCategory;
      
      subCategory = categoryService.getCategoryInfo(categoryDto);
      modelAndView.addObject("middleParents", subCategory.getCategoryParents());

      logger.info("parentNo" + subCategory.getCategoryParents());
      tmpCategory.setCategoryNo(subCategory.getCategoryParents());
      
      middleCategory = categoryService.getCategoryInfo(tmpCategory);
      modelAndView.addObject("majorParents", middleCategory.getCategoryParents());
*/    
      return modelAndView;
  }
}