package com.wl.service;

import com.wl.model.PetOwner;

public interface IUserService {

	/**
	 * 检查登陆
	 * @param username
	 * @return
	 */
	public PetOwner loginCheck(PetOwner petOwner);
	/**
	 * 注册
	 * @param petOwner
	 * @return
	 */
	public boolean registerCheck(PetOwner petOwner); 
	/**
	 * 加载用户信息
	 * @param id
	 * @return
	 */
	public PetOwner loadUserInfo(int id);
	/**
	 * 更新用户信息
	 * @param petOwner
	 */
	public void updateInfo(PetOwner petOwner);
}
