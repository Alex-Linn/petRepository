package com.wl.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.wl.model.PetOwner;
import com.wl.service.IUserService;

@Controller
@RequestMapping("/user/")
public class LoginController {

	@Resource
	private IUserService userService;
	/**
	 * 登陆
	 * @param owner
	 * @param request
	 * @return
	 */
	@RequestMapping(value="loginCheck")
	public String login(PetOwner owner,HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		owner.setOwnerUsername(username);
		owner.setOwnerPassword(password);
		PetOwner userResult=null;
		userResult = userService.loginCheck(owner);
		if(null == userResult){
			request.setAttribute("owner", userResult);
			request.setAttribute("errorMsg", "用户名或密码错误");
			return "login";
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", userResult);
			return "main";
		}
	}
	
	/**
	 * 注册
	 */
	@RequestMapping(value="registerCheck")
	public String register(PetOwner petOwner,HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		petOwner.setOwnerUsername(username);
		petOwner.setOwnerPassword(password);
		boolean falg = userService.registerCheck(petOwner);
		if(!falg){
			request.setAttribute("errorMsg", "用户存在");
			return "register";
		}
		request.setAttribute("errorMsg", "注册成功");
		return "login";
	}
	/**
	 * 加载用户信息
	 * @param petOwner
	 * @param request
	 * @return
	 */
	@RequestMapping(value="loadUserInfo")
	public String loadUserInfo(PetOwner petOwner,HttpServletRequest request){
		//取得session
		HttpSession session = request.getSession();
		PetOwner user = (PetOwner) session.getAttribute("currentUser");
		//加载用户信息
		PetOwner owner = userService.loadUserInfo(petOwner.getId());
		//判断用户信息是否为空以及session是否失效,是则返回登录页
		if(null == owner || "".equals(user) || null == user){
			return "login";
		}
		return "userInfo";
	}
	/**
	 * 更新用户信息
	 * @param petOwner
	 * @param request
	 * @return
	 */
	@RequestMapping(value="updateInfo")
	public String updateInfo(PetOwner petOwner,HttpServletRequest request){
		//取得session
		HttpSession session = request.getSession();
		PetOwner user = (PetOwner) session.getAttribute("currentUser");
		//更新信息
		userService.updateInfo(petOwner);
		//加载更新后的信息
		PetOwner powner = userService.loadUserInfo(petOwner.getId());
		//判断用户信息是否为空以及session是否失效,是则返回登录页
		if(null == powner || "".equals(user) || null == user){
			return "login";
		}
		session.setAttribute("currentUser", powner);
		return "userInfo";
	}
}
