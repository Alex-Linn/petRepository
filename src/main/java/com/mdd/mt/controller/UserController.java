package com.mdd.mt.controller;

import com.mdd.mt.model.User;
import com.mdd.mt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2016/12/15.
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

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
}
