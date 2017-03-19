package com.mdd.mt.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mdd.mt.model.MovieSchedule;
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
	public List<List<MovieSchedule>> movieScheduleList(int movieId, int cinemaId) {
		List<MovieSchedule> movieSchedules = movieScheduleServiceImpl.loadScheduleList(movieId, cinemaId);
		System.out.println("movieSchedules"+movieSchedules);
		//划分每个时间段每个平台电影场次
		Set<String>endTimeSet = new HashSet<>();
		for(MovieSchedule ms:movieSchedules){
			endTimeSet.add(ms.getEndTime());
		}
		List<List<MovieSchedule>>movieScheduleList = new ArrayList<>();
		Iterator<String> it= endTimeSet.iterator();
		while(it.hasNext()){
			String endTime = it.next();
			List<MovieSchedule>msList = new ArrayList<>();
			for(MovieSchedule ms:movieSchedules){
				if(endTime.equalsIgnoreCase(ms.getEndTime())){
					msList.add(ms);
				}
			}
			movieScheduleList.add(msList);
		}
		System.out.println(movieScheduleList);
		return movieScheduleList;
	}
}
