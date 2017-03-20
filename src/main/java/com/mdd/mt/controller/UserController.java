package com.mdd.mt.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mdd.mt.crawler.DiscountsCrawler;
import com.mdd.mt.crawler.JDCrawler;
import com.mdd.mt.crawler.NewsCrawler;
import com.mdd.mt.crawler.TaoPiaoPiaoCrawler;
import com.mdd.mt.model.User;
import com.mdd.mt.service.UserService;

/**
 * Created by Administrator on 2016/12/15.
 */
@Controller
@RequestMapping("/mt/")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private TaoPiaoPiaoCrawler taoPiaoPiaoCrawler;

	@Autowired
	private JDCrawler jd;
	
	@Autowired
	private NewsCrawler newsCrawler;

	@Autowired
	private DiscountsCrawler discountsCrawler;
	/**
	 * 注册
	 * 
	 * @param user
	 * @param messageMap
	 * @return
	 */
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(User user, ModelMap messageMap) {
		boolean flag = userService.reqister(user);
		if (!flag) {
			messageMap.addAttribute("message", "<font color='red'>用户名已存在</font>");
			return "register";
		}
		messageMap.addAttribute("message", "<font color='red'>注册成功，请登入</font>");
		return "login";
	}

	/**
	 * 登入
	 * 
	 * @param user
	 * @param messageMap
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(User user, ModelMap messageMap, HttpServletRequest request) {
		User dbUser = userService.login(user);
		if (dbUser == null) {
			messageMap.addAttribute("message", "<font color='red'>用户名或密码错误</font>");
			return "login";
		}
		messageMap.addAttribute("message", "<font color='red'>登入成功</font>");
		request.getSession().setAttribute("user", dbUser);
		return "userInfo";
	}
	
	
	/**
	 * 加载用户信息中心
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("loadUserInfo")
	public String loadUserInfo(ModelMap modelMap,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			request.setAttribute("message", "你还没有登陆，请先登陆！");
			return "login";
		}
		return "userInfo";
	}
	
	
	
	
	
	
	
	
	
	
	
	

	@RequestMapping("/taopiaopiao")
	public String taopiaopiao() throws IOException {
		taoPiaoPiaoCrawler.crawlerTest(
				"http://dianying.taobao.com/showList.htm?spm=a1z21.6646273.city.5.EAQ1oR&n_s=new&city=440300");
		return "demo";
	}

	@RequestMapping("/jd")
	public String jd() throws IOException {
//		jd.crawler("http://movie.jd.com/m_channel");
		newsCrawler.crawler("http://news.mtime.com/");
		discountsCrawler.crawler("http://www.quanmama.com/quan_maoyan");
		return "demo";
	}

}
