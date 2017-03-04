package com.mdd.mt.crawler;

import com.mdd.mt.model.Cinema;
import com.mdd.mt.model.Movie;
import com.mdd.mt.model.MovieSchedule;
import com.mdd.mt.model.StateCode;
import com.mdd.mt.utils.CommonUtils;
import org.apache.commons.codec.binary.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jsoup.Jsoup;
import org.jsoup.helper.StringUtil;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Html;

import java.io.IOException;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2016/12/17.
 */
public class TaoBaoCrawler implements PageProcessor {

    private static Log log = LogFactory.getLog(TaoBaoCrawler.class);

    //设置抓取网站的相关配置，包括编码、抓取间隔、重试次数等
    private Site site = Site.me().setRetryTimes(3).setSleepTime(100);
    //为了控制拿每个影院场次链接时不让再次拿
    boolean flag = true;

    //页面抽取逻辑
    public void process(Page page) {

        //访问成功
        if (page != null && page.getStatusCode() == StateCode.OK.getCode()) {
            Html indexHtml = page.getHtml();
            //正在热映电影
            String html = indexHtml.xpath("/html/body/div[4]/div[1]/div[2]/div[1]").get();
            if (!StringUtil.isBlank(html)) {
                Elements divElements = Jsoup.parse(html).select("div");
                for (Element divElement : divElements) {
                    String movieUrl = divElement.select("a.movie-card-buy").attr("href");
                    //电影详细页面
                    page.addTargetRequest(movieUrl);
                }
            } else {
                //电影名
                String movieName = indexHtml.getDocument().select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > h3").text();
                if (!StringUtil.isBlank(movieName)) {
                    Document document = indexHtml.getDocument();
                    Movie moive = new Movie();
                    moive.setMovieName(movieName);
                    //解析电影详细信息
                    //英文名
                    String movieEnglishName = document.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > h3 > i").text();
                    moive.setMovieEnglishName(movieEnglishName);
                    //评分
                    String score = document.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > h3 > em").text();
                    moive.setScore(Double.valueOf(score));
                    //上映时间
                    String rescheduledTime = document.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > div.cont-time").text();
                    moive.setRescheduledTime(rescheduledTime);
                    //导演
                    String director = document.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li:nth-child(2)").text();
                    moive.setDirector(director);
                    //演员
                    String performer = document.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li:nth-child(3)").text();
                    moive.setPerformer(performer);
                    //影片类型
                    String movieType = document.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li:nth-child(4)").text();
                    moive.setMovieType(movieType);
                    //国家
                    String country = document.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li:nth-child(5)").text();
                    moive.setCountry(country);
                    //语言
                    String language = document.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li:nth-child(6)").text();
                    moive.setMovieLanguage(language);
                    //时长
                    String movieTime = document.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li:nth-child(7)").text();
                    moive.setMovieTime(movieTime);
                    //影片简介
                    String moiveStory = document.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li.J_shrink.shrink").text();
                    moive.setMovieStory(moiveStory);
                    //影片海报url
                    String posterUrl = document.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > div.cont-pic > img").attr("href");
                    moive.setPosterUrl(posterUrl);
                    //已经上映
                    moive.setIsShow(1);
                    System.out.println(moive);
                    //添加所有
                    page.addTargetRequest("http://dianying.taobao.com/showDetailSchedule.htm?showId=154578&n_s=new");
                } else {

                    Elements cinemaDiv = indexHtml.getDocument().select("body > div.filter-wrap > div > ul > li:nth-child(2) > div");
                    if (cinemaDiv != null && flag == true) {
                        Elements cinemasUrl = cinemaDiv.get(0).select("a");
                        for (Element ele : cinemasUrl) {
                            String dataParam = ele.attr("data-param");
                            //每家电影每个时间段的电影场次
                            //今天的场次
                            String todayDate = CommonUtils.getDetailScheduleDate(0);
                            if (!StringUtil.isBlank(dataParam) && dataParam.contains("date")) {
                                dataParam.replaceAll("date=(.*)&regionName=", todayDate);
                            }
                            page.addTargetRequest("http://dianying.taobao.com/showDetailSchedule.htm?" + dataParam);
                            //明天的场次
                            String tomorrowDate = CommonUtils.getDetailScheduleDate(1);
                            if (!StringUtil.isBlank(dataParam) && dataParam.contains("date")) {
                                dataParam.replaceAll("date=(.*)&regionName=", tomorrowDate);
                            }
                            page.addTargetRequest("http://dianying.taobao.com/showDetailSchedule.htm?" + dataParam);
                        }
                        flag = false;
                    } else {
                        Cinema cinema = new Cinema();
                        //影院名称
                        Document cinemaDocument = indexHtml.getDocument();
                        String cinemaName = cinemaDocument.select("body > div.center-wrap.cinemabar-wrap > h4").text();
                        cinema.setCinemaName(cinemaName);
                        String text = cinemaDocument.select("body > div.center-wrap.cinemabar-wrap").text();
//                        纵横国际影城（石厦店） 地址：福田区石厦北二街89号石厦新港商城3楼318 [地图] 电话：0755-28181068 查看影院详情 >
                        String regx = "地址：(.*)\\[地图\\].*电话：(\\d+-\\d+)";
                        Pattern compile = Pattern.compile(regx);
                        Matcher matcher = compile.matcher(text);
                        while (matcher.find()) {
                            //地址
                            String address = matcher.group(1);
                            cinema.setAddress(address);
                            //区域
                            String area = address.substring(0, address.indexOf("区") + 1);
                            cinema.setArea(area);
                            //电话
                            String tel = matcher.group(2);
                            cinema.setTel(tel);
                            //地图位置URl
                            String mapUrl = cinemaDocument.select("body > div.center-wrap.cinemabar-wrap > a.more").attr("href");
                            cinema.setMapInfo(mapUrl);
                            System.out.println(cinema);
                        }
                        Elements scheduleTable = cinemaDocument.select("table");
                        //防止没有场次的页面
                        if (scheduleTable.size() != 0) {
                            Elements scheduleTr = scheduleTable.get(0).select("tr");
                            for (Element eleTr : scheduleTr) {
                                MovieSchedule moiveSchedule = new MovieSchedule();
                                //电影播放时间
                                String timeStr = eleTr.select("td.hall-time").text();
                                if (!StringUtil.isBlank(timeStr)) {
                                    String startHour = timeStr.substring(0, timeStr.indexOf("预计"));
                                    String endHour = timeStr.substring(timeStr.lastIndexOf("预计"));
                                    //结束时间
                                    moiveSchedule.setEndTime(endHour);
                                    //通过url参数拿到时间去拼凑数据库的时间 &date=2016-12-24&regionName=&ts=1482592840757&n_s=new
                                    String dateRegx = "date=(.*)&regionName";
                                    Pattern dateCompile = Pattern.compile(dateRegx);
                                    Matcher dateMatcher = dateCompile.matcher(page.getRequest().getUrl().toString());
                                    if (dateMatcher.find()) {
                                        String date = dateMatcher.group(1);
                                        date = date + ":" + startHour;
                                        Date startTime = CommonUtils.string4Date(date);
                                        //电影开始时间
                                        moiveSchedule.setStartTime(startTime);
                                    }
                                    //语言
                                    String language = eleTr.select("td.hall-type").text();
                                    moiveSchedule.setMovieLanguage(language);
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
            //即将上映电影
        } else {
            log.info("连接状态码" + page.getStatusCode() + "访问出错");
        }
    }

    public Site getSite() {
        return site;
    }


    public static void main(String[] args) throws IOException {

        Spider.create(new TaoBaoCrawler())
                //从深圳开始抓
                .addUrl("http://dianying.taobao.com/showList.htm?spm=a1z21.6646273.city.5.EAQ1oR&n_s=new&city=440300")
                //开启5个线程抓取
                .thread(2)
                //启动爬虫
                .run();
    }
}
