package com.javaee.domain;

import java.util.Date;

public class ClassInformation {
    private Integer id;

    private Integer classid;
    private String title;

    @Override
    public String toString() {
        return "ClassInformation{" +
                "id=" + id +
                ", classid=" + classid +
                ", title='" + title + '\'' +
                ", message='" + message + '\'' +
                ", teacherid=" + teacherid +
                ", date=" + date +
                '}';
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    private String message;

    private Integer teacherid;

    private String date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message == null ? null : message.trim();
    }

    public Integer getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(Integer teacherid) {
        this.teacherid = teacherid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

}