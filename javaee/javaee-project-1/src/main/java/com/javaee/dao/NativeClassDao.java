package com.javaee.dao;

import com.javaee.domain.ClassName;
import com.javaee.domain.NativeClass;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NativeClassDao {
    List<NativeClass> getnative(int classid);
    int passnative(@Param("classid")Integer classid,@Param("nativeid") Integer nativeid);
    int add(NativeClass a);
    int check(NativeClass a);
    List<ClassName> getnativeclass(int nativeid);
}
