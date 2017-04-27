package com.wl.model;

import java.io.Serializable;
import java.util.Date;

public class News implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8601777922687465819L;

	private Integer id;
	private String newsTitle;
	private String newsContent;
	private String newsEmail;
	private String newsTel;
	private String newsPublisher;
	private Date createTime;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	public String getNewsEmail() {
		return newsEmail;
	}
	public void setNewsEmail(String newsEmail) {
		this.newsEmail = newsEmail;
	}
	public String getNewsTel() {
		return newsTel;
	}
	public void setNewsTel(String newsTel) {
		this.newsTel = newsTel;
	}
	public String getNewsPublisher() {
		return newsPublisher;
	}
	public void setNewsPublisher(String newsPublisher) {
		this.newsPublisher = newsPublisher;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "News [id=" + id + ", newsTitle=" + newsTitle + ", newsContent=" + newsContent + ", newsEmail="
				+ newsEmail + ", newsTel=" + newsTel + ", newsPublisher=" + newsPublisher + ", createTime=" + createTime
				+ "]";
	}
	
	
}
