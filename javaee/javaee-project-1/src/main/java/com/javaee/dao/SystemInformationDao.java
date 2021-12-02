package com.javaee.dao;

import com.javaee.domain.SystemInformation;

import java.util.List;

public interface SystemInformationDao {
    List<SystemInformation> selectsysinformation();
    int deleteinformation(Integer id);
    int addinformation(SystemInformation information);
}
