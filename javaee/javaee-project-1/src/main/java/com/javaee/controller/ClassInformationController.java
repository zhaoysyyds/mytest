package com.javaee.controller;

import com.github.pagehelper.PageInfo;
import com.javaee.domain.ClassInformation;
import com.javaee.domain.SystemInformation;
import com.javaee.domain.TCInformation;
import com.javaee.domain.User;
import com.javaee.service.ClassInformationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping(value = "/class_mes")
public class ClassInformationController {
    public static final int PAGE_SIZE=5;
    public static  int NOW_PAGE=1;

    @Resource
    private ClassInformationService service;

    @ResponseBody
    @RequestMapping(value="/get_byid")
    public void get_byid(int classid, HttpSession session){
        NOW_PAGE=1;
        PageInfo informations=service.getClassInformation(NOW_PAGE,PAGE_SIZE,classid);
        System.out.println(informations);
        session.setAttribute("class_informations",informations);
        session.setAttribute("classid",classid);
    }

    @ResponseBody
    @RequestMapping(value="/get_byid_cpl")
    public void get_byid_cpl(String title, int classid, String date,String name,int x, int now, HttpSession session) throws ParseException {
        if(now!=0)NOW_PAGE=now;
        if(x!=0)NOW_PAGE+=x;
        PageInfo informations=null;
        if((!title.equals(""))||(!date.equals(""))||(!name.equals(""))){
            TCInformation condition=new TCInformation();
            if(date!=null&&date!="") {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date d = sdf.parse(date);
                condition.setDate(sdf.format(d));
                System.out.println(condition.getDate() + ":date1");
            }
            condition.setName(name);
            condition.setClassid(classid);
            condition.setTitle(title);
            informations=service.mutiply(condition,NOW_PAGE,PAGE_SIZE);
            System.out.println("information111:"+informations);
        }
        else {
            informations = service.getClassInformation(NOW_PAGE, PAGE_SIZE, classid);
            System.out.println(informations);
        }
        session.setAttribute("class_informations",informations);

        session.setAttribute("classid",classid);
    }


    @RequestMapping(value="/add")
    public String add(String message,String title,HttpSession session,HttpServletRequest request){
       int classid=(int)session.getAttribute("classid");
       int teacherid=((User)session.getAttribute("res")).getId();
        ClassInformation temp=new ClassInformation();
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss" );
        Date d=new Date();
        temp.setDate(sdf.format(d));
        temp.setMessage(message);
        temp.setTitle(title);
        temp.setClassid(classid);
        temp.setTeacherid(teacherid);
        System.out.println("temp:"+temp);
        int x=service.add(temp);
        return "forward:/class_mes/add_return.do";
    }

    @ResponseBody
    @RequestMapping(value="/add_return")
    public void add_return(HttpSession session){
        NOW_PAGE=1;
        int classid=(int)session.getAttribute("classid");
        PageInfo informations=service.getClassInformation(NOW_PAGE,PAGE_SIZE,classid);
        System.out.println(informations);
        session.setAttribute("class_informations",informations);
    }

    @RequestMapping(value="/delete")
    public String delete(int id, HttpServletRequest request){
        int x=0;
        try{
            x= service.deleteci(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(x>0){
            request.setAttribute("msg","删除成功");
        }
        else{
            request.setAttribute("msg","删除失败");
        }
        return "forward:/class_mes/deleteAjaxSplit.do";
    }

    @RequestMapping(value="/deleteAjaxSplit",produces = "text/html;charset=utf-8")
    @ResponseBody
    public Object deleteAjaxSplit(HttpServletRequest request,HttpSession session){
        NOW_PAGE=1;

        int classid=(int)session.getAttribute("classid");
        System.out.println("calssid:"+classid);
        PageInfo informations=service.getClassInformation(classid,NOW_PAGE,PAGE_SIZE);
        System.out.println("delete:");
        System.out.println(informations);
        request.getSession().setAttribute("class_informations",informations);
        return request.getAttribute("msg");
    }

    @ResponseBody
    @RequestMapping(value="/mutiply")
    public void mutiply(String title, int classid,String date,String name,HttpSession session) throws ParseException {
        NOW_PAGE=1;
        TCInformation condition=new TCInformation();
            //SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss" );
        if(date!=null&&date!="") {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date d = sdf.parse(date);
            condition.setDate(sdf.format(d));
            System.out.println(condition.getDate() + ":date1");
        }
        condition.setName(name);
        condition.setClassid(classid);
        condition.setTitle(title);
       PageInfo list=service.mutiply(condition,NOW_PAGE,PAGE_SIZE);
       session.setAttribute("class_informations",list);
       session.setAttribute("classid",classid);
       System.out.println("list:"+list);

    }
}
