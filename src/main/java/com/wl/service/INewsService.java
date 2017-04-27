package com.wl.service;

import com.wl.model.News;

public interface INewsService {

	/**
	 * 加载新闻内容
	 * @param content
	 * @return
	 */
	public News loadNews(Integer id);
}
