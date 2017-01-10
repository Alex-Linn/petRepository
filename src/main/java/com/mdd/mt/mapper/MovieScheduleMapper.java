package com.mdd.mt.mapper;

import com.mdd.mt.model.MovieSchedule;

public interface MovieScheduleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MovieSchedule record);

    int insertSelective(MovieSchedule record);

    MovieSchedule selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MovieSchedule record);

    int updateByPrimaryKey(MovieSchedule record);
}