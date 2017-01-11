package com.mdd.mt.service;

import com.mdd.mt.mapper.MovieCinemaMapper;
import com.mdd.mt.model.MovieCinema;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/1/11.
 */
@Service
public class MovieCinemaServiceImpl {
    @Autowired
    private MovieCinemaMapper movieCinemaMapper;

    private static Logger logger = Logger.getLogger(MovieCinemaServiceImpl.class);

    public void saveMovieCinemaList(List<MovieCinema>movieCinemaList){
        if(movieCinemaList!=null){
            movieCinemaMapper.saveMovieCinemaList(movieCinemaList);
        }
    }

}
