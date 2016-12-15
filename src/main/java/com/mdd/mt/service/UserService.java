package com.mdd.mt.service;

import com.mdd.mt.mapper.UserMapper;
import com.mdd.mt.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2016/12/15.
 */
@Service
public class UserService {

    @Autowired
    private  UserMapper userMapper;

    public void saveUser(User user){
        userMapper.save(user);
    }

}
