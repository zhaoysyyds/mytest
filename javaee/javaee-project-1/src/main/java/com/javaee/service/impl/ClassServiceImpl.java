package com.javaee.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javaee.dao.ClassDao;
import com.javaee.domain.Class;
import com.javaee.domain.ClassAName;
import com.javaee.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value="ClassService")
public class ClassServiceImpl implements ClassService {
    @Autowired
    private ClassDao classDao;
    @Override
    public PageInfo getClasses(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<ClassAName> list=classDao.selectClasses();
        PageInfo<ClassAName> res=new PageInfo<>(list);
        return res;
    }

    @Override
    public int passClasses(Integer id) {
        return classDao.pass(id);
    }

    @Override
    public int getClassid(Integer hmasterid) {
        return classDao.getclassid(hmasterid);
    }

    @Override
    public int addclass(int hmasterid, String classname) {
        return classDao.addclass(hmasterid,classname);
    }

    @Override
    public Class getaclass(int teacherid) {
        return classDao.getaclass(teacherid);
    }

    @Override
    public List<Class> getallclass() {
        return classDao.getallclass();
    }

    @Override
    public int check(String classname) {
        return classDao.check(classname);
    }

    @Override
    public List<String> get_nc_name(int nativeid) {
        return classDao.get_nc_name(nativeid);
    }

    @Override
    public List<String> get_0nc_name(int nativeid) {
        return classDao.get_0nc_name(nativeid);
    }
}
