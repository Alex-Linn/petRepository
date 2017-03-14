package com.mdd.mt.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mdd.mt.model.Movie;
import com.mdd.mt.service.MovieServiceImpl;

/**
 * 
 * @author xwl
 *
 */
@Controller
@RequestMapping("/mt/")
public class MovieController {
	@Autowired
	private MovieServiceImpl movieServiceImpl;

	/**
	 * 加载首页信息
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("loadIndex")
	public String loadIndex(ModelMap modelMap) {
		//已上映
		List<Movie>isShowMovieList = movieServiceImpl.getTopSixMovie(1);
		//未上映
		List<Movie>noShowMovieList = movieServiceImpl.getTopSixMovie(0);
		modelMap.put("isShowMovieList",isShowMovieList);
		modelMap.put("noShowMovieList",noShowMovieList);
		return "index";
	}
	
	/**
	 * 电影详细信息
	 * @param movieId
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("loadMovie")
	public String movieDetail(@Param("movieId")int movieId,ModelMap modelMap){
		Movie movie = movieServiceImpl.getMovieById(movieId);
		modelMap.addAttribute("movie",movie);
		return "movieDetail";
	}
}
