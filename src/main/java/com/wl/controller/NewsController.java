package com.wl.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wl.model.News;
import com.wl.service.INewsService;

@Controller
@RequestMapping("/news/")
public class NewsController {  

	@Resource
	private INewsService newsService;
	
	@RequestMapping(value="loadNews")
	public String loadNews(News content,HttpServletRequest request){
		newsService.loadNews(content.getId());
		return null;
	}
}
