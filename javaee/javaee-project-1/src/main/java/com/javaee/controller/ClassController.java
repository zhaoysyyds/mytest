package com.javaee.controller;

import com.github.pagehelper.PageInfo;
import com.javaee.domain.ClassAName;
import com.javaee.domain.ClassName;
import com.javaee.domain.User;
import com.javaee.domain.Class;
import com.javaee.service.ClassService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value="/class")
public class ClassController {
    public static final int PAGE_SIZE=5;
    public static  int NOW_PAGE=1;

    @Resource
    private ClassService classService;

    @RequestMapping(value = "/getclasses")
    public String getclasses(HttpServletRequest request){
        NOW_PAGE=1;
        PageInfo classes=classService.getClasses(NOW_PAGE,PAGE_SIZE);
        System.out.println("sss:"+classes);
        request.setAttribute("classes",classes);
        return "manager/classes";
    }

    @ResponseBody
    @RequestMapping(value="/getclasses_cpl")
    public void getclasses_cpl(int x, int now, HttpSession session){
        if(now!=0) NOW_PAGE=now;
        if(x!=0)NOW_PAGE+=x;
        PageInfo classes=classService.getClasses(NOW_PAGE,PAGE_SIZE);
        System.out.println(classes);
        session.setAttribute("classes",classes);
    }

    @RequestMapping("/pass")
    public String passClasses(Integer id,HttpServletRequest request){
        int x=0;
        try{
            x= classService.passClasses(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(x>0){
            request.setAttribute("msg","通过成功");
        }
        else{
            request.setAttribute("msg","通过失败");
        }
        return "forward:/class/passAjaxSplit.do";
    }

    @RequestMapping(value="/passAjaxSplit",produces = "text/html;charset=utf-8")
    @ResponseBody
    public Object passAjaxSplit(HttpServletRequest request){
        NOW_PAGE=1;
        PageInfo classes=classService.getClasses(NOW_PAGE,PAGE_SIZE);
        request.getSession().setAttribute("classes",classes);
        return request.getAttribute("msg");
    }

    @ResponseBody
    @RequestMapping(value = "/getclassid")
    public void getclassid(HttpSession session,int hmasterid){
        int id=classService.getClassid(hmasterid);
        System.out.println(id);
        session.setAttribute("hclassid",id);
    }

    @RequestMapping(value="/add_class",produces = "text/html;charset=utf-8")
    public String add_class(String grade,String aclass,HttpServletRequest request,HttpSession session){
        int teacherid=((User)session.getAttribute("res")).getId();
        String classname=grade+aclass;
        int x=0;

        x=classService.check(classname);
        if(x!=0){
            request.setAttribute("msg","该班级已经存在");
            return "teacher/class_manager";
        }
        x=0;
        try{
            x= classService.addclass(teacherid,classname);
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

    @RequestMapping("/getaclass")
    @ResponseBody
    public void getaclass(int teacherid,HttpSession session){
        System.out.println("getaclass:"+teacherid);
        Class k=classService.getaclass(teacherid);
        System.out.println(k.getClassname());
        session.setAttribute("myclass",k);
    }

    @RequestMapping("/getallclass")
    @ResponseBody
    public void getallclass(HttpSession session){
        List<Class> list=classService.getallclass();
        System.out.println("list");
        System.out.println(list);
        session.setAttribute("allclass",list);
    }

    @RequestMapping("/getjoinclass")
    @ResponseBody
    public void getjoinclass(int nativeid,HttpSession session){
        List<String> list=classService.get_nc_name(nativeid);
        System.out.println("list");
        System.out.println(list);
        session.setAttribute("joinclass",list);
    }

    @RequestMapping("/getjoin0class")
    @ResponseBody
    public void getjoin0class(int nativeid,HttpSession session){
        List<String> list=classService.get_0nc_name(nativeid);
        System.out.println("list");
        System.out.println(list);
        session.setAttribute("join0class",list);
    }
}
