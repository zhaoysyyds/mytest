package com.javaee.controller;

import com.github.pagehelper.PageInfo;
import com.javaee.domain.ClassName;
import com.javaee.domain.NCommunication;
import com.javaee.domain.NativeClass;
import com.javaee.domain.User;
import com.javaee.service.NativeClassService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/nativeclass")
public class NativeClassController {
    public static final int PAGE_SIZE=5;
    public static  int NOW_PAGE=1;

    @Resource
    private NativeClassService service;

    @RequestMapping(value="/get_byid")
    public String get_byid(HttpServletRequest request,int classid){
        NOW_PAGE=1;
        PageInfo informations=service.getnative(NOW_PAGE,PAGE_SIZE,classid);
        System.out.println("native:");
        System.out.println(informations);
        request.setAttribute("native_informations",informations);
        return "teacher/native_information";
    }

    @ResponseBody
    @RequestMapping(value="/get_byid_cpl")
    public void get_byid_cpl(HttpSession session, int classid,int now,int x){
        if(now!=0)NOW_PAGE=now;
        if(x!=0)NOW_PAGE+=x;
        PageInfo informations=service.getnative(NOW_PAGE,PAGE_SIZE,classid);
        System.out.println(informations);
        session.setAttribute("native_informations",informations);
    }

    @RequestMapping("/pass")
    public String passNative(int classid,int nativeid,HttpServletRequest request){
        int x=0;
        try{
            x= service.passNative(classid,nativeid);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(x>0){
            request.setAttribute("msg","审核通过成功");
        }
        else{
            request.setAttribute("msg","审核通过失败");
        }
        return "forward:/nativeclass/passAjaxSplit.do";
    }
    @RequestMapping(value="/passAjaxSplit",produces = "text/html;charset=utf-8")
    @ResponseBody
    public Object passAjaxSplit(HttpServletRequest request,HttpSession session){
        NOW_PAGE=1;
        int classid=(int)session.getAttribute("hclassid");
        PageInfo informations=service.getnative(NOW_PAGE,PAGE_SIZE,classid);
        session.setAttribute("native_informations",informations);
        return request.getAttribute("msg");
    }

    @RequestMapping(value="/add_native_class")
    public String add(int classid,String kidname,HttpServletRequest request,HttpSession session){
        int nativeid=((User)session.getAttribute("res")).getId();
        System.out.println("nativeid:"+nativeid+" "+classid+" "+kidname);
        NativeClass a=new NativeClass();
        a.setKidname(kidname);
        a.setClassid(classid);
        a.setNativeid(nativeid);
        a.setPass(false);
        int x=0;

        x=service.check(a);
        if(x!=0){
            request.setAttribute("msg","你已经申请过加入该班级了");
        }
        else {
            try {
                x = service.add(a);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (x > 0) {
                request.setAttribute("msg", "添加成功");
            } else {
                request.setAttribute("msg", "添加失败");
            }
        }
        return "native/class_manager";
    }
    @ResponseBody
    @RequestMapping(value = "/getclassnames")
    public void  getclassnames(int nativeid, HttpSession session) {
        List<ClassName> classNames=service.getnativeclass(nativeid);
        session.setAttribute("classNames",classNames);
    }

}
