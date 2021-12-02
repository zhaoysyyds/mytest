package com.javaee.domain;

public class ClassName{
    private String className;
    private Integer classId;

    @Override
    public String toString() {
        return "ClassName{" +
                "className='" + className + '\'' +
                ", classId=" + classId +
                '}';
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }
}
