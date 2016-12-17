package com.mdd.mt.model;

/**
 * Created by 许望禄 on 2016/12/17.
 */
public enum StateCode {

    OK(200,"成功"),
    REDIRRECT(302,"重定向"),
    URL_ERROR(404,"404错误"),
    SERVER_ERROR(500,"服务器出错");

    private int code;//状态码
    private String state;//状态

    StateCode(int code, String state) {
        this.code = code;
        this.state = state;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
