package com.mdd.mt.crawler;

import com.mdd.mt.model.Movie;
import com.mdd.mt.service.CinemaServiceImpl;
import com.mdd.mt.service.MovieCinemaServiceImpl;
import com.mdd.mt.service.MovieScheduleServiceImpl;
import com.mdd.mt.service.MovieServiceImpl;
import com.mdd.mt.utils.CommonUtils;
import org.apache.commons.lang.StringUtils;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/2/19.
 * 猫眼电影爬虫
 * 入口 http://maoyan.com/films?showType=1&sortId=1
 */
public class MeiTuanCrawler {

    @Autowired
    private MovieServiceImpl movieService;

    @Autowired
    private CinemaServiceImpl cinemaService;

    @Autowired
    private MovieCinemaServiceImpl movieCinemaService;

    @Autowired
    private MovieScheduleServiceImpl movieScheduleService;

    /**
     * 爬去猫眼热门电影的信息
     *
     * @param indexUrl
     */
    public void crawler(String indexUrl) throws IOException, InterruptedException {
//        System.out.println(Jsoup.connect("http://www.meituan.com/dianying/1170255?mtt=1.movie%2Fmovies.0.0.ize1ubtc").get().body());
        List<String> movieDetailUrlList = crawlerMovieUrl(indexUrl);
        //电影详细页面url  http://www.meituan.com/dianying/1170255?mtt=1.movie%2Fmovies.0.0.ize1ubtc
        for (String movieUrlId : movieDetailUrlList) {
            String detailUrl = "http://sz.meituan.com"+ movieUrlId + "?mtt=1.movie%2Fmoviedeal.0.0.izm9yktr";
            System.out.println(detailUrl);
            Connection connect = Jsoup.connect(detailUrl).timeout(60*1000);
            Element body = connect.get().body();

            if(body != null) {
                Movie movie = new Movie();
                String divContainer = body.select("#bd > div.movie-container.J-movie-container").html();
                System.out.println(divContainer);
                String movieName = Jsoup.parse(divContainer).
                        select("div.movie-container__body > div.movie-info.movie-info--rich.cf > div.movie-info__name > h2").text();
                    //电影名称
                    movie.setMovieName(movieName);
                    System.out.println(movieName);
             
                    //使用正则解析
                    String regex = "<dt>\\s*首映\\s*</dt>\\s*<dd>\\s*(.*)\\s*</dd>\\s*.*" +
                            "<dt>\\s*类型\\s*</dt>\\s*<dd>\\s*(.*)\\s*</dd>\\s*.*" +
                            "<dt>\\s*版本\\s*</dt>\\s*<dd>\\s*(.*)\\s*</dd>\\s*.*" +
                            "<dt>\\s*地区\\s*</dt>\\s*<dd>\\s*(.*)\\s*</dd>\\s*.*" +
                            "<dt>\\s*时长\\s*</dt>\\s*<dd>\\s*(.*)\\s*</dd>\\s*.*" +
                            "<dt>\\s*导演\\s*</dt>\\s*<dd>\\s*(.*)\\s*</dd>\\s*.*" +
                            "<dt>\\s*主演\\s*</dt>\\s*<dd>\\s*(.*)\\s*</dd>\\s*";
                    List<String> strings = CommonUtils.multipMatch(divContainer, regex);
                    System.out.println(strings);
            }
        }


    }

    /**
     * 爬取所有热门电影的详细电影url
     *
     * @param indexUrl
     * @return
     */
    public List<String> crawlerMovieUrl(String indexUrl) throws IOException {
        List<String> movieUrlList = new ArrayList<String>();
        Document indexDocument = Jsoup.connect(indexUrl).get();
        Elements moviesDiv = indexDocument.select("#content > div").get(0).select("div.movie-cell");
        if (moviesDiv != null) {
            for (Element divElement : moviesDiv) {
                String text = divElement.select("div.movie-cell__detail > a").text();
                if (StringUtils.isNotBlank(text) && text.contains("购")) {
                    String movieUrl = divElement.select("div > a").attr("href");
                    movieUrlList.add(movieUrl);
                    System.out.println(movieUrl);
                }
            }
        }
        System.out.println(movieUrlList.size());
        return movieUrlList;
    }

    public static void main(String args[]) throws IOException, InterruptedException {
//        Connection connect = Jsoup.connect("http://sz.meituan.com/dianying/246065?mtt=1.movie%2Fmoviedeal.0.0.izm9yktr");
//        Map<String,String> datamMap = new HashMap<String,String>();
//        datamMap.put("Accept","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
//        datamMap.put("Accept-Encoding","gzip, deflate, sdch");
//        datamMap.put("Accept-Language","zh-CN,zh;q=0.8");

//        datamMap.put("Connection","keep-alive");
//        datamMap.put("Cookie","rvct=99; ci=30; mtcdn=K; PHPSESSID=3opjs5j3l7i8jianequkbufup5; Hm_lvt_f66b37722f586a240d4621318a5a6ebe=1487488598,1487494746,1487861480,1488089316; Hm_lpvt_f66b37722f586a240d4621318a5a6ebe=1488089318; abt=1488089479.0%7CADE; _lxsdk_s=bbdafdd3b6f64c3652fdbeedf38c%7C%7C0; __mta=150264329.1488089322972.1488089322972.1488089322972.1; __utma=211559370.1972303904.1488089318.1488089318.1488089318.1; __utmb=211559370.5.9.1488089686938; __utmc=211559370; __utmz=211559370.1488089318.1.1.utmcsr=baidu|utmccn=baidu|utmcmd=organic|utmcct=zt_search; uuid=f640f109313b5305fb79.1488089479.0.0.0; oc=yLiNXTUdA9Og-sbdqox2MbgZQ0J8rf_OENuZGUiiBuVB_LcQ8xA1Irme8_WK7Yy7DcJAD6FB2FpCn9A_e26p0LBuUsWmh_ekf8PYTpCXiOz3wLsNd9L7P8QhPaEsdwPP8Lra7ak2oZdzzNGILqcrqBigJz2qWV1RWPl_C2MxNGE");
//        datamMap.put("Host","sz.meituan.com");
//        datamMap.put("Upgrade-Insecure-Requests","1");
//        datamMap.put("User-Agent","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36");
//        connect.data(datamMap);
//        System.out.println(connect.get().body());

        MeiTuanCrawler meiTuanCrawler = new MeiTuanCrawler();
////        meiTuanCrawler.crawlerMovieUrl("http://www.meituan.com/dianying/zuixindianying?mtt=1.movie%2Fmoviedeal.0.0.izcfyvrl");
////        #yui_3_16_0_1_1487494881611_512
        meiTuanCrawler.crawler("http://www.meituan.com/dianying/zuixindianying?mtt=1.movie%2Fmoviedeal.0.0.izcfyvrl");
//        meiTuanCrawler.crawler();
    }
}
