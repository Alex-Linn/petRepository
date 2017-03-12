package com.mdd.mt.controller;

import java.util.List;

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

	@RequestMapping("loadIndex")
	public String loadIndex(ModelMap modelMap) {
		List<Movie>movieList = movieServiceImpl.getTopSixMovie();
		modelMap.put("topSixMoive",movieList);
		return "index";
	}
}
