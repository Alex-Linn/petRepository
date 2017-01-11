package com.mdd.mt.mapper;

import com.mdd.mt.model.Cinema;

import java.util.List;

public interface CinemaMapper {
    int deleteByPrimaryKey(Integer id);

    boolean insert(Cinema record);

    int insertSelective(Cinema record);

    Cinema selectByPrimaryKey(Integer id);

    void saveCinemaList(List<Cinema> cinemaList);
}