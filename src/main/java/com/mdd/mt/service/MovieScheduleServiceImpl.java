package com.mdd.mt.service;

import com.mdd.mt.mapper.CinemaMapper;
import com.mdd.mt.mapper.MovieScheduleMapper;
import com.mdd.mt.model.Cinema;
import com.mdd.mt.model.MovieSchedule;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/1/11.
 */
@Service
public class MovieScheduleServiceImpl {

    @Autowired
    private MovieScheduleMapper movieScheduleMapper;

    private static Logger logger = Logger.getLogger(MovieScheduleServiceImpl.class);

    /**
     * 保存场次信息
     *
     * @param movieScheduleList
     */
    public void saveMovieSchedule(List<MovieSchedule> movieScheduleList) {
        if (movieScheduleList != null && movieScheduleList.size()>0) {
            movieScheduleMapper.saveMovieScheduleList(movieScheduleList);
        }
    }

	public List<MovieSchedule> loadScheduleList(int movieId, int cinemaId) {
		return movieScheduleMapper.loadScheduleList(movieId,cinemaId);
	}
	
	public int getScheduleCrawler(){
		return movieScheduleMapper.getScheduleCrawler();
}
}
