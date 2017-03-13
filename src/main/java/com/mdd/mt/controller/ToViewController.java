package com.mdd.mt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mt/")
public class ToViewController {
	
	@RequestMapping("toRegister")
	public String toRegisterView(){
		return "register";
	}
	
	@RequestMapping("toLogin")
	public String toLoginView(){
		return "login";
	}
	
	@RequestMapping("toIndex")
	public String toIndexView(){
		return "index";
	}
	
	/**
	 * 退出
	 * @param request
	 * @return
	 */
	@RequestMapping("logout")
	public String logout(HttpServletRequest request){
		request.getSession().invalidate();
		return "login";
	}
	
	
}
