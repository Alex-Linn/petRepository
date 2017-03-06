package com.mdd.mt.model;

import java.util.Date;

public class Cinema {
	private Integer id;

	private String city;

	private String area;

	private String address;

	private String cinemaName;

	private String tel;

	private String mapInfo;

	private String introduction;

	private Date createTime;

	private String cinemaDesc;

	@Override
	public String toString() {
		return "Cinema [id=" + id + ", city=" + city + ", area=" + area + ", address=" + address + ", cinemaName="
				+ cinemaName + ", tel=" + tel + ", mapInfo=" + mapInfo + ", introduction=" + introduction
				+ ", createTime=" + createTime + ", cinemaDesc=" + cinemaDesc + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCinemaName() {
		return cinemaName;
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMapInfo() {
		return mapInfo;
	}

	public void setMapInfo(String mapInfo) {
		this.mapInfo = mapInfo;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCinemaDesc() {
		return cinemaDesc;
	}

	public void setCinemaDesc(String cinemaDesc) {
		this.cinemaDesc = cinemaDesc;
	}

	

}