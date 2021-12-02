package com.javaee.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javaee.dao.NativeClassDao;
import com.javaee.domain.ClassName;
import com.javaee.domain.NativeClass;
import com.javaee.service.NativeClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value="NativeClassService")
public class NativeClassServiceImpl implements NativeClassService {
    @Autowired
    private NativeClassDao dao;

    @Override
    public PageInfo getnative(int pageNum, int pageSize, int classid) {
        PageHelper.startPage(pageNum,pageSize);
        List<NativeClass> list= dao.getnative(classid);
        PageInfo<NativeClass> res=new PageInfo<>(list);
        return res;
    }

    @Override
    public int passNative(int classid, int nativeid) {
        return dao.passnative(classid,nativeid);
    }

    @Override
    public int add(NativeClass a) {
        return dao.add(a);
    }

    @Override
    public int check(NativeClass a) {
        return dao.check(a);
    }

    @Override
    public List<ClassName> getnativeclass(int nativeid) {
        return dao.getnativeclass(nativeid);
    }
}
