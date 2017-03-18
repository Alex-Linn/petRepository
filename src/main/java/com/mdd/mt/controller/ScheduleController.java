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
import com.mdd.mt.model.MovieSchedule;
import com.mdd.mt.service.CinemaServiceImpl;
import com.mdd.mt.service.MovieScheduleServiceImpl;

/**
 * 
 * @author xwl
 *
 */
@Controller
@RequestMapping("/mt/")
public class ScheduleController {
	@Autowired
	private MovieScheduleServiceImpl movieScheduleServiceImpl;

	/**
	 * 异步加载场次
	 * 
	 * @return
	 */
	@RequestMapping(value = "movieScheduleList", method = RequestMethod.POST)
	@ResponseBody
	public List<MovieSchedule> movieScheduleList(int movieId, int cinemaId) {
		List<MovieSchedule> movieScheduleList = movieScheduleServiceImpl.loadScheduleList(movieId, cinemaId);
		return movieScheduleList;
	}
}
