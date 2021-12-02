package com.javaee.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javaee.dao.CommunicationDao;
import com.javaee.domain.Communication;
import com.javaee.domain.NCommunication;
import com.javaee.service.CommunicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("CommunicationService")
public class CommunicationServiceImpl implements CommunicationService {
    @Autowired
    private CommunicationDao dao;

    @Override
    public PageInfo getcomm(int ciid, int pagenum, int pagesize) {
        PageHelper.startPage(pagenum,pagesize);
        List<NCommunication> list=dao.getComm(ciid);
        PageInfo<NCommunication> res=new PageInfo<>(list);
        return res;
    }

    @Override
    public int delete_byciid(int id) {
        return dao.delete_byciid(id);
    }

    @Override
    public String getkidname(int classid, int userid) {
        return dao.getkidname(classid,userid);
    }

    @Override
    public int add(Communication comm) {
        return dao.add(comm);
    }

    @Override
    public PageInfo mutiply(NCommunication condition, int pagenum, int pagesize) {
        PageHelper.startPage(pagenum,pagesize);
        List<NCommunication> list=dao.mutiply(condition);
        PageInfo<NCommunication> res=new PageInfo<>(list);
        return res;
    }

}
