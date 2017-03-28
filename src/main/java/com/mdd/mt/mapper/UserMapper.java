package com.mdd.mt.mapper;

import org.apache.ibatis.annotations.Param;

import com.mdd.mt.model.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);
    
    User selectByUserName(String userName);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User selectAdmin(@Param("userName")String userName,@Param("userPwd")String userPwd);
}