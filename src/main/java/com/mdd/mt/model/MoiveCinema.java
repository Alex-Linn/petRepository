package com.mdd.mt.model;

/**
 * Created by Administrator on 2017/1/1.
 * 电影与电影院中间表
 */
public class MoiveCinema {
    private int id;
    private int moiveId;
    private int cinemaId;

    @Override
    public String toString() {
        return "MoiveCinema{" +
                "id=" + id +
                ", moiveId=" + moiveId +
                ", cinemaId=" + cinemaId +
                '}';
    }

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
}
