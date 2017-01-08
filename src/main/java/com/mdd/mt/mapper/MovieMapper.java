package com.mdd.mt.mapper;

import com.mdd.mt.model.Movie;

public interface MovieMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Movie record);

    int insertSelective(Movie record);

    Movie selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Movie record);

    int updateByPrimaryKeyWithBLOBs(Movie record);

    int updateByPrimaryKey(Movie record);
}