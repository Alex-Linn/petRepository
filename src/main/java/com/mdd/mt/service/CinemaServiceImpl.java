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
    public boolean saveCinema(Cinema cinema) {
        boolean flag = false;
        if (cinema != null) {
            flag = cinemaMapper.insert(cinema);
        }
        return flag;
    }
}
