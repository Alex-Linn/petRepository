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
     *
     * @param movieList
     */
    public void saveMovie(List<Movie> movieList) {
        if (movieList != null) {
            movieMapper.saveMovieList(movieList);
        }
    }

    public void insertMovie(Movie movie){
        if (movie!=null){
            movieMapper.insertMovie(movie);
        }
    }

}
