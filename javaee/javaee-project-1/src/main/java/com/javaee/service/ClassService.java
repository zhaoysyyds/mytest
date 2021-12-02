package com.javaee.service;

import com.github.pagehelper.PageInfo;
import com.javaee.domain.Class;
import com.javaee.domain.ClassAName;

import java.util.List;

public interface ClassService {

    PageInfo getClasses(int pageNum, int pageSize);
    int passClasses(Integer id);
    int getClassid(Integer hmasterid);
    int addclass(int hmasterid,String classname);
    Class getaclass(int teacherid);
    List<Class> getallclass();
    int check(String classname);
    List<String> get_nc_name(int nativeid);
    List<String> get_0nc_name(int nativeid);
}
