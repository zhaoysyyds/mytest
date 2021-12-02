package com.javaee.controller;

import com.github.pagehelper.PageInfo;
import com.javaee.domain.*;
import com.javaee.service.TeacherClassService;
import com.mysql.cj.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/teacher_class")
public class TeacherClassController {
    public static final int PAGE_SIZE=5;
    public static  int NOW_PAGE=1;

    @Resource
    private TeacherClassService service;

    @ResponseBody
    @RequestMapping(value = "/get_byid")
    public void  getclass_byid(int teacherid, HttpSession session) {
        List<ClassName> classNames=service.getteacherclass(teacherid);
        System.out.println("classnames");
        System.out.println(classNames);
        session.setAttribute("classNames",classNames);
    }

    @RequestMapping(value ="/get_teacher")
    public String get_teacher(int classid,HttpServletRequest request){
        NOW_PAGE=1;

        PageInfo informations=service.gettcname(classid,NOW_PAGE,PAGE_SIZE);
        System.out.println(informations);
        request.setAttribute("teacher_informations",informations);
        return "teacher/teacher_information";
    }

    @ResponseBody
    @RequestMapping(value ="/get_teacher_cpl")
    public void get_teacher_cpl(int now,int x,int classid,HttpSession session){
        if(now!=0)NOW_PAGE=now;
        if(x!=0)NOW_PAGE+=x;
        PageInfo informations=service.gettcname(classid,NOW_PAGE,PAGE_SIZE);
        System.out.println(informations);
        session.setAttribute("teacher_informations",informations);
    }

    @RequestMapping("/pass")
    public String passTeachers(int classid,int teacherid,HttpServletRequest request){
        int x=0;
        try{
            x= service.passTeacher(classid,teacherid);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(x>0){
            request.setAttribute("msg","审核通过成功");
        }
        else{
            request.setAttribute("msg","审核通过失败");
        }
        return "forward:/teacher_class/passAjaxSplit.do";
    }
    @RequestMapping(value="/passAjaxSplit",produces = "text/html;charset=utf-8")
    @ResponseBody
    public Object passAjaxSplit(HttpServletRequest request,HttpSession session){
        NOW_PAGE=1;
        int classid=(int)session.getAttribute("hclassid");
        PageInfo informations=service.gettcname(classid,NOW_PAGE,PAGE_SIZE);
        session.setAttribute("teacher_informations",informations);
        return request.getAttribute("msg");
    }

    @RequestMapping(value="/passhmaster")
    @ResponseBody
    public void passhmaster(int classid,int hmasterid){
        int x=0;
        try{
            x= service.passhmaster(classid,hmasterid);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @RequestMapping("/add_teacher_class")
    public String add_teacher_class(int classid,HttpSession session,HttpServletRequest request){
        int teacherid=((User)session.getAttribute("res")).getId();
        System.out.println("classid:"+classid);
        System.out.println("teacherid:"+teacherid);
        int x=0;
        x=service.check(teacherid,classid);
        if(x!=0){
            request.setAttribute("msg","您已加入该班级或在审核中");
            return "teacher/class_manager";
        }
        x=0;
        try{
            x= service.add_teacher_class(classid,teacherid);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(x>0){
            request.setAttribute("msg","提交成功");
        }
        else{
            request.setAttribute("msg","提交失败");
        }
        return "teacher/class_manager";
    }

    @ResponseBody
    @RequestMapping(value ="/getjoin0class")
    public void getjoin0class(int teacherid,HttpSession session){
        System.out.println("teacherid:"+teacherid);
        List<String> informations=service.getjoin0class(teacherid);
        System.out.println("join0class");
        System.out.println(informations);
        session.setAttribute("join0class",informations);
    }
}
