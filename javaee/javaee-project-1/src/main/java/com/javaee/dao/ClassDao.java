package com.javaee.dao;

import com.javaee.domain.Class;
import com.javaee.domain.ClassAName;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassDao {
   List<ClassAName> selectClasses();
   int pass(Integer id);

   int getclassid(Integer hmasterid);
   int addclass(@Param("hmasterid") int hmasterid,@Param("classname") String classname);
   Class getaclass(int teacherid);
   List<Class> getallclass();
   int check(String classname);
   List<String> get_nc_name(int nativeid);
   List<String> get_0nc_name(int nativeid);
}
