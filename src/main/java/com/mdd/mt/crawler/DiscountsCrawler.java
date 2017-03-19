package com.mdd.mt.crawler;

import java.io.IOException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;

import com.mdd.mt.model.Discounts;
import com.mdd.mt.service.DiscountsServiceImpl;

/**
 * 电影优惠信息抓取
 * 
 * @author Administrator
 *
 */
public class DiscountsCrawler {
	public static final String INDEX_URL = "http://www.quanmama.com/quan_maoyan";

	private static Log log = LogFactory.getLog(DiscountsCrawler.class);

	@Autowired
	private DiscountsServiceImpl discountsServiceImpl;

	/**
	 * 抓取优惠信息
	 * 
	 * @param indexUrl
	 */
	public void crawler(String indexUrl) {
		try {
			Element ulElement = Jsoup.connect(indexUrl).get().body().select("ul").get(0);
			if (ulElement != null) {
				Elements liElments = ulElement.select("li");
				for (Element ele : liElments) {
					Discounts discount = analyzeDiscount(ele);
					Discounts dbDiscount = discountsServiceImpl.getDiscountByTitle(discount.getDisTitle());
					if (dbDiscount == null) {
						discountsServiceImpl.insertDiscount(dbDiscount);
					}
					System.out.println(discount);
				}
			}
		} catch (IOException e) {
			log.error("优惠信息爬取失败");
		}
	}

	private Discounts analyzeDiscount(Element ele) {
		if (ele != null) {
			Discounts discounts = new Discounts();
			Element a = ele.select("div > div > a").get(0);
			//标题
			String disTitle = ele.select("div > div > a > img").attr("alt");
			discounts.setDisTitle(disTitle);
			//图片
			String disImg = ele.select("div > div > a > img").attr("src");
			discounts.setDisImg(disImg);
			//链接
			String disUrl = a.attr("href");
			discounts.setDisUrl(disUrl);
			//平台
			String disWebSite = ele.select("div > a ").text();
			discounts.setDisWebsit(disWebSite);
			return discounts;
		}
		return null;
	}

	public static void main(String[] args) throws IOException {
		new DiscountsCrawler().crawler(INDEX_URL);
//		 System.out.println(Jsoup.connect(INDEX_URL).get().body());
	}
}
