package com.mdd.mt.model;

/**
 * Created by Administrator on 2016/12/17.
 */
public class Movie {
    private int id;
    private String movieName;//影片名
    private String movieEnglishName;
    private String director;//导演
    private String performer;//演员
    private String movieType;//影片类型
    private String country;//国家
    private String language;//语言
    private String movieTime;//时长
    private String moiveStory;//剧情
    private String posterUrl;//海报url
    private String rescheduledTime;//上映时间
    private double score;//评分
    private int isShow;//是否上映，1上映 0即将上映

    public String getPosterUrl() {
        return posterUrl;
    }

    public void setPosterUrl(String posterUrl) {
        this.posterUrl = posterUrl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getMovieEnglishName() {
        return movieEnglishName;
    }

    public void setMovieEnglishName(String movieEnglishName) {
        this.movieEnglishName = movieEnglishName;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getPerformer() {
        return performer;
    }

    public void setPerformer(String performer) {
        this.performer = performer;
    }

    public String getMovieType() {
        return movieType;
    }

    public void setMovieType(String movieType) {
        this.movieType = movieType;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getMovieTime() {
        return movieTime;
    }

    public void setMovieTime(String movieTime) {
        this.movieTime = movieTime;
    }

    public String getMoiveStory() {
        return moiveStory;
    }

    public void setMoiveStory(String moiveStory) {
        this.moiveStory = moiveStory;
    }

    public String getRescheduledTime() {
        return rescheduledTime;
    }

    public void setRescheduledTime(String rescheduledTime) {
        this.rescheduledTime = rescheduledTime;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public int getIsShow() {
        return isShow;
    }

    public void setIsShow(int isShow) {
        this.isShow = isShow;
    }

    @Override
    public String toString() {
        return "Movie{" +
                "id=" + id +
                ", movieName='" + movieName + '\'' +
                ", movieEnglishName='" + movieEnglishName + '\'' +
                ", director='" + director + '\'' +
                ", performer='" + performer + '\'' +
                ", movieType='" + movieType + '\'' +
                ", country='" + country + '\'' +
                ", language='" + language + '\'' +
                ", movieTime='" + movieTime + '\'' +
                ", moiveStory='" + moiveStory + '\'' +
                ", posterUrl='" + posterUrl + '\'' +
                ", rescheduledTime='" + rescheduledTime + '\'' +
                ", score=" + score +
                ", isShow=" + isShow +
                '}';
    }
}
