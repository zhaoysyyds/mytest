package com.javaee.domain;

public class NativeClass{
    private Integer classid;
    private Boolean pass;
    private Integer nativeid;
    private String kidname;
    private String name;
    private String telephone;
    private String email;
    private boolean sex;

    @Override
    public String toString() {
        return "NativeClass{" +
                "classid=" + classid +
                ", pass=" + pass +
                ", nativeid=" + nativeid +
                ", kidname='" + kidname + '\'' +
                ", name='" + name + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", sex=" + sex +
                '}';
    }

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public Boolean getPass() {
        return pass;
    }

    public void setPass(Boolean pass) {
        this.pass = pass;
    }

    public Integer getNativeid() {
        return nativeid;
    }

    public void setNativeid(Integer nativeid) {
        this.nativeid = nativeid;
    }

    public String getKidname() {
        return kidname;
    }

    public void setKidname(String kidname) {
        this.kidname = kidname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }
}