package com.javaee.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javaee.dao.UserDao;
import com.javaee.domain.SystemInformation;
import com.javaee.domain.User;
import com.javaee.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value="userService")
public class UserServiceImpl implements UserService {
     @Autowired
     private UserDao userDao;

    @Override
    public List<User> findusers() {
        return userDao.selectUsers();
    }
    @Override
    public List<String> findallusers(){
        return userDao.selectAllUsers();
    }

    @Override
    public int adduser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public PageInfo checkTeachers(int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<User> list=userDao.checkTeachers();
        PageInfo<User> res=new PageInfo<>(list);
        return res;
    }

    @Override
    public int passTeacher(Integer id) {
        return userDao.passTeacher(id);
    }
}
