package com.mdd.mt.model;

import java.util.Date;

/**
 * Created by Administrator on 2016/12/19.
 * 电影场次
 */
public class MoiveSchedule {

    private int id;
    private int moiveId;
    private int cinemaId;
    private Date startTime;
    private String endTime;
    private String language;
    private String videoHall;
    private String seatCondition;
    private double price;
    private String buyUrl;//购票链接



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMoiveId() {
        return moiveId;
    }

    public void setMoiveId(int moiveId) {
        this.moiveId = moiveId;
    }

    public int getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(int cinemaId) {
        this.cinemaId = cinemaId;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getBuyUrl() {
        return buyUrl;
    }

    public void setBuyUrl(String buyUrl) {
        this.buyUrl = buyUrl;
    }

    @Override
    public String toString() {
        return "MoiveSchedule{" +
                "id=" + id +
                ", moiveId=" + moiveId +
                ", cinemaId=" + cinemaId +
                ", startTime=" + startTime +
                ", endTime='" + endTime + '\'' +
                ", language='" + language + '\'' +
                ", videoHall='" + videoHall + '\'' +
                ", seatCondition='" + seatCondition + '\'' +
                ", price=" + price +
                ", buyUrl='" + buyUrl + '\'' +
                '}';
    }
}
