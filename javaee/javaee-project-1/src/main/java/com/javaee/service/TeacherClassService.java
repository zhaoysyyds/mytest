package com.javaee.service;

import com.github.pagehelper.PageInfo;
import com.javaee.domain.ClassName;
import com.javaee.domain.TCName;
import com.javaee.domain.TeacherClass;

import java.util.List;

public interface TeacherClassService {
    List<ClassName> getteacherclass(int teacherid);
    PageInfo gettcname(int classid, int pageNum, int pageSize);

    int passTeacher(int classid,int teacherid);
    int add_teacher_class(int classid,int teacherid);
    List<String> getjoin0class(int teacherid);
    int check(int teacherid,int classid);
    int passhmaster(int classid,int hmasterid);
}
