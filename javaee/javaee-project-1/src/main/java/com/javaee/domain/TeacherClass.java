package com.javaee.domain;

public class TeacherClass{
    private Integer classid;
    private Integer teacherid;
    private Boolean pass;

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public Integer getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(Integer teacherid) {
        this.teacherid = teacherid;
    }

    public Boolean getPass() {
        return pass;
    }

    public void setPass(Boolean pass) {
        this.pass = pass;
    }

    @Override
    public String toString() {
        return "TeacherClass{" +
                "classid=" + classid +
                ", teacherid=" + teacherid +
                ", pass=" + pass +
                '}';
    }
}