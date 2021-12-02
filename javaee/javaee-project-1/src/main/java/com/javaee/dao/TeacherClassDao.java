package com.javaee.dao;

import com.javaee.domain.ClassName;
import com.javaee.domain.TCName;
import com.javaee.domain.TeacherClass;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherClassDao {
    List<ClassName> selectclass_id_name(int teacherid);
    List<TCName> selecttcname(int classid);
    int passteacher(@Param("classid") int classid,@Param("teacherid") int teacherid);
    int add_teacher_class(@Param("classid")int classid,@Param("teacherid")int teacherid);

    List<String> getjoin0class(int teacherid);

    int check(@Param("teacherid")int teacherid,@Param("classid")int classid);
    int passhmaster(@Param("classid") int classid,@Param("hmasterid") int hmasterid);
}
