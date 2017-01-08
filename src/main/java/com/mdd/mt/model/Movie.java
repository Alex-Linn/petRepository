package com.mdd.mt.model;

import java.util.Date;

public class Movie {
    private Integer id;

    private String movieName;

    private String movieEnglishName;

    private String director;

    private String performer;

    private String movieType;

    private String country;

    private String movieLanguage;

    private String movieTime;

    private String posterUrl;

    private String rescheduledTime;

    private Double score;

    private Integer isShow;

    private String movieDetailUrl;

    private Date createTime;

    private String moiveStory;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName == null ? null : movieName.trim();
    }

    public String getMovieEnglishName() {
        return movieEnglishName;
    }

    public void setMovieEnglishName(String movieEnglishName) {
        this.movieEnglishName = movieEnglishName == null ? null : movieEnglishName.trim();
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director == null ? null : director.trim();
    }

    public String getPerformer() {
        return performer;
    }

    public void setPerformer(String performer) {
        this.performer = performer == null ? null : performer.trim();
    }

    public String getMovieType() {
        return movieType;
    }

    public void setMovieType(String movieType) {
        this.movieType = movieType == null ? null : movieType.trim();
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country == null ? null : country.trim();
    }

    public String getMovieLanguage() {
        return movieLanguage;
    }

    public void setMovieLanguage(String movieLanguage) {
        this.movieLanguage = movieLanguage == null ? null : movieLanguage.trim();
    }

    public String getMovieTime() {
        return movieTime;
    }

    public void setMovieTime(String movieTime) {
        this.movieTime = movieTime == null ? null : movieTime.trim();
    }

    public String getPosterUrl() {
        return posterUrl;
    }

    public void setPosterUrl(String posterUrl) {
        this.posterUrl = posterUrl == null ? null : posterUrl.trim();
    }

    public String getRescheduledTime() {
        return rescheduledTime;
    }

    public void setRescheduledTime(String rescheduledTime) {
        this.rescheduledTime = rescheduledTime == null ? null : rescheduledTime.trim();
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    public String getMovieDetailUrl() {
        return movieDetailUrl;
    }

    public void setMovieDetailUrl(String movieDetailUrl) {
        this.movieDetailUrl = movieDetailUrl == null ? null : movieDetailUrl.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getMoiveStory() {
        return moiveStory;
    }

    public void setMoiveStory(String moiveStory) {
        this.moiveStory = moiveStory == null ? null : moiveStory.trim();
    }
}