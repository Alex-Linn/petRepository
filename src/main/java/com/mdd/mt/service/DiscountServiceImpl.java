package com.mdd.mt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mdd.mt.mapper.DiscountsMapper;
import com.mdd.mt.model.Discounts;

@Service
public class DiscountServiceImpl {
	@Autowired
	private DiscountsMapper mapper;
	
	public List<Discounts>loadLastWeekDisCount(){
		return mapper.loadLastWeekDisCount();
	}
}
