package com.mdd.mt.mapper;

import com.mdd.mt.model.MovieSchedule;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MovieScheduleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MovieSchedule record);

    int insertSelective(MovieSchedule record);

    MovieSchedule selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MovieSchedule record);

    int updateByPrimaryKey(MovieSchedule record);

    /**
     * 批量保存
     * @param movieScheduleList
     * @return
     */
    void saveMovieScheduleList(List<MovieSchedule>movieScheduleList);

    /**
     * 查询电影场次
     * @param movieId
     * @param cinemaId
     * @return
     */
	List<MovieSchedule> loadScheduleList(@Param("movieId")int movieId, @Param("cinemaId")int cinemaId);

	int getScheduleCrawler();
}