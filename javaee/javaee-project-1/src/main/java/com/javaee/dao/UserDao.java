package com.javaee.dao;

import com.javaee.domain.User;

import java.util.List;

public interface UserDao {
    List<User> selectUsers();
    List<String> selectAllUsers();
    int addUser(User user);
    List<User> checkTeachers();
    int passTeacher(Integer id);
}
