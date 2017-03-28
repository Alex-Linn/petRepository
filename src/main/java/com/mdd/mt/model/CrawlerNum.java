package com.mdd.mt.model;

import java.util.Date;

public class CrawlerNum {
	private int num;
	private Date date;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "CrawlerNum [num=" + num + ", date=" + date + "]";
	}

}
