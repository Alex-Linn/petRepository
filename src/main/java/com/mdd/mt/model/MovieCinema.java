package com.mdd.mt.model;

import java.util.Date;

public class MovieCinema {
    private Integer id;

    private Integer moiveId;

    private Integer cinemaId;

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