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
public class Test {

    @Autowired
    private UserService userService;

    @RequestMapping("toIndex")
    public String toIndex(){
        User user = new User();
        user.setUserName("xwl");
        user.setPassword("123");
        userService.saveUser(user);
        return "toIndex";
    }
}
