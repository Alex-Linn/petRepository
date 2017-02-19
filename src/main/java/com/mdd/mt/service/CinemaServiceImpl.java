package com.mdd.mt.service;

import com.mdd.mt.mapper.CinemaMapper;
import com.mdd.mt.model.Cinema;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * Created by Administrator on 2017/1/11.
 */
@Service
public class CinemaServiceImpl {

    @Autowired
    private CinemaMapper cinemaMapper;

    private static Logger logger = Logger.getLogger(CinemaServiceImpl.class);

    /**
     * 保存影院信息
     *
     * @param cinema
     */
    public int saveCinema(Cinema cinema) {
       int  flag = 0;
        if (cinema != null) {
            flag = cinemaMapper.insertCinema(cinema);
        }
        return flag;
    }

    /**
     * 根据电话号码获取影院信息
     * @param tel
     * @return
     */
    public Cinema getCinemaByTel(String tel){
        Cinema cinema = cinemaMapper.selectByTel(tel);
        return cinema;
    }
}
