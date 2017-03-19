package com.mdd.mt.model;

import java.util.Date;

public class Discounts {
	private Integer id;

	private String disTitle;

	private String disDateRange;

	private String disImg;

	private String disWebsit;

	private String disUrl;

	private Date createTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDisTitle() {
		return disTitle;
	}

	public void setDisTitle(String disTitle) {
		this.disTitle = disTitle == null ? null : disTitle.trim();
	}

	public String getDisDateRange() {
		return disDateRange;
	}

	public void setDisDateRange(String disDateRange) {
		this.disDateRange = disDateRange == null ? null : disDateRange.trim();
	}

	@Override
	public String toString() {
		return "Discounts [id=" + id + ", disTitle=" + disTitle + ", disDateRange=" + disDateRange + ", disImg="
				+ disImg + ", disWebsit=" + disWebsit + ", disUrl=" + disUrl + ", createTime=" + createTime + "]";
	}

	public String getDisImg() {
		return disImg;
	}

	public void setDisImg(String disImg) {
		this.disImg = disImg == null ? null : disImg.trim();
	}

	public String getDisWebsit() {
		return disWebsit;
	}

	public void setDisWebsit(String disWebsit) {
		this.disWebsit = disWebsit == null ? null : disWebsit.trim();
	}

	public String getDisUrl() {
		return disUrl;
	}

	public void setDisUrl(String disUrl) {
		this.disUrl = disUrl == null ? null : disUrl.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}