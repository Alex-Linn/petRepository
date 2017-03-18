package com.mdd.mt.service;

import com.mdd.mt.mapper.MovieMapper;
import com.mdd.mt.model.Movie;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.jsoup.helper.StringUtil;
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
     * 保存电影信息(批量)
     *
     * @param movieList
     */
    public void saveMovieList(List<Movie> movieList) {
        if (movieList != null) {
            movieMapper.saveMovieList(movieList);
        }
    }

    /**
     * 保存电影信息
     * @param movie
     */
    public int insertMovie(Movie movie) {
        if (movie != null) {
            int movieId = movieMapper.insertMovie(movie);
            return movieId;
        }
        return 0;
    }

    /**
     * 数据库是否在存该电影
     * @param movieName
     * @return
     */
    public Movie getMovieByName(String movieName) {
        Movie movie = movieMapper.selectByMovieName(movieName);
        return movie;
    }
    
   /**
    * 评分最高的六部电影 isShow 0 是即将上映 1已上映
    * @param isShow
    * @return
    */
    public List<Movie> getTopSixMovie(int isShow) {
        List<Movie> movieList = movieMapper.getTopSixMovie(isShow);
        return movieList;
    }
    
    /**
     * 根据id获取电影
     * @param movieId
     * @return
     */
    public Movie getMovieById(int movieId){
    	Movie movie = movieMapper.selectByPrimaryKey(movieId);
    	return movie;
    }
    
    
    public List<Movie>loadMovieList(int isShow){
    	return movieMapper.loadMovieList(isShow);
    }
}
