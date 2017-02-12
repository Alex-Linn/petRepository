package com.mdd.mt.mapper;

import com.mdd.mt.model.MovieSchedule;

import java.util.List;

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
    int saveMovieScheduleList(List<MovieSchedule>movieScheduleList);
}