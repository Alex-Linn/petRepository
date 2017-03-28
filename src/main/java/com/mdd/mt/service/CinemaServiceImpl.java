package com.mdd.mt.service;

import com.mdd.mt.mapper.CinemaMapper;
import com.mdd.mt.mapper.MovieMapper;
import com.mdd.mt.model.Cinema;
import com.mdd.mt.model.Movie;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/1/11.
 */
@Service
public class CinemaServiceImpl {

	@Autowired
	private CinemaMapper cinemaMapper;

	private static Logger logger = Logger.getLogger(CinemaServiceImpl.class);

	/**
	 * 保存影院信息
	 *
	 * @param cinema
	 */
	public int saveCinema(Cinema cinema) {
		int flag = 0;
		if (cinema != null) {
			flag = cinemaMapper.insertCinema(cinema);
		}
		return flag;
	}

	/**
	 * 根据电话号码获取影院信息
	 * 
	 * @param tel
	 * @return
	 */
	public Cinema getCinemaByTel(String tel) {
		Cinema cinema = cinemaMapper.selectByTel(tel);
		return cinema;
	}

	/**
	 * 根据城市加载区域
	 * 
	 * @param cityName
	 * @return
	 */
	public List<String> loadAreaByCity(String cityName) {
		return cinemaMapper.loadAreaByCity(cityName);
	}

	/**
	 * 加载影院信息
	 * @param city
	 * @param area
	 * @return
	 */
	public List<Cinema> loadCinemaList(String city, String area) {
		return cinemaMapper.loadCinemaList(city, area);
	}
	
	/**
	 * 加载影院信息
	 * @param city
	 * @param area
	 * @return
	 */
	public List<Cinema> loadCinemaList1(String city, String area,int movieId) {
		return cinemaMapper.loadCinemaList1(city, area,movieId);
	}

	/**
	 * 加载影院信息
	 * @param cinemaId
	 */
	public Cinema loadCinemaById(int cinemaId) {
		return cinemaMapper.loadCinemaById(cinemaId);
	}

	/**
	 * 查询该电影放映的电影
	 * @param cinemaId
	 * @return
	 */
	public List<Movie> loadMovieByCinemaId(int cinemaId) {
		return cinemaMapper.loadMovieByCinemaId(cinemaId);
	}
	
	public int getCinemaCrawler(){
			return cinemaMapper.getCinemaCrawler();
	}
}
