package com.javaee.service;

import com.github.pagehelper.PageInfo;
import com.javaee.domain.SystemInformation;

import java.util.List;

public interface SystemInformationService {
    PageInfo findallsysinfomation(int pageNum, int pageSize);
    int deleteinformation(Integer id);
    int addinformation(SystemInformation information);
}
