package com.mdd.mt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mdd.mt.model.Cinema;
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

}
