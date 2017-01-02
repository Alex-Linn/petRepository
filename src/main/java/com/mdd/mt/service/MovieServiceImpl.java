package com.mdd.mt.service;

import com.mdd.mt.mapper.MovieMapper;
import com.mdd.mt.model.Movie;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/1/2.
 */
@Service
public class MovieServiceImpl {
    @Autowired
    private MovieMapper movieMapper;

    private static Logger logger = Logger.getLogger(MovieServiceImpl.class);

    /**
     * 保存电影信息
     * @param moiveList
     */
    public void saveMoive(List<Movie> moiveList){
        //如果数据库有值，则不存储
        if(moiveList!=null){
        for (Movie movie:moiveList) {
            Movie m = movieMapper.queryMovieByName(movie.getMovieName());
            if (m!=null){
                moiveList.remove(m);
            }
        }
        movieMapper.saveMoive(moiveList);
    }else {
        logger.info("movie列表为空！");
    }
}

}
