package com.javaee.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javaee.dao.SystemInformationDao;
import com.javaee.domain.SystemInformation;
import com.javaee.service.SystemInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value="systemInformationService")
public class SystemInformationServiceImpl implements SystemInformationService {
    @Autowired
    SystemInformationDao systemInformationDao;

    @Override
    public PageInfo findallsysinfomation(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<SystemInformation> list=systemInformationDao.selectsysinformation();
        PageInfo<SystemInformation> res=new PageInfo<>(list);
        return res;
    }

    @Override
    public int deleteinformation(Integer id) {
        return systemInformationDao.deleteinformation(id);
    }

    @Override
    public int addinformation(SystemInformation information) {
        return systemInformationDao.addinformation(information);
    }
}
