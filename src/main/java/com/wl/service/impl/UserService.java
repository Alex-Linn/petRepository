package com.wl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wl.dao.PetOwnerMapper;
import com.wl.model.PetOwner;
import com.wl.service.IUserService;

@Service
public class UserService implements IUserService{

	
	@Resource
	private PetOwnerMapper petOwnerMapper;
	

	/**
	 * 注册
	 */
	@Override
	public boolean registerCheck(PetOwner petOwner) {
		if(null != petOwner){
			PetOwner owner = petOwnerMapper
					.selectByName(petOwner.getOwnerUsername());
			if(null != owner){
				return false;
			}
		}
		petOwnerMapper.insert(petOwner);
		return true;
	}

	/**
	 * 登陆
	 */
	@Override
	public PetOwner loginCheck(PetOwner petOwner) {
		PetOwner powner = petOwnerMapper
				.selectByName(petOwner.getOwnerUsername());
		System.out.println(powner);
		if(null != powner &&
				powner.getOwnerPassword().equals(petOwner.getOwnerPassword())){
			return powner;
		}
		return null;
	}

	/**
	 * 加载用户信息
	 */
	@Override
	public PetOwner loadUserInfo(int id) {
		return petOwnerMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateInfo(PetOwner petOwner) {
		 petOwnerMapper.updateByUser(petOwner);
	}

}
