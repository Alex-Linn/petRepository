package com.mdd.mt.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mdd.mt.model.User;
import com.mdd.mt.service.DiscountServiceImpl;
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
	public String loadLastWeekDisCount(ModelMap modelMap,HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("u");
		if(user==null){
			request.setAttribute("message", "你还没有登陆，请先登陆！");
			return "login";
		}
		modelMap.addAttribute("discounts",discountServiceImpl.loadLastWeekDisCount());
		return "discount";
	}
	
}