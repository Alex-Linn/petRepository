package com.mdd.mt.mapper;

import com.mdd.mt.model.Cinema;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CinemaMapper {
    int deleteByPrimaryKey(Integer id);


    /**
     * 保存电影信息
     * @param record
     * @return
     */
    int insertCinema(Cinema record);

    /**
     * 根据id查询电影
     * @param id
     * @return
     */
    Cinema selectByPrimaryKey(Integer id);

    /**
     * 根据影院的电话号码查找影院信息，影院号码是唯一的
     * @param tel
     * @return
     */
    Cinema selectByTel(@Param("tel") String tel);

    /**
     * 批量插入电影
     * @param cinemaList
     */
    void saveCinemaList(List<Cinema> cinemaList);
    
    /**
     * 根据城市名加载影院
     * @param cityName
     * @return
     */
    List<String>loadAreaByCity(String cityName);


    /**
     * 加载影院信息
     * @param city
     * @param area
     * @return
     */
	List<Cinema> loadCinemaList(@Param("city")String city, @Param("area")String area);
}