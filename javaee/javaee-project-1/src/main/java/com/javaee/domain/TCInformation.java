package com.javaee.domain;

public class TCInformation extends ClassInformation{

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private String name;
    private int now;

    @Override
    public String toString() {
        return "TCInformation{" +
                "name='" + name + '\'' +
                ", now=" + now +
                '}';
    }

    public int getNow() {
        return now;
    }

    public void setNow(int now) {
        this.now = now;
    }
}
