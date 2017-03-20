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
import com.mdd.mt.service.NewsServiceImpl;

/**
 * 
 * @author xwl
 *
 */
@Controller
@RequestMapping("/mt/")
public class NewsController {
	@Autowired
	private NewsServiceImpl newsServiceImpl;
	
	/**
	 * 加载三天新闻
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("loadLastThreeNews")
	public String loadLastThreeNews(ModelMap modelMap) {
		List<News> newsList = newsServiceImpl.getLastNews();
		modelMap.addAttribute("newsList", newsList);
		return "news";
	}
	
	@RequestMapping("loadNews")
	public String loadNews(ModelMap modelMap,int id){
		News news = newsServiceImpl.loadNews(id);
		modelMap.addAttribute("news", news);
		return "newsDetial";
	}
	
	
}