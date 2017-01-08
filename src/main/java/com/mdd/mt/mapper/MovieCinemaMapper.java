package com.mdd.mt.mapper;

import com.mdd.mt.model.MovieCinema;

public interface MovieCinemaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MovieCinema record);

    int insertSelective(MovieCinema record);

    MovieCinema selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MovieCinema record);

    int updateByPrimaryKey(MovieCinema record);
}