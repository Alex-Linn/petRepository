package com.mdd.mt.crawler;

import com.mdd.mt.model.Cinema;
import com.mdd.mt.model.Movie;
import com.mdd.mt.model.StateCode;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jsoup.Jsoup;
import org.jsoup.helper.StringUtil;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Html;

import java.io.IOException;

/**
 * Created by Administrator on 2016/12/17.
 */
public class TaoBaoCrawler implements PageProcessor {

    private static Log log = LogFactory.getLog(TaoBaoCrawler.class);

    //设置抓取网站的相关配置，包括编码、抓取间隔、重试次数等
    private Site site = Site.me().setRetryTimes(3).setSleepTime(100);

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
                    moive.setLanguage(language);
                    //时长
                    String movieTime = document.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li:nth-child(7)").text();
                    moive.setMovieTime(movieTime);
                    //影片简介
                    String moiveStory = document.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > ul > li.J_shrink.shrink").text();
                    moive.setMoiveStory(moiveStory);
                    //影片海报url
                    String posterUrl = document.select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > div.cont-pic > img").attr("href");
                    moive.setPosterUrl(posterUrl);
                    //已经上映
                    System.out.println(indexHtml.getDocument().body());
                    moive.setIsShow(1);
                    //获取编号为163027城市的全部区域区域的影院信息
//                    body > div.schedule-wrap.J_scheduleWrap.schedule-loaded > div.filter-wrap > div > ul > li:nth-child(1) > div > a:nth-child(1)
//                    http://dianying.taobao.com/showDetailSchedule.htm?showId=154578&n_s=new
//                    http://dianying.taobao.com/showDetailSchedule.htm?showId=154578&ts=1482490573898&n_s=new
//                    System.out.println(indexHtml.getDocument().body());
                    Elements moivesUrl = Jsoup.parse(indexHtml.get()).select("body > div.schedule-wrap.J_scheduleWrap.schedule-loaded > div.filter-wrap > div > ul > li:nth-child(2) > div");
                    for (Element ele :moivesUrl){
                        Cinema Cinema = new Cinema();
                        //获取请求获取每个影院的场次的url参数
                        String dataParam = ele.attr("data-param");
                        page.addTargetRequest("http://dianying.taobao.com/showDetailSchedule.htm?"+dataParam);
                    }
                }else{
                     String cinemaName = indexHtml.getDocument().select("div.center-wrap.cinemabar-wrap > h4").text();
                    System.out.println(cinemaName);
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

//        Spider.create(new TaoBaoCrawler())
//                //从深圳开始抓
//                .addUrl("http://dianying.taobao.com/showList.htm?spm=a1z21.6646273.city.5.EAQ1oR&n_s=new&city=440300")
//                //开启5个线程抓取
//                .thread(2)
//                //启动爬虫
//                .run();
        Element body = Jsoup.connect("http://dianying.taobao.com/showDetailSchedule.htm?showId=154578&n_s=new").get().body();
        System.out.println(body);
    }
}
