package com.mdd.mt.crawler;

import java.io.IOException;
import java.util.Date;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mdd.mt.model.News;
import com.mdd.mt.service.NewsServiceImpl;
import com.mdd.mt.utils.CommonUtils;

/**
 * 电影新闻爬虫
 * @author Administrator
 *
 */
@Service
public class NewsCrawler {
	@Autowired
	private NewsServiceImpl newsServiceImpl;
	
	public void crawler(String indexUrl){
		Element bodyEle = null;
		try {
			bodyEle = Jsoup.connect(indexUrl).get().body();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements liElements = bodyEle.select("#newslist > li");
		if(liElements==null||liElements.size()<0){
			return;
		}
		for(Element ele :liElements){
			News news = new News();
			//标题
			String newTitle = ele.select("div > h4 > a").text();
			news.setNewTitle(newTitle);
			News dbNew = newsServiceImpl.selectNews(newTitle);
			if(dbNew!=null){
				continue;
			}
			//图片
			String newPicture = ele.select("div > a > img").attr("src"); 
			news.setNewPicture(newPicture);
			//url
			String url = ele.select("div > h4 > a").attr("href");
			//详细内容
			Element detailEle = null;
			try {
				detailEle = Jsoup.connect(url).get().body();
			} catch (IOException e) {
				e.printStackTrace();
			}
			//发布时间
			String dateStr = detailEle.select("body > div.newshead > div > p").text();
			Date date = CommonUtils.string4Date2(dateStr);
			news.setCreateTime(date);
			//发布网站
			String newWebsite = detailEle.select("body > div.newshead > div > p > span.ml15 > a").text();
			news.setNewWebsite(newWebsite);
			//内容
			String newContext = detailEle.select("#newsContent").text();
			news.setNewContext(newContext);
			System.out.println(news);
			newsServiceImpl.saveNew(news);
		}
	}
	
	public static void main(String[] args) throws IOException {
		new NewsCrawler().crawler("http://news.mtime.com/");
	}
}
