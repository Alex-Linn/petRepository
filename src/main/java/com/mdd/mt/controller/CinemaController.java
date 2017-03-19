package com.mdd.mt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mdd.mt.model.Cinema;
import com.mdd.mt.model.Movie;
import com.mdd.mt.service.CinemaServiceImpl;

/**
 * 
 * @author xwl
 *
 */
@Controller
@RequestMapping("/mt/")
public class CinemaController {
	@Autowired
	private CinemaServiceImpl cinemaServiceImpl;

	/**
	 * 加载区域
	 * 
	 * @param modelMap
	 * @param city
	 * @return
	 */
	@RequestMapping("loadAreaByCity")
	public String loadAreaByCity(ModelMap modelMap, String city) {
		List<String> areaList = cinemaServiceImpl.loadAreaByCity(city);
		modelMap.addAttribute("areaList", areaList);
		return "cinemaList";
	}

	/**
	 * 加载影院信息
	 * 
	 * @param modelMap
	 * @param city
	 * @param area
	 * @return
	 */
	@RequestMapping("loadCinemaList")
	public String loadCinemaList(ModelMap modelMap, String city, String area) {
		List<String> areaList = cinemaServiceImpl.loadAreaByCity(city);
		modelMap.addAttribute("areaList", areaList);
		List<Cinema> cinemaList = cinemaServiceImpl.loadCinemaList(city, area);
		modelMap.addAttribute("cinemaList", cinemaList);
		return "cinemaList";
	}
	
	/**
	 * 异步加载电影
	 * @return
	 */
	@RequestMapping(value="ajaxLoadCinemaList",method=RequestMethod.POST)
	@ResponseBody
	public List<Cinema>ajaxLoadCinemaList(String city,String area,int movieId){
		List<Cinema> cinemaList = cinemaServiceImpl.loadCinemaList1(city, area,movieId);
		return cinemaList;
	}
	
	/**
	 * 加载电影信息
	 * @param cinemaId
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("loadCinema")
	public String loadCinema(int cinemaId,ModelMap modelMap){
		Cinema cinema = cinemaServiceImpl.loadCinemaById(cinemaId);
		List<Movie>movieList = cinemaServiceImpl.loadMovieByCinemaId(cinemaId);
		modelMap.addAttribute("cinema", cinema);
		modelMap.addAttribute("movieList", movieList);
		return "cinemaDetail";
	}

}
