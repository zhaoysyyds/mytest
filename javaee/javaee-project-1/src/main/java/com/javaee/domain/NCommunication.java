package com.javaee.domain;

public class NCommunication extends Communication{
    private String name;
    private int type;
    private String kidname;

    @Override
    public String toString() {
        return "NCommunication{" +
                "name='" + name + '\'' +
                ", type=" + type +
                ", kidname='" + kidname + '\'' +
                '}';
    }

    public String getKidname() {
        return kidname;
    }

    public void setKidname(String kidname) {
        this.kidname = kidname;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
