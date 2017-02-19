package com.mdd.mt.crawler;

import com.mdd.mt.service.CinemaServiceImpl;
import com.mdd.mt.service.MovieCinemaServiceImpl;
import com.mdd.mt.service.MovieScheduleServiceImpl;
import com.mdd.mt.service.MovieServiceImpl;
import org.apache.commons.lang.StringUtils;
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
    public void crawler(String indexUrl) throws IOException {
        crawlerMovieUrl(indexUrl);
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

    public static void main(String args[]) throws IOException {
//        Connection connect = Jsoup.connect("http://www.meituan.com/dianying/zuixindianying?mtt=1.movie%2Fmoviedeal.0.0.izcfyvrl");
//        Map<String,String> datamMap = new HashMap<String,String>();
//        datamMap.put("Accept","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
//        datamMap.put("Accept-Encoding","1");
//        datamMap.put("Accept-Language","zh-CN,zh;q=0.8");
//        datamMap.put("Cache-Control","max-age=0");
//        datamMap.put("Connection","keep-alive");
//        datamMap.put("Host","maoyan.com");
//        datamMap.put("Referer","http://maoyan.com/films?showType=1&sortId=1");
//        datamMap.put("Upgrade-Insecure-Requests","1");
//        datamMap.put("User-Agent","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36");
//        connect.data(datamMap);
//        System.out.println(connect.get().body());

        MeiTuanCrawler meiTuanCrawler = new MeiTuanCrawler();
        meiTuanCrawler.crawlerMovieUrl("http://www.meituan.com/dianying/zuixindianying?mtt=1.movie%2Fmoviedeal.0.0.izcfyvrl");
//        #yui_3_16_0_1_1487494881611_512
    }
}
