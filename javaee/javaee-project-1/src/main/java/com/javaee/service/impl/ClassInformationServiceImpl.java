package com.javaee.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javaee.dao.ClassInformationDao;
import com.javaee.domain.ClassInformation;
import com.javaee.domain.TCInformation;
import com.javaee.service.ClassInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value="ClassInformationService")
public class ClassInformationServiceImpl implements ClassInformationService {
    @Autowired
    private ClassInformationDao dao;

    @Override
    public PageInfo getClassInformation(int pageNum, int pageSize,int classid) {
        PageHelper.startPage(pageNum,pageSize);
        List<TCInformation> list=dao.selectclassinformations(classid);
        for(int i=0;i<list.size();i++)list.get(i).setNow(i);
        PageInfo<TCInformation> res=new PageInfo<>(list);
        return res;
    }

    @Override
    public int deleteci(int id) {
        return dao.delete_byciid(id);
    }

    @Override
    public PageInfo mutiply(TCInformation condition,int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<TCInformation> list=dao.mutiply(condition);
        for(int i=0;i<list.size();i++)list.get(i).setNow(i);
        PageInfo<TCInformation> res=new PageInfo<>(list);
        return res;
    }

    @Override
    public int add(ClassInformation temp) {
        return dao.add(temp);
    }
}
