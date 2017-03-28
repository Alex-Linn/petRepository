package com.mdd.mt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mdd.mt.mapper.NewsMapper;
import com.mdd.mt.model.News;

@Service
public class NewsServiceImpl {
	@Autowired
	private NewsMapper newsMapper;

	public void saveNew(News news) {
		newsMapper.insert(news);
	}

	public News selectNews(String title) {
		return newsMapper.selectNews(title);
	}

	/**
	 * 最近三天的新闻
	 * 
	 * @return
	 * 
	 */
	public List<News> getLastNews() {
		return newsMapper.getLastNews();
	}

	public News loadNews(int id) {
		return newsMapper.selectByPrimaryKey(id);
	}
	
	public int getNewsCrawler(){
		return newsMapper.getNewsCrawler();
	}
}
