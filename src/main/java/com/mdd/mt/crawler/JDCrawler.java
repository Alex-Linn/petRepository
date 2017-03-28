package com.mdd.mt.crawler;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.mdd.mt.model.Cinema;
import com.mdd.mt.model.Movie;
import com.mdd.mt.model.MovieCinema;
import com.mdd.mt.model.MovieSchedule;
import com.mdd.mt.service.CinemaServiceImpl;
import com.mdd.mt.service.MovieCinemaServiceImpl;
import com.mdd.mt.service.MovieScheduleServiceImpl;
import com.mdd.mt.service.MovieServiceImpl;
import com.mdd.mt.utils.CommonUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.*;

@Service
public class JDCrawler {
	@Autowired
	private MovieServiceImpl movieService;

	@Autowired
	private CinemaServiceImpl cinemaService;

	@Autowired
	private MovieCinemaServiceImpl movieCinemaService;

	@Autowired
	private MovieScheduleServiceImpl movieScheduleService;

	private static Log log = LogFactory.getLog(JDCrawler.class);

	private static String getCinemaIdUrl = "http://movie.jd.com/json/seat/seat_movieIssue.action?cityId=4403";

	private static String getCinameUrl = "http://movie.jd.com/json/seat/seat_buy.action?cityId=4403";

	/**
	 * 京东电影票爬虫
	 * 
	 * @param indexUrl
	 *            "http://movie.jd.com/m_channel"
	 */
	public void crawler(String indexUrl) {
		List<String> movieUrlList = getMovieDetailUrl(indexUrl);
		for (String movieUrl : movieUrlList) {
			Element movieBody = null;
			try {
				movieBody = Jsoup.connect(movieUrl).timeout(60*30).get().body();
			} catch (IOException e) {
				log.debug("获取电影详细页出错！");
			}
			// 解析电影
			Movie movie = analyzeMovie(movieBody);
			System.out.println(movie);
			
			//数据库存在则不入库
			Movie dbMovie = movieService.getMovieByName(movie.getMovieName());
			int movieId;
			if(dbMovie!=null&&StringUtils.isNotBlank(dbMovie.getMovieName())){
				movieId = dbMovie.getId();
			}else{
				movieService.insertMovie(movie);
				movieId = movie.getId();
			}
			
			// 拼接影院url
			if (StringUtils.isNotBlank(movieUrl) && movieUrl.contains("_")) {
				String movieUrlId = movieUrl.substring(movieUrl.indexOf("_") + 1);
				String date = CommonUtils.date2String(new Date());
				String cinemaIdUrl = getCinemaIdUrl + "&movieId=" + movieUrlId + "&day=" + date + "&regionId=0";
				
				Element cinemaJsonStr = null;
				try {
					cinemaJsonStr = Jsoup.connect(cinemaIdUrl).ignoreContentType(true).timeout(60*30).get().body();
				} catch (IOException e) {
					log.debug("获取影院id出错！");
				}

				Set<String> cinameUrlSet = analyzeCinemaUrl(cinemaJsonStr.toString(), movieUrlId);
				Iterator<String> it = cinameUrlSet.iterator();
				while (it.hasNext()) {
					String cinemaScheduleJsonStr = "";
					String url = it.next();
					try {
						cinemaScheduleJsonStr = Jsoup.connect(url).ignoreContentType(true).timeout(60*30).get().body()
								.toString();
					} catch (IOException e) {
						log.debug("获取影院页出错！");
					}

					cinemaScheduleJsonStr = cinemaScheduleJsonStr.replace("null(", "").replace("<body>", "")
							.replace("</body>", "");
					cinemaScheduleJsonStr = cinemaScheduleJsonStr.substring(0, cinemaScheduleJsonStr.lastIndexOf(");"));
					JSONObject.parse(cinemaScheduleJsonStr);
					JSONObject JsonObject = JSON.parseObject(cinemaScheduleJsonStr);
					// 影院信息
					JSONObject cinemaDetailJson = (JSONObject) JsonObject.get("cinemaDetail");
					if (cinemaDetailJson != null) {
						Cinema cinema = new Cinema();
						// 影院名称
						cinema.setCinemaName((String) cinemaDetailJson.get("cinemaName"));
						//城市
						cinema.setCity("深圳");
						// 地址
						cinema.setAddress((String) cinemaDetailJson.get("address"));
						//图片
						cinema.setPicture((String) cinemaDetailJson.get("cinemaPic"));
						// 电话
						cinema.setTel((String) cinemaDetailJson.get("conactTel"));
						// 区域
						cinema.setArea((String) cinemaDetailJson.get("regionName"));
						// 介绍
						cinema.setIntroduction((String) cinemaDetailJson.get("introduction"));
						// 环境
						cinema.setCinemaDesc((String) cinemaDetailJson.get("cinemaDesc"));
						System.out.println(cinema);
						//电影院信息数据库存在则不入库
						Cinema dbCinema = cinemaService.getCinemaByTel(cinema.getTel());
						int cinemaId; 
						if(dbCinema!=null){
							cinemaId = dbCinema.getId();
						}else{
							cinemaService.saveCinema(cinema);
							cinemaId = cinema.getId();
						}
						
						//保存电影和电影院关联关系
						MovieCinema movieCinema = new MovieCinema();
						movieCinema.setCinemaId(cinemaId);
						movieCinema.setMovieId(movieId);
						movieCinemaService.saveMovieCinema(movieCinema);
						
						// 解析场次
						String showData = JsonObject.get("showData").toString();
						
						List<MovieSchedule> movieScheduleList = analyzeMovieSchedule(showData,movieId,cinemaId);
						
						System.out.println(movieScheduleList);
						//保存场次信息
						movieScheduleService.saveMovieSchedule(movieScheduleList);

					}

				}
			}
		}

	}

	/**
	 * 解析电影场次
	 * 
	 * @param showData
	 * @return
	 */
	private List<MovieSchedule> analyzeMovieSchedule(String showData,int movieId,int cinemaId) {
		List<MovieSchedule> movieScheduleList = new ArrayList<MovieSchedule>();
		JSONArray jsonArray = JSON.parseArray(showData);
		if (jsonArray != null && jsonArray.size() > 0) {
			for (int i = 0; i < jsonArray.size(); i++) {
				String itemSchedule = jsonArray.get(i).toString();
				JSONObject itemScheduleJson = (JSONObject) JSONObject.parse(itemSchedule);
				MovieSchedule ms = getMovieSchedule(itemScheduleJson);
				ms.setCinemaId(cinemaId);
				ms.setMovieId(movieId);
				movieScheduleList.add(ms);
				// 其他平台的电影场次
				JSONArray otherAgentArray = JSON.parseArray(itemScheduleJson.get("otherAgent").toString());
				if (otherAgentArray != null && otherAgentArray.size() > 0) {
					for(int j= 0;j<otherAgentArray.size();j++){
						String otherItemSchedule = otherAgentArray.get(j).toString();
						JSONObject otherItemScheduleJson = (JSONObject) JSONObject.parse(otherItemSchedule);
						MovieSchedule otherMs = getMovieSchedule(otherItemScheduleJson);
						otherMs.setCinemaId(cinemaId);
						otherMs.setMovieId(movieId);
						movieScheduleList.add(otherMs);
					}
				}

			}
		}
		return movieScheduleList;
	}

	private MovieSchedule getMovieSchedule(JSONObject itemScheduleJson) {
		MovieSchedule movieSchedule = new MovieSchedule();
		if (itemScheduleJson != null) {
			// 供应商
			movieSchedule.setWebsiteType((String) itemScheduleJson.get("pagent"));
			// 开始时间
			movieSchedule.setStartTime((String) itemScheduleJson.get("ptime"));
			// 结束时间
			movieSchedule.setEndTime((String) itemScheduleJson.get("pendtime"));
			// 票价
			movieSchedule.setPrice(CommonUtils.string2double((String) itemScheduleJson.get("pprice")));
			// 厅室
			movieSchedule.setVideoHall((String) itemScheduleJson.get("pseat"));
			// 语言
			movieSchedule.setMovieLanguage((String) itemScheduleJson.get("ptype"));
			// 语言（要拼接url）
			movieSchedule.setBuyUrl(itemScheduleJson.get("pid").toString());
		}
		return movieSchedule;
	}

	/**
	 * 解析电影信息
	 * 
	 * @param movieBody
	 * @return
	 */
	private Movie analyzeMovie(Element movieBody) {
		Movie movie = new Movie();
		// 电影名
		String movieName = movieBody.select("#movieId").text();
		movie.setMovieName(movieName);
		// 评分
		String scoreStr = movieBody.select("body > div.movie-top > div > div.mt-title > div > div.clearfix > div > em")
				.text();
		if (StringUtils.isNotBlank(scoreStr) && !"暂无评分".equals(scoreStr)) {
			movie.setScore(CommonUtils.string2double(scoreStr));
		}
		// 海报
		Element infoElement = movieBody.select("body > div.movie-top > div > div.mt-infor").get(0);
		String posterUrl = infoElement.select("div.img >img").attr("src");
		movie.setPosterUrl(posterUrl);
		// 导演
		String director = infoElement.select("dl > dd.movie-director > div > p").text();
		movie.setDirector(director);
		// 演员
		String performer = "";
		Elements nameEles = infoElement.select("div.name");
		for (Element ele : nameEles) {
			performer = performer + ele.text();
		}
		movie.setPerformer(performer);
		
		Elements spanElements = infoElement.select("dl > dd.movie-type > div > p > span");
		if(spanElements!=null&&spanElements.size()>0){
			String movieType = "";//类型有可能很多个
			for(Element ele :spanElements){
				String str = ele.text();
				if(str.endsWith("分钟")){
					// 时间
					movie.setMovieTime(str);
				}else if(str.endsWith("上映")){
					// 上映时间
					movie.setRescheduledTime(str);
				}else{
					movieType += str+"、"; 
				}
			}
			// 类型
			movie.setMovieType(movieType);
		}
		// 剧情
		String movieStory = infoElement.select("dl > dd.movie-intro.js-plot-short-infor > div > div > div > p").text();
		movie.setMovieStory(movieStory);
		movie.setIsShow(1);
		return movie;
	}

	/**
	 * 拿到热映电影url
	 * 
	 * @param indexUrl
	 * @return
	 */
	private List<String> getMovieDetailUrl(String indexUrl) {
		ArrayList<String> list = new ArrayList<String>();
		Element body = null;
		try {
			body = Jsoup.connect(indexUrl).get().body();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements ddElements = body.select("#list1 > ul > li >dl >dd");
		for (Element ele : ddElements) {
			String url = ele.select("div.p-img > a").attr("href");
			if (StringUtils.isBlank(url)) {
				continue;
			}
			url = "http://movie.jd.com" + url;
			list.add(url);
		}
		return list;
	}

	/**
	 * 解析所有电影院的url的id
	 * 
	 * @param jsonStr
	 * @return
	 */
	private Set<String> analyzeCinemaUrl(String jsonStr, String movieUrlId) {
		LinkedHashSet<String> set = new LinkedHashSet<String>();
		if (StringUtils.isNotBlank(jsonStr)) {
			String date = CommonUtils.date2String(new Date());
			List<String> cinemaIdList = CommonUtils.multipMatch2(jsonStr, "\"pid\":(\\d*)");
			for (String cinemaId : cinemaIdList) {
				if (StringUtils.isNotBlank(cinemaId) && !"0".equals(cinemaId)) {
					String cinameUrlResult = getCinameUrl + "&movieId=" + movieUrlId + "&day=" + date + "&cinemaId="
							+ cinemaId;
					set.add(cinameUrlResult);
				}
			}
		}
		return set;
	}

	public static void main(String[] args) {

		JDCrawler jdCrawler = new JDCrawler();
		jdCrawler.crawler("http://movie.jd.com/m_channel");
	}
}
