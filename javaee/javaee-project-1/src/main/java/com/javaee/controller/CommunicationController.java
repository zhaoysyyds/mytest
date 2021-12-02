package com.javaee.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.javaee.domain.*;
import com.javaee.service.CommunicationService;
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
@RequestMapping("/communicate")
public class CommunicationController {
    public static final int PAGE_SIZE=5;
    public static  int NOW_PAGE=1;

    @Resource
    private CommunicationService service;

    @RequestMapping("/get_byciid")
    public String get_byccid(HttpSession session,int now){
        System.out.println(now);
        NOW_PAGE=1;
        System.out.println("get_byciid");
        PageInfo class_informations=(PageInfo)session.getAttribute("class_informations");
        int classid=(int)session.getAttribute("classid");
        System.out.println("classid:"+classid);
        TCInformation k=(TCInformation) class_informations.getList().get(now);
        System.out.println("now:"+now);
        session.setAttribute("information",k);
        NOW_PAGE=1;
        PageInfo comm_informations=service.getcomm(k.getId(),NOW_PAGE,PAGE_SIZE);
        System.out.println(comm_informations);
        for(int i=0;i<comm_informations.getList().size();i++){
            NCommunication temp=(NCommunication) comm_informations.getList().get(i);
            if(temp.getType()==3){
                ((NCommunication) comm_informations.getList().get(i)).setKidname(
                        service.getkidname(classid,temp.getUserid())
                );
            }
        }
        session.setAttribute("comm_informations",comm_informations);
        if((int)session.getAttribute("type")==2) return "teacher/communication";
        else return "native/communication";  
    }
    @ResponseBody
    @RequestMapping(value="/get_byciid_cpl")
    public void get_byid_cpl(String name,String message,String date,int ciid,int x, int now, HttpSession session) throws ParseException {
        if(now!=0)NOW_PAGE=now;
        if(x!=0)NOW_PAGE+=x;
        int classid=(int)session.getAttribute("classid");
        PageInfo comm_informations=null;
        if((!message.equals(""))||(!date.equals(""))||(!name.equals(""))){
            NCommunication condition=new NCommunication();
            if(date!=null&&date!="") {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date d = sdf.parse(date);
                condition.setDate(sdf.format(d));
                System.out.println(condition.getDate() + ":date1");
            }
            if(name!=null) {
                condition.setName(name);
                condition.setKidname(name);
            }
            condition.setCiid(ciid);
            if(message!=null)
                condition.setMessage(message);
            comm_informations=service.mutiply(condition,NOW_PAGE,PAGE_SIZE);
        }
        else {
            System.out.println("大家后");
            comm_informations = service.getcomm(ciid, NOW_PAGE, PAGE_SIZE);
            for (int i = 0; i < comm_informations.getList().size(); i++) {
                NCommunication temp = (NCommunication) comm_informations.getList().get(i);
                if (temp.getType() == 3) {
                    ((NCommunication) comm_informations.getList().get(i)).setKidname(
                            service.getkidname(classid, temp.getUserid())
                    );
                    System.out.println("temp：" + temp);
                }
            }
        }
        System.out.println(comm_informations);
        session.setAttribute("comm_informations",comm_informations);
    }


    @RequestMapping(value="/delete")
    public void delete(int id){
        int x=0;
        try{
            x= service.delete_byciid(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(x>0){
           System.out.println("删除成功x:"+x);
        }
        else{
            System.out.println("删除失败x:"+x);
        }
    }

    @RequestMapping(value="/add")
    public String add(String message,HttpSession session,HttpServletRequest request){
       int userid=((User)session.getAttribute("res")).getId();
       int ciid=((TCInformation)session.getAttribute("information")).getId();
       System.out.println("uuu:"+userid+" "+ciid+" "+message);
        Communication c=new Communication();
        c.setCiid(ciid);
        c.setMessage(message);
        c.setUserid(userid);
        SystemInformation temp=new SystemInformation();
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss" );
        Date d=new Date();
        c.setDate(sdf.format(d));
       int x=0;
        try{
            x= service.add(c);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(x>0){
            System.out.println("插入成功x:"+x);
        }
        else{
            System.out.println("插入失败x:"+x);
        }
        request.setAttribute("ciid",ciid);
        return "forward:/communicate/addAjaxSplit.do";
    }
    @RequestMapping(value="/addAjaxSplit")
    public String addAjaxSplit(HttpSession session,HttpServletRequest request){
        NOW_PAGE=1;
        int classid=(int)session.getAttribute("classid");
        int ciid=(int)request.getAttribute("ciid");
        System.out.println("ciid:"+ciid);
        NOW_PAGE=1;
        PageInfo comm_informations=service.getcomm(ciid,NOW_PAGE,PAGE_SIZE);
        System.out.println(comm_informations);
        for(int i=0;i<comm_informations.getList().size();i++){
            NCommunication temp=(NCommunication) comm_informations.getList().get(i);
            if(temp.getType()==3){
                ((NCommunication) comm_informations.getList().get(i)).setKidname(
                        service.getkidname(classid,temp.getUserid())
                );
                System.out.println("temp："+temp);
            }
        }
        session.setAttribute("comm_informations",comm_informations);
        if((int)session.getAttribute("type")==2) return "teacher/communication";
        else return "native/communication";
    }

    @ResponseBody
    @RequestMapping(value="/mutiply")
    public void mutiply(String message,int ciid, String date,String name,HttpSession session) throws ParseException {
        NOW_PAGE=1;
        System.out.println("mmmm:"+message+" "+ciid+" "+date+" "+name);
        NCommunication condition=new NCommunication();
        if(date!=null&&date!="") {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date d = sdf.parse(date);
            condition.setDate(sdf.format(d));
            System.out.println(condition.getDate() + ":date1");
        }
        condition.setName(name);
        condition.setKidname(name);
        condition.setCiid(ciid);
        condition.setMessage(message);
        System.out.println("condition:"+condition);
        PageInfo comm_informations=service.mutiply(condition,NOW_PAGE,PAGE_SIZE);
        System.out.println("mutiply:"+comm_informations);
        session.setAttribute("comm_informations",comm_informations);
    }
}
