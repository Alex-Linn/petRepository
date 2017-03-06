package com.mdd.mt.model;

import java.util.Date;

public class MovieSchedule {
	private Integer id;

	private Integer movieId;

	private Integer cinemaId;

	private String startTime;

	private String endTime;

	private String movieLanguage;

	private String videoHall;

	private String seatCondition;

	private Double price;

	private String buyUrl;

	private String websiteType;// 供应商

	private Date createTime;

	@Override
	public String toString() {
		return "MovieSchedule [id=" + id + ", movieId=" + movieId + ", cinemaId=" + cinemaId + ", startTime="
				+ startTime + ", endTime=" + endTime + ", movieLanguage=" + movieLanguage + ", videoHall=" + videoHall
				+ ", seatCondition=" + seatCondition + ", price=" + price + ", buyUrl=" + buyUrl + ", websiteType="
				+ websiteType + ", createTime=" + createTime + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMovieId() {
		return movieId;
	}

	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}

	public Integer getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(Integer cinemaId) {
		this.cinemaId = cinemaId;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getMovieLanguage() {
		return movieLanguage;
	}

	public void setMovieLanguage(String movieLanguage) {
		this.movieLanguage = movieLanguage;
	}

	public String getVideoHall() {
		return videoHall;
	}

	public void setVideoHall(String videoHall) {
		this.videoHall = videoHall;
	}

	public String getSeatCondition() {
		return seatCondition;
	}

	public void setSeatCondition(String seatCondition) {
		this.seatCondition = seatCondition;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getBuyUrl() {
		return buyUrl;
	}

	public void setBuyUrl(String buyUrl) {
		this.buyUrl = buyUrl;
	}

	public String getWebsiteType() {
		return websiteType;
	}

	public void setWebsiteType(String websiteType) {
		this.websiteType = websiteType;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}