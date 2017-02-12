package com.mdd.mt.model;

import java.util.Date;

/**
 * Created by Administrator on 2017/1/1.
 * 电影与电影院中间表
 */
public class MovieCinema {
    private int id;
    private int movieId;
    private int cinemaId;
    private Date createTime;

    @Override
    public String toString() {
        return "MovieCinema{" +
                "id=" + id +
                ", movieId=" + movieId +
                ", cinemaId=" + cinemaId +
                ", createTime=" + createTime +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public int getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(int cinemaId) {
        this.cinemaId = cinemaId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
