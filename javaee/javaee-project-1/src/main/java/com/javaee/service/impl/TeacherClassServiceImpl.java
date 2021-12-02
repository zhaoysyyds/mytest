package com.javaee.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javaee.dao.TeacherClassDao;
import com.javaee.domain.ClassName;
import com.javaee.domain.TCName;
import com.javaee.domain.TeacherClass;
import com.javaee.service.TeacherClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("teacherclassService")
public class TeacherClassServiceImpl implements TeacherClassService {
    @Autowired
    private TeacherClassDao dao;

    @Override
    public List<ClassName> getteacherclass(int teacherid) {
        return dao.selectclass_id_name(teacherid);
    }

    @Override
    public PageInfo gettcname(int classid, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<TCName> list=dao.selecttcname(classid);
        PageInfo<TCName> res=new PageInfo<>(list);
        return res;
    }

    @Override
    public int passTeacher(int classid, int teacherid) {
        return dao.passteacher(classid,teacherid);

    }

    @Override
    public int add_teacher_class(int classid, int teacherid) {
        return dao.add_teacher_class(classid,teacherid);
    }

    @Override
    public List<String> getjoin0class(int teacherid) {
        return dao.getjoin0class(teacherid);
    }

    @Override
    public int check(int teacherid, int classid) {
        return dao.check(teacherid,classid);
    }

    @Override
    public int passhmaster(int classid, int hmasterid) {
        return dao.passhmaster(classid,hmasterid);
    }

}
