package com.mdd.mt.crawler;

import com.mdd.mt.model.Cinema;
import com.mdd.mt.model.Movie;
import com.mdd.mt.model.MovieCinema;
import com.mdd.mt.model.MovieSchedule;
import com.mdd.mt.service.CinemaServiceImpl;
import com.mdd.mt.service.MovieCinemaServiceImpl;
import com.mdd.mt.service.MovieScheduleServiceImpl;
import com.mdd.mt.service.MovieServiceImpl;
import com.mdd.mt.utils.CommonUtils;
import org.jsoup.Jsoup;
import org.jsoup.helper.StringUtil;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.*;

/**
 * Created by Administrator on 2016/12/25.
 */

@Service
public class TaoPiaoPiaoCrawler {
    @Autowired
    private MovieServiceImpl movieService;

    @Autowired
    private CinemaServiceImpl cinemaService;

    @Autowired
    private MovieCinemaServiceImpl movieCinemaService;

    @Autowired
    private MovieScheduleServiceImpl movieScheduleService;


    public void crawlerTest(String indexUrl) throws IOException {
        crawler("http://dianying.taobao.com/showList.htm?spm=a1z21.6646273.city.5.EAQ1oR&n_s=new&city=440300");
    }


    /**
     * 抓取电影
     *
     * @param indexUrl
     * @return
     * @throws IOException
     */
    private void crawler(String indexUrl) throws IOException {
        ArrayList<Movie> movieList = new ArrayList<Movie>();
        Document indexDocument = Jsoup.connect(indexUrl).get();
        if (indexDocument != null) {
            Element element = indexDocument.select("div.tab-movie-list").get(0);
            Elements divElements = element.select("div.tab-movie-list > div");
            for (Element divElement : divElements) {
                /**获取每部电影的详情**/
                String movieUrl = divElement.select("a.movie-card-buy").attr("href");
                Document movieDetailDocument = Jsoup.connect(movieUrl).get();
                if (movieDetailDocument != null) {
                    Movie movie = new Movie();
                    int movieId = 0;

                    Elements movieDivDocument = movieDetailDocument.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div");
                    //电影名
                    String movieName = movieDivDocument.select("h3").text();
                    movie.setMovieName(movieName);
                    /**如果数据库存在改电影则不入库**/
                    Movie dbMovie = movieService.getMovieByName(movieName);
                    if (dbMovie == null) {
                        //英文名
                        String movieEnglishName = movieDivDocument.select("h3 > i").text();
                        movie.setMovieEnglishName(movieEnglishName);
                        //评分
                        String score = movieDivDocument.select("h3 > em").text();
                        movie.setScore(Double.valueOf(score));
                        //上映时间
                        String rescheduledTime = movieDivDocument.select("div.cont-time").text();
                        movie.setRescheduledTime(rescheduledTime);
                        //影片海报url
                        String posterUrl = movieDivDocument.select("div.cont-pic > img").attr("src");
                        movie.setPosterUrl(posterUrl);
                        //影片简介
                        String movieStory = movieDivDocument.select("ul > li.J_shrink.shrink").text();
                        movie.setMovieStory(movieStory);

                        //有时候的页面的<li></li>个数不确定，使用jsoup解析次序乱，所以这里用正则
                        String html = movieDetailDocument.body().toString();
                        //<li>导演：叶伟民</li>
                        //导演
                        String director = CommonUtils.simpleMatch(html, "<li>导演：(.*)</li>");
                        movie.setDirector(director);
                        //演员
                        String performer = CommonUtils.simpleMatch(html, "<li>主演：(.*)</li>");
                        movie.setPerformer(performer);
                        //影片类型
                        String movieType = CommonUtils.simpleMatch(html, "<li>类型：(.*)</li>");
                        movie.setMovieType(movieType);
                        //国家
                        String country = CommonUtils.simpleMatch(html, "<li>制片国家/地区：(.*)</li>");
                        movie.setCountry(country);
                        //语言
                        String movieLanguage = CommonUtils.simpleMatch(html, "<li>语言：(.*)</li>");
                        movie.setMovieLanguage(movieLanguage);
                        //时长
                        String movieTime = CommonUtils.simpleMatch(html, "<li>片长：(.*)</li>");
                        movie.setMovieTime(movieTime);

                        //已经上映
                        movie.setIsShow(1);
//                  http://dianying.taobao.com/showDetailSchedule.htm?showId=154578&ts=1482648277453&n_s=new 百度人
//                  System.out.println( movie);
                        movieId = movieService.insertMovie(movie);
                        System.out.println(movie);
                    } else {
                        movieId = dbMovie.getId();
                    }
                    /**解析影院信息**/
                    //拼接获取电影影院的url
                    String showId = CommonUtils.simpleMatch(movieUrl, "showId=(\\d+)&");
                    String cinemaUrl = "http://dianying.taobao.com/showDetailSchedule.htm?n_s=new&showId=" + showId;
                    Document cinemaDocument = Jsoup.connect(cinemaUrl).timeout(1000 * 60 * 30).get();
                    Elements cinemaDiv = cinemaDocument.select("body > div.filter-wrap > div > ul > li:nth-child(2) > div");
                    Elements cinemasHref = cinemaDiv.get(0).select("a");
                    //今天明天日期的影院场次url
                    for (Element ele : cinemasHref) {
                        Cinema cinema = new Cinema();
                        int cinemaId = 0;
                        String dataParam = ele.attr("data-param");
                        //今天的场次
                        String todayDate = CommonUtils.getDetailScheduleDate(0);
                        if (!StringUtil.isBlank(dataParam) && dataParam.contains("date")) {
                            dataParam.replaceAll("date=(.*)&regionName=", todayDate);
                        }
                        String detailScheduleUrl = "http://dianying.taobao.com/showDetailSchedule.htm?" + dataParam;
                        Document detailScheduleDocument = Jsoup.connect(detailScheduleUrl).timeout(1000 * 60 * 30).get();
                        //影院名
                        String cinemaName = detailScheduleDocument.select("body > div.center-wrap.cinemabar-wrap > h4").text();
                        cinema.setCinemaName(cinemaName);
                        String text = detailScheduleDocument.select("body > div.center-wrap.cinemabar-wrap").text();
                        String regx = "地址：(.*)\\[地图\\].*电话：(\\d+-\\d+)";
                        List<String> groups = CommonUtils.multipMatch(text, regx);
                        String tel = null;
                        String area = null;
                        String address = null;
                        if (groups != null && groups.size() > 0) {
                            //地址
                            address = groups.get(0);
                            cinema.setAddress(address);
                            //区域
                            area = address.substring(0, address.indexOf("区") + 1);
                            cinema.setArea(area);
                            //电话
                            tel = groups.get(1);
                            cinema.setTel(tel);
                        }
                        //地图位置URl
                        String mapUrl = cinemaDocument.select("body > div.center-wrap.cinemabar-wrap > a.more").attr("href");
                        cinema.setMapInfo(mapUrl);
                        //保存影院信息
                        Cinema dbCinema = cinemaService.getCinemaByTel(tel);
                        if (dbCinema == null) {
                            System.out.println(cinema);
                            cinemaId = cinemaService.saveCinema(cinema);
                        } else {
                            cinemaId = dbCinema.getId();
                        }
                        //创建电影和影院的关系对象
                        MovieCinema movieCinema = new MovieCinema();
                        //建立关系
                        System.out.println(cinema);
                        movieCinema.setCinemaId(cinemaId);
                        movieCinema.setMovieId(movieId);
                        //保存关系
                        movieCinemaService.saveMovieCinema(movieCinema);

                        /**解析电影场次**/
                        Elements scheduleTable = detailScheduleDocument.select("table");
                        //防止没有电影场次的情况
                        if (scheduleTable.size() != 0) {
                            List<MovieSchedule> movieScheduleList = new ArrayList<MovieSchedule>();
                            Elements scheduleTr = scheduleTable.get(0).select("tr");
                            for (Element eleTr : scheduleTr) {
                                MovieSchedule movieSchedule = new MovieSchedule();
                                //电影id
                                movieSchedule.setMovieId(movieCinema.getMovieId());
                                //影院id
                                movieSchedule.setCinemaId(movieCinema.getCinemaId());
                                //电影播放时间
                                String timeStr = eleTr.select("td.hall-time").text();
                                if (!StringUtil.isBlank(timeStr)) {
                                    String endHour = timeStr.substring(timeStr.lastIndexOf("预计"));
                                    //结束时间
                                    movieSchedule.setEndTime(endHour);
                                    //通过url参数拿到时间去拼凑数据库的时间 &date=2016-12-24&regionName=&ts=1482592840757&n_s=new
                                    String dateRegx = "date=(.*)&regionName";
                                    String date = CommonUtils.simpleMatch(detailScheduleUrl, dateRegx);
                                    String startHour = eleTr.select("td.hall-time > em").text();
                                    date = date + ":" + startHour;
                                    Date startTime = CommonUtils.string4Date(date);
                                    //电影开始时间
                                    movieSchedule.setStartTime(startTime);
                                }
                                //语言
                                String language = eleTr.select("td.hall-type").text();
                                movieSchedule.setMovieLanguage(language);
                                //影厅
                                String videoHall = eleTr.select("td.hall-name").text();
                                movieSchedule.setVideoHall(videoHall);
                                //票的稀缺度
                                String seatCondition = eleTr.select("td.hall-flow").text();
                                movieSchedule.setSeatCondition(seatCondition);
                                String price = eleTr.select("td.hall-price > em.now").text();
                                try {
                                    movieSchedule.setPrice(Double.valueOf(price));
                                } catch (Exception e) {
                                    System.out.println("票价转换异常");
                                }
                                String buyUrl = eleTr.select("td.hall-seat >a").attr("href");
                                if (!StringUtil.isBlank(buyUrl)) {
                                    movieSchedule.setBuyUrl(buyUrl);
                                } else {
                                    movieSchedule.setBuyUrl(eleTr.select("td.hall-seat").text());
                                }

                                System.out.println(movieSchedule);
                                movieScheduleList.add(movieSchedule);

                            }
                            movieScheduleService.saveMovieSchedule(movieScheduleList);
                        }
                    }
                }

            }
        }
    }

    public static void main(String[] args) {
        try {
            new TaoPiaoPiaoCrawler().crawler("http://dianying.taobao.com/showList.htm?spm=a1z21.6646273.city.5.EAQ1oR&n_s=new&city=440300");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
