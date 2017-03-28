package com.mdd.mt.crawler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class MyJob {  
	
	@Autowired
	private JDCrawler jdCrawler;
	@Autowired
	private NewsCrawler newsCrawler;
	@Autowired
	private DiscountsCrawler discountsCrawler;
    
     @Scheduled(cron = "0 0 6 ? * *")
      public void movieInfoJob(){  
        System.out.println("电影爬虫开始");
        jdCrawler.crawler("http://movie.jd.com/m_channel");
        System.out.println("电影爬虫结束");
      } 
     
     @Scheduled(cron = "0 5 6 ? * *")
     public void newInfoJob(){  
    	 System.out.println("电影新闻爬虫开始");
         newsCrawler.crawler("http://news.mtime.com/");
         System.out.println("电影新闻爬虫结束");
     } 
     
     @Scheduled(cron = "0 5 6 ? * *")
     public void discountsInfoJob(){  
    	 System.out.println("优惠信息爬虫开始");
         discountsCrawler.crawler("http://www.quanmama.com/quan_maoyan");
         System.out.println("优惠信息爬虫结束");
     } 
     
} 