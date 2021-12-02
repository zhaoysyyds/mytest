package com.javaee.domain;

public class Class {
    private Integer id;

    @Override
    public String toString() {
        return "Class{" +
                "id=" + id +
                ", classname='" + classname + '\'' +
                ", hmasterid=" + hmasterid +
                ", pass=" + pass +
                '}';
    }

    private String classname;

    private Integer hmasterid;

    private Boolean pass;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname == null ? null : classname.trim();
    }

    public Integer getHmasterid() {
        return hmasterid;
    }

    public void setHmasterid(Integer hmasterid) {
        this.hmasterid = hmasterid;
    }

    public Boolean getPass() {
        return pass;
    }

    public void setPass(Boolean pass) {
        this.pass = pass;
    }
}