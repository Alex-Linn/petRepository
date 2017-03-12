package com.mdd.mt.controller;

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
	
	
}
