package com.mdd.mt.model;

import java.util.Date;

/**
 * Created by Administrator on 2017/1/1.
 * 电影与电影院中间表
 */
public class MovieCinema {
    private int id;
    private int moiveId;
    private int cinemaId;
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMoiveId() {
        return moiveId;
    }

    public void setMoiveId(Integer moiveId) {
        this.moiveId = moiveId;
    }

    public Integer getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(Integer cinemaId) {
        this.cinemaId = cinemaId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}