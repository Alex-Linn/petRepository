package com.mdd.mt.crawler;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.IOException;

/**
 * Created by Administrator on 2016/12/27.
 */
public class NuoMiCrawler {
    //热门 参数hot 城市代号 340深圳
    public void crawler(String indexUrl) throws IOException {
        Document indexDocument = Jsoup.connect(indexUrl).get();


    }
    public static void main(String[] args) throws IOException {
//        https://dianying.nuomi.com/movie/movielist?cityId=340
//        https://dianying.nuomi.com/movie/getmovielist?pagelets[]=pageletMovielist&reqID=0
//        &type=hot&cityId=340&pageNum=0&pageSize=10
//        &needMovieNews=false&isHomePage=false&needSliceAdSpace=false&t=1482849674638
//        步骤：1、先拿到所有的电影的id
//             2、通过id和城市名拼凑url ---->电影详细电影页
//             https://dianying.nuomi.com/movie/detail?cityId=340&movieId=9966 电影详细页
        System.out.println(Jsoup.connect("https://dianying.nuomi.com/movie/movielist?cityId=340").get());
    }
}
