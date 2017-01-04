package com.mdd.mt.model;

public class Cinema {
    private Integer id;

    private String city;

    private String area;

    private String address;

    private String cinemaName;

    private String tel;

    private String mapInfo;

    private String detailScheduleUrl;

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
        this.city = city == null ? null : city.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getCinemaName() {
        return cinemaName;
    }

    public void setCinemaName(String cinemaName) {
        this.cinemaName = cinemaName == null ? null : cinemaName.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getMapInfo() {
        return mapInfo;
    }

    public void setMapInfo(String mapInfo) {
        this.mapInfo = mapInfo == null ? null : mapInfo.trim();
    }

    public String getDetailScheduleUrl() {
        return detailScheduleUrl;
    }

    public void setDetailScheduleUrl(String detailScheduleUrl) {
        this.detailScheduleUrl = detailScheduleUrl == null ? null : detailScheduleUrl.trim();
    }
}