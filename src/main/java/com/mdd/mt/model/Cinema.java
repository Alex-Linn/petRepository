package com.mdd.mt.model;

/**
 * Created by Administrator on 2016/12/19.
 * 影院实体类
 */
public class Cinema {
    private int id;
    private String city;//城市
    private String area;//区
    private String address;//地址
    private String cinemaName;//影院名字
    private String tel;//电话
    private String mapInfo;//地图信息
    private String detailScheduleUrl;//影院场次url

    @Override
    public String toString() {
        return "Cinema{" +
                "id=" + id +
                ", city='" + city + '\'' +
                ", area='" + area + '\'' +
                ", address='" + address + '\'' +
                ", cinemaName='" + cinemaName + '\'' +
                ", tel='" + tel + '\'' +
                ", mapInfo='" + mapInfo + '\'' +
                ", detailScheduleUrl='" + detailScheduleUrl + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public String getDetailScheduleUrl() {
        return detailScheduleUrl;
    }

    public void setDetailScheduleUrl(String detailScheduleUrl) {
        this.detailScheduleUrl = detailScheduleUrl;
    }
}
