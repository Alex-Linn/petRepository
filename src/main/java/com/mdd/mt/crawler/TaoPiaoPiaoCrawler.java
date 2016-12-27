package com.mdd.mt.crawler;

import com.mdd.mt.model.Cinema;
import com.mdd.mt.model.MoiveSchedule;
import com.mdd.mt.model.Movie;
import com.mdd.mt.utils.CommonUtils;
import org.jsoup.Jsoup;
import org.jsoup.helper.StringUtil;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/12/25.
 */
public class TaoPiaoPiaoCrawler {
    public void crawler(String indexUrl) throws IOException {

        Document indexDocument = Jsoup.connect(indexUrl).get();
        if (indexDocument != null) {
            Element element = indexDocument.select("div.tab-movie-list").get(0);
            Elements divElements = element.select("div.tab-movie-list > div");
            for (Element divElement : divElements) {
                /**获取每部电影的详情**/
                String movieUrl = divElement.select("a.movie-card-buy").attr("href");
                Document movieDetailDocument = Jsoup.connect(movieUrl).get();
                if (movieDetailDocument != null) {
                    Movie moive = new Movie();
                    //电影名
                    String movieName = movieDetailDocument.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > h3").text();
                    moive.setMovieName(movieName);
                    //英文名
                    String movieEnglishName = movieDetailDocument.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > h3 > i").text();
                    moive.setMovieEnglishName(movieEnglishName);
                    //评分
                    String score = movieDetailDocument.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > h3 > em").text();
                    moive.setScore(Double.valueOf(score));
                    //上映时间
                    String rescheduledTime = movieDetailDocument.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > div.cont-time").text();
                    moive.setRescheduledTime(rescheduledTime);
                    //导演
                    String director = movieDetailDocument.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li:nth-child(2)").text();
                    moive.setDirector(director);
                    //演员
                    String performer = movieDetailDocument.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li:nth-child(3)").text();
                    moive.setPerformer(performer);
                    //影片类型
                    String movieType = movieDetailDocument.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li:nth-child(4)").text();
                    moive.setMovieType(movieType);
                    //国家
                    String country = movieDetailDocument.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li:nth-child(5)").text();
                    moive.setCountry(country);
                    //语言
                    String moiveLanguage = movieDetailDocument.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li:nth-child(6)").text();
                    moive.setLanguage(moiveLanguage);
                    //时长
                    String movieTime = movieDetailDocument.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li:nth-child(7)").text();
                    moive.setMovieTime(movieTime);
                    //影片简介
                    String moiveStory = movieDetailDocument.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li.J_shrink.shrink").text();
                    moive.setMoiveStory(moiveStory);
                    //影片海报url
                    String posterUrl = movieDetailDocument.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > div.cont-pic > img").attr("href");
                    moive.setPosterUrl(posterUrl);
                    //已经上映
                    moive.setIsShow(1);
                    System.out.println(moive);

//                  http://dianying.taobao.com/showDetailSchedule.htm?showId=154578&ts=1482648277453&n_s=new 百度人
                    /**每场电影，播放的影院和场次**/
                    //拼接获取电影影院的url
                    String showId = CommonUtils.simpleMatch(movieUrl, "showId=(\\d+)&");
                    String cinemaUrl = "http://dianying.taobao.com/showDetailSchedule.htm?n_s=new&showId=" + showId;
                    Document cinemaDocument = Jsoup.connect(cinemaUrl).timeout(1000 * 60 * 30).get();
                    Elements cinemaDiv = cinemaDocument.select("body > div.filter-wrap > div > ul > li:nth-child(2) > div");
                    Elements cinemasHref = cinemaDiv.get(0).select("a");
                    //装今天明天日期的影院场次url
                    for (Element ele : cinemasHref) {
                        String dataParam = ele.attr("data-param");
                        //每家电影每个时间段的电影场次
                        //今天的场次
                        String todayDate = CommonUtils.getDetailScheduleDate(0);
                        if (!StringUtil.isBlank(dataParam) && dataParam.contains("date")) {
                            dataParam.replaceAll("date=(.*)&regionName=", todayDate);
                        }
                        Cinema cinema = new Cinema();
                        String detailScheduleUrl = "http://dianying.taobao.com/showDetailSchedule.htm?" + dataParam;
                        Document detailScheduleDocument = Jsoup.connect(detailScheduleUrl).timeout(1000 * 60 * 30).get();
                        //影院名
                        String cinemaName = detailScheduleDocument.select("body > div.center-wrap.cinemabar-wrap > h4").text();
                        cinema.setCinemaName(cinemaName);
                        String text = detailScheduleDocument.select("body > div.center-wrap.cinemabar-wrap").text();
                        String regx = "地址：(.*)\\[地图\\].*电话：(\\d+-\\d+)";
                        List<String> groups = CommonUtils.multipMatch(text, regx);
                        if (groups != null && groups.size() > 0) {
                            //地址
                            String address = groups.get(0);
                            cinema.setAddress(address);
                            //区域
                            String area = address.substring(0, address.indexOf("区") + 1);
                            cinema.setArea(area);
                            //电话
                            String tel = groups.get(1);
                            cinema.setTel(tel);
                        }
                        //地图位置URl
                        String mapUrl = cinemaDocument.select("body > div.center-wrap.cinemabar-wrap > a.more").attr("href");
                        cinema.setMapInfo(mapUrl);
                        System.out.println(cinema);

                        //解析影院场次
                        Elements scheduleTable = cinemaDocument.select("table");
                        //防止没有电影场次的情况
                        if (scheduleTable.size() != 0) {
                            Elements scheduleTr = scheduleTable.get(0).select("tr");
                            for (Element eleTr : scheduleTr) {
                                MoiveSchedule moiveSchedule = new MoiveSchedule();
                                //电影播放时间
                                String timeStr = eleTr.select("td.hall-time").text();
                                if (!StringUtil.isBlank(timeStr)) {
                                    String startHour = timeStr.substring(0, timeStr.indexOf("预计"));
                                    String endHour = timeStr.substring(timeStr.lastIndexOf("预计"));
                                    //结束时间
                                    moiveSchedule.setEndTime(endHour);
                                    //通过url参数拿到时间去拼凑数据库的时间 &date=2016-12-24&regionName=&ts=1482592840757&n_s=new
                                    String dateRegx = "date=(.*)&regionName";
                                    String date = CommonUtils.simpleMatch(detailScheduleUrl, dateRegx);
                                    date = date + ":" + startHour;
                                    Date startTime = CommonUtils.String4Date(date);
                                    //电影开始时间
                                    moiveSchedule.setStartTime(startTime);
                                    //语言
                                    String language = eleTr.select("td.hall-type").text();
                                    moiveSchedule.setLanguage(language);
                                    //影厅
                                    String videoHall = eleTr.select("td.hall-name").text();
                                    moiveSchedule.setVideoHall(videoHall);
                                    //票的稀缺度
                                    String seatCondition = eleTr.select("td.hall-flow").text();
                                    moiveSchedule.setSeatCondition(seatCondition);
                                    String price = eleTr.select("td.hall-price > em.now").text();
                                    try {
                                        moiveSchedule.setPrice(Double.valueOf(price));
                                    } catch (Exception e) {
                                        System.out.println("票价转换异常");
                                    }
                                    String buyUrl = eleTr.select("td.hall-seat >a").attr("href");
                                    if (!StringUtil.isBlank(buyUrl)) {
                                        moiveSchedule.setBuyUrl(buyUrl);
                                    } else {
                                        moiveSchedule.setBuyUrl(eleTr.select("td.hall-seat").text());
                                    }
                                    System.out.println(moiveSchedule);
                                }
                            }
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
