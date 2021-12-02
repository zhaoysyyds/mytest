package com.javaee.service;

import com.github.pagehelper.PageInfo;
import com.javaee.domain.ClassName;
import com.javaee.domain.NativeClass;

import java.util.List;

public interface NativeClassService {
    PageInfo getnative(int pageNum,int pageSize,int classid);
    int passNative(int classid,int nativeid);
    int add(NativeClass a);
    int check(NativeClass a);
    List<ClassName> getnativeclass(int nativeid);
}
