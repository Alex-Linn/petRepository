package com.wl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wl.dao.NewsMapper;
import com.wl.model.News;
import com.wl.service.INewsService;

@Service
public class NewsService implements INewsService{

	@Resource
	private NewsMapper newsMapper;
	
	/**
	 * 加载新闻
	 */
	@Override
	public News loadNews(Integer id) {
		return newsMapper.selectNews(id);
	}

}
