package com.wl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pet/")
public class changeViewController {

	@RequestMapping("toRegister")
	public String toRegisterView(){
		return "register";
	}
	
	@RequestMapping("toLogin")
	public String toLoginView(){
		return "login";
	}
	
	
	@RequestMapping("toMain")
	public String toMainView(){
		return "main";
	}
	
	@RequestMapping("toUpdateInfo")
	public String toUpdateInfo(){
		return "updateInfo";
	}
	
	@RequestMapping("toLoadUserInfo")
	public String toLoadUserInfo(){
		return "userInfo";
	}
	
	@RequestMapping("toKeji")
	public String toKeji(){
		return "keji";
	}
	@RequestMapping("toBomei")
	public String toBomei(){
		return "bomei";
	}
	@RequestMapping("toBixiong")
	public String toBixiong(){
		return "bixiong";
	}
}
