package com.mdd.mt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mdd.mt.mapper.CommentMapper;
import com.mdd.mt.mapper.DiscountsMapper;
import com.mdd.mt.model.Discounts;

@Component
public class DiscountsServiceImpl {

	@Autowired
	private DiscountsMapper discountsMapper;

	/**
	 * 根据优惠信息标题获取优惠信息
	 * 
	 * @param movieId
	 * @return
	 */
	public Discounts getDiscountByTitle(String title) {
		return discountsMapper.getDiscountByTitle(title);
	}

	/**
	 * 保存优惠信息
	 * 
	 * @param comment
	 */
	public void insertDiscount(Discounts discount) {
		if (discount != null) {
			discountsMapper.insert(discount);
		}
	}
	
	public int getDiscountCrawler(){
		return discountsMapper.getDiscountCrawler();
	}
}
