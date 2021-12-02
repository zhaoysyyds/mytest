package com.javaee.service;

import com.github.pagehelper.PageInfo;
import com.javaee.domain.User;

import java.util.List;

public interface UserService {
    List<User> findusers();
    List<String> findallusers();
    int adduser(User user);
    PageInfo checkTeachers(int pageNum, int pageSize);
    int passTeacher(Integer id);
}
