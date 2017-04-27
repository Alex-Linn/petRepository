package com.wl.dao;

import com.wl.model.PetOwner;

public interface PetOwnerMapper {

	/**根据ID查找用户
	 * @param id
	 * 返回用户
	 * @return 
	 */
	PetOwner selectByPrimaryKey(Integer id);
	
	/**向数据库插入一条数据
	 * @param 用户
	 * 
	 */
	int insert(PetOwner petOwner);
	
	/**
	 * 
	 * @param username
	 * @return
	 */
	PetOwner selectByName(String username);
	/**
	 * 用户更新信息
	 * @param petOwner
	 * @return
	 */
	int updateByUser(PetOwner petOwner);
}
