package com.mdd.mt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mdd.mt.model.Cinema;
import com.mdd.mt.model.Movie;
import com.mdd.mt.model.News;
import com.mdd.mt.service.CinemaServiceImpl;
import com.mdd.mt.service.DiscountServiceImpl;
import com.mdd.mt.service.NewsServiceImpl;

/**
 * 
 * @author xwl
 *
 */
@Controller
@RequestMapping("/mt/")
public class DiscountController {
	@Autowired
	private DiscountServiceImpl discountServiceImpl;
	
	/**
	 * 加载最近的优惠
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("loadLastWeekDisCount")
	public String loadLastWeekDisCount(ModelMap modelMap) {
		modelMap.addAttribute("discounts",discountServiceImpl.loadLastWeekDisCount());
		return "discount";
	}
	
}