package com.javaee.dao;

import com.javaee.domain.ClassInformation;
import com.javaee.domain.TCInformation;

import java.util.List;

public interface ClassInformationDao {
    List<TCInformation> selectclassinformations(Integer classid);
    int delete_byciid(int ciid);
    List<TCInformation> mutiply(TCInformation condition);
    int add(ClassInformation temp);
}
