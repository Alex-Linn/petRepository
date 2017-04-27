package com.wl.dao;

import com.wl.model.News;

public interface NewsMapper {

	/**
	 * 根据ID查找新闻
	 * @param id
	 * @return
	 */
	News selectNews(Integer id);
	/**
	 * 新增新闻
	 * @param record
	 * @return
	 */
	int insert(News record);
	/**
	 * 更新新闻
	 * @param record
	 * @return
	 */
	int updateByPrimaryKey(News record);
	
	
}
