package com.mdd.mt.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mdd.mt.crawler.DiscountsCrawler;
import com.mdd.mt.crawler.JDCrawler;
import com.mdd.mt.crawler.NewsCrawler;
import com.mdd.mt.crawler.TaoPiaoPiaoCrawler;
import com.mdd.mt.mapper.NoticeMapper;
import com.mdd.mt.model.Comment;
import com.mdd.mt.model.CrawlerNum;
import com.mdd.mt.model.Notice;
import com.mdd.mt.model.User;
import com.mdd.mt.service.CinemaServiceImpl;
import com.mdd.mt.service.CommentServiceImpl;
import com.mdd.mt.service.DiscountsServiceImpl;
import com.mdd.mt.service.MovieScheduleServiceImpl;
import com.mdd.mt.service.MovieServiceImpl;
import com.mdd.mt.service.NewsServiceImpl;
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
	
	@Autowired
	private MovieServiceImpl movieServiceImpl;
	
	@Autowired
	private CinemaServiceImpl cinemaServiceImpl;
	
	@Autowired
	private NewsServiceImpl newsServiceImpl;
	
	@Autowired
	private DiscountsServiceImpl discountsServiceImpl;
	
	@Autowired
	private CommentServiceImpl commentServiceImpl;
	
	@Autowired
	private MovieScheduleServiceImpl movieScheduleServiceImpl;
	
	@Autowired
	private NoticeMapper noticeMapper; 
	/**
	 * 注册
	 * 
	 * @param user
	 * @param messageMap
	 * @return
	 */
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(User user, ModelMap messageMap) {
		user.setUserType(0);
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
	public String login(User user, ModelMap messageMap, HttpSession session) {
		User dbUser = userService.login(user);
		if (dbUser == null) {
			messageMap.addAttribute("message", "<font color='red'>用户名或密码错误</font>");
			return "login";
		}
		messageMap.addAttribute("message", "<font color='red'>登入成功</font>");
		session.setAttribute("u", dbUser);
		System.out.println(dbUser);
		return "userInfo";
	}
	
	
	/**
	 * 加载用户信息中心
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("loadUserInfo")
	public String loadUserInfo(ModelMap modelMap,HttpServletRequest request,int id){
		User user = (User) request.getSession().getAttribute("u");
		if(user==null){
			request.setAttribute("message", "你还没有登陆，请先登陆！");
			return "login";
		}
		User dbUser  = userService.loadUserInfo(id);
		modelMap.addAttribute("user",dbUser);
		return "userInfo";
	}
	
	/**
	 * 更新信息
	 * @param modelMap
	 * @param user
	 * @return
	 */
	@RequestMapping("updateInfo")
	public String updateUserInfo(ModelMap modelMap,User user){
		userService.updateInfo(user);
		User dbUser  = userService.loadUserInfo(user.getId());
		modelMap.addAttribute("user",dbUser);
		return "userInfo";
	}
	
	/**
	 * 管理员等入
	 * @param session
	 * @param map
	 * @param name
	 * @param password
	 * @return
	 */
	@RequestMapping("loginAdmin")
	public String loginAdmin(HttpSession session,ModelMap messageMap,User user){
		User dbUser = userService.adminLogin(user);
		if (dbUser == null) {
			messageMap.addAttribute("message", "<font color='red'>用户名或密码错误</font>");
			return "loginAdmin";
		}
		messageMap.addAttribute("message", "<font color='red'>登入成功</font>");
		session.setAttribute("admin", dbUser);
		System.out.println(dbUser);
		return "admin";
	}
	
	
	/**
	 * 管理员等入
	 * @param session
	 * @param map
	 * @param name
	 * @param password
	 * @return
	 */
	@RequestMapping("monitor")
	public String monitor(ModelMap map){
		Calendar calendar=Calendar.getInstance();  
		calendar.setTime(new Date()); 
		calendar.set(Calendar.DAY_OF_MONTH,calendar.get(Calendar.DAY_OF_MONTH)-1);
		Date date = calendar.getTime();
		CrawlerNum cCrawler  = new CrawlerNum();
		cCrawler.setDate(date);
		cCrawler.setNum( cinemaServiceImpl.getCinemaCrawler());
		map.addAttribute("cCrawler", cCrawler);
		
		CrawlerNum nCrawler  = new CrawlerNum();
		nCrawler.setDate(date);
		nCrawler.setNum( newsServiceImpl.getNewsCrawler());
		map.addAttribute("nCrawler",nCrawler);
		
		CrawlerNum mCrawler  = new CrawlerNum();
		mCrawler.setDate(date);
		mCrawler.setNum(movieServiceImpl.getMovieCrawler());
		map.addAttribute("mCrawler", mCrawler);
		
		CrawlerNum dCrawler  = new CrawlerNum();
		dCrawler.setDate(date);
		dCrawler.setNum( discountsServiceImpl.getDiscountCrawler());
		map.addAttribute("dCrawler",dCrawler);
		
		CrawlerNum sCrawler  = new CrawlerNum();
		sCrawler.setDate(date);
		sCrawler.setNum( movieScheduleServiceImpl.getScheduleCrawler());
		map.addAttribute("sCrawler",sCrawler);
		return "monitor";
	}
	
	
	@RequestMapping("commentList")
	public String commentList(ModelMap map){
		List<Comment>commentList = commentServiceImpl.commentList();
		map.put("commentList", commentList);
		return "comment";
	}
	
	@RequestMapping("delComment")
	public String delComment(int id,ModelMap map){
		commentServiceImpl.delComment(id);
		map.addAttribute("message","删除评论成功");
		List<Comment>commentList = commentServiceImpl.commentList();
		map.put("commentList", commentList);
		return "comment";
	}
	
	@RequestMapping("piblicNotice")
	public String piblicNotice(ModelMap map,Notice notice){
		noticeMapper.insert(notice);
		map.put("message", "发布成功");
		return "adminNotice";
	}
	
	
	@RequestMapping("Adminlogout")
	public String Adminlogout(ModelMap map,HttpSession httpSession){
		httpSession.invalidate();
		return "loginAdmin";
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
