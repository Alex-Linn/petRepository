package com.mdd.mt.mapper;

import java.util.List;

import com.mdd.mt.model.News;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKeyWithBLOBs(News record);

    int updateByPrimaryKey(News record);
    
    News selectNews(String title);
    /**
     * 最近三天的新闻
     * @return
     */
    List<News>getLastNews();
    
}