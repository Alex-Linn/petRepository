package com.mdd.mt.mapper;

import com.mdd.mt.model.MovieCinema;

import java.util.List;

public interface MovieCinemaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MovieCinema record);

    int insertSelective(MovieCinema record);

    MovieCinema selectByPrimaryKey(Integer id);

    /**
     * 批量插入
     * @param movieCinemaList
     */
    void insertMovieCinemaList(List<MovieCinema>movieCinemaList);

    /**
     * 插入影院和电影关系
     * @param movieCinema
     */
    void insertMovieCinema(MovieCinema movieCinema);

}