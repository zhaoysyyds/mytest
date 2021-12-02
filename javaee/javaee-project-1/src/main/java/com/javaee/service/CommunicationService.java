package com.javaee.service;

import com.github.pagehelper.PageInfo;
import com.javaee.domain.Communication;
import com.javaee.domain.NCommunication;

public interface CommunicationService {
    PageInfo getcomm(int ciid,int pagenum,int pagesize);
    int delete_byciid(int id);
    String getkidname(int classid,int userid);
    int add(Communication comm);
    PageInfo mutiply(NCommunication condition,int pagenum,int pagesize);
}
