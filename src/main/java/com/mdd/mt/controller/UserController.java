package com.mdd.mt.controller;

import com.mdd.mt.crawler.TaoPiaoPiaoCrawler;
import com.mdd.mt.model.User;
import com.mdd.mt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

/**
 * Created by Administrator on 2016/12/15.
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private TaoPiaoPiaoCrawler taoPiaoPiaoCrawler;

    @RequestMapping("/toIndex")
    public String toIndex(){
        System.out.println("hello");
        User user = new User();
        user.setUserName("xwl");
        user.setPassword("123");
        userService.saveUser(user);
        System.out.println(user);
        return "toIndex";
    }
    @RequestMapping("/toDemo")
    public String toDemo(){
        return "demo";
    }

    @RequestMapping("/taopiaopiao")
    public String taopiaopiao() throws IOException {
        taoPiaoPiaoCrawler.crawler("http://dianying.taobao.com/showList.htm?spm=a1z21.6646273.city.5.EAQ1oR&n_s=new&city=440300");
        return "demo";
    }


}
