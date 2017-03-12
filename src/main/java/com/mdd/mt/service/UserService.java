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

    /**
     * 注册
     * @param user
     * @return
     */
    public boolean reqister(User user){
        if(user!=null){
        	User dbuser = userMapper.selectByUserName(user.getUserName());
        	if(dbuser!=null){
        		return false;
        	}
        }
        userMapper.insert(user);
        return true;
    }

    /**
     * 登入
     * @param user
     * @return
     */
	public User login(User user) {
		if(user!=null){
        	User dbuser = userMapper.selectByUserName(user.getUserName());
        	if(dbuser!=null&&dbuser.getUserPwd().equals(user.getUserPwd())){
        		return dbuser;
        	}
        }
		return null;
	}

}
