package com.javaee.dao;

import com.javaee.domain.Communication;
import com.javaee.domain.NCommunication;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommunicationDao {
    List<NCommunication> getComm(int ciid);
    int delete_byciid(int id);
    String getkidname(@Param("classid")int classid,@Param("userid")int userid);
    int add(Communication comm);
    List<NCommunication> mutiply(NCommunication condition);
}
