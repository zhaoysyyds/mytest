package com.javaee.domain;

import java.util.Date;

public class SystemInformation {
    private Integer id;

    private String message;

    private String date;
    private String title;

    @Override
    public String toString() {
        return "SystemInformation{" +
                "id=" + id +
                ", message='" + message + '\'' +
                ", date=" + date +
                ", title='" + title + '\'' +
                '}';
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
}