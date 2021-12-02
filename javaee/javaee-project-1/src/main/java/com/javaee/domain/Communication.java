package com.javaee.domain;

import java.util.Date;

public class Communication {
    private Integer id;

    private Integer ciid;

    private Integer userid;

    private String message;

    private String date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCiid() {
        return ciid;
    }

    public void setCiid(Integer ciid) {
        this.ciid = ciid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message == null ? null : message.trim();
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Communication{" +
                "id=" + id +
                ", classid=" + ciid +
                ", userid=" + userid +
                ", message='" + message + '\'' +
                ", date=" + date +
                '}';
    }
}