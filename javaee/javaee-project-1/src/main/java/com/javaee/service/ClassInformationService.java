package com.javaee.service;

import com.github.pagehelper.PageInfo;
import com.javaee.domain.ClassInformation;
import com.javaee.domain.TCInformation;

public interface ClassInformationService {
    PageInfo getClassInformation(int pageNum, int pageSize,int classid);
    int deleteci(int id);
    PageInfo mutiply(TCInformation condition,int pageNum,int pageSizer);
    int add(ClassInformation temp);
}
