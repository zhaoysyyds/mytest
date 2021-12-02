package com.javaee.controller;

import com.github.pagehelper.PageHelper;
import com.javaee.domain.SystemInformation;
import com.javaee.service.SystemInformationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/system")
public class SystemInformationController {

    public static final int PAGE_SIZE=5;
    public static  int NOW_PAGE=1;

    @Resource
    private SystemInformationService service;

    @ResponseBody
    @RequestMapping(value="/information")
    public void information(int x, int now, HttpSession session){
        if(now!=0)NOW_PAGE=now;
        if(x!=0)NOW_PAGE+=x;
        PageInfo informations=service.findallsysinfomation(NOW_PAGE,PAGE_SIZE);
        System.out.println(informations);
        session.setAttribute("informations",informations);
    }
    @RequestMapping(value="/informations")
    public String informations(HttpServletRequest request){
        NOW_PAGE=1;
        PageInfo informations=service.findallsysinfomation(NOW_PAGE,PAGE_SIZE);
        System.out.println(1);
        request.setAttribute("informations",informations);
        return "manager/information";
    }

    @RequestMapping(value="/delete")
    public String deletesysm(Integer id,HttpServletRequest request){
        int x=0;
        try{
            x= service.deleteinformation(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(x>0){
            request.setAttribute("msg","删除成功");
        }
        else{
            request.setAttribute("msg","删除失败");
        }
        return "forward:/system/deleteAjaxSplit.do";
    }
    @RequestMapping(value="/deleteAjaxSplit",produces = "text/html;charset=utf-8")
    @ResponseBody
    public Object deleteAjaxSplit(HttpServletRequest request){
        NOW_PAGE=1;
        PageInfo informations=service.findallsysinfomation(NOW_PAGE,PAGE_SIZE);
        request.getSession().setAttribute("informations",informations);
        return request.getAttribute("msg");
    }

    @RequestMapping(value="/add")
    public String add(String message,String title,HttpServletRequest request){
        System.out.println(message);
        SystemInformation temp=new SystemInformation();
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss" );
        Date d=new Date();
        temp.setDate(sdf.format(d));
        temp.setMessage(message);
        temp.setTitle(title);
        System.out.println(temp);
        int x=0;
        try{
            x= service.addinformation(temp);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(x>0){
            request.setAttribute("msg","添加成功");
        }
        else{
            request.setAttribute("msg","添加失败");
        }
        return "forward:/system/informations.do";
    }

    public static int TEACHER_SIZE=1;

    @RequestMapping(value="/teacher_systeminformation")
    public String teacher_systeminformation(HttpServletRequest request){
        PageInfo informations=service.findallsysinfomation(TEACHER_SIZE,PAGE_SIZE);
        System.out.println(1);
        request.setAttribute("informations",informations);
        return "teacher/system";
    }
    @ResponseBody
    @RequestMapping(value="/ajaxsplit_tea_sysinfor")
    public void ajaxsplit_tea_sysinfor(int x, int now, HttpSession session){
        if(now!=0)NOW_PAGE=now;
        if(x!=0)NOW_PAGE+=x;
        PageInfo informations=service.findallsysinfomation(NOW_PAGE,PAGE_SIZE);
        System.out.println(informations);
        session.setAttribute("informations",informations);
    }

}
