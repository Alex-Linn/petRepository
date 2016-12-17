package com.mdd.mt.crawler;

import com.mdd.mt.model.StateCode;
import org.apache.commons.codec.binary.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jsoup.Jsoup;
import org.jsoup.helper.StringUtil;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Html;
import us.codecraft.webmagic.selector.Selectable;

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
            if(!StringUtil.isBlank(html)){
                Elements divElements = Jsoup.parse(html).select("div");
                for (Element divElement : divElements) {
                    String  movieUrl = divElement.select("a.movie-card-buy").attr("href");
                    //电影详细页面
                    page.addTargetRequest(movieUrl);
                }
            }else{
                //电影名
                String title = indexHtml.getDocument().select("body > div.detail-wrap.J_detailWrap > div.detail-cont > div > h3").text();
                if(!StringUtil.isBlank(title)){
                    //解析电影详细信息hu

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
