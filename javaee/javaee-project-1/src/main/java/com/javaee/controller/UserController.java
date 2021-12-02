package com.javaee.controller;


import com.github.pagehelper.PageInfo;
import com.javaee.domain.User;
import com.javaee.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {
    @Resource
    private UserService userService;


    public static final int PAGE_SIZE=5;
    public static  int NOW_PAGE=1;

    @RequestMapping("/identifyuser")
    public String identifyuser(User user, HttpSession session,HttpServletRequest request){
        List<User> users=userService.findusers();
        int test=0;
        User res;
        Enumeration em=session.getAttributeNames();
        while(em.hasMoreElements()){
            session.removeAttribute(em.nextElement().toString());
        }

        for(int i=0;i<users.size();i++){
            User temp=users.get(i);
            if(temp.getUser().equals(user.getUser())){
                if(temp.getPassword().equals(user.getPassword())){
                    res=temp;
                    System.out.println(res.getName());
                    session.setAttribute("res",res);
                    session.setAttribute("type",res.getType());
                    if(temp.getType()==1) return "manager/main";
                    else if(temp.getType()==2)  return "teacher/main";
                    else return "native/main";
                }
                else{
                    test=1;
                }
            }
        }
          if(test==0) request.setAttribute("err","账号不存在或未通过审核");
          else request.setAttribute("err","密码输入错误");
          return "login";
    }

    @RequestMapping("/regist")
    public String registuser(User user, HttpServletRequest request){
        System.out.println("user:"+user);
        List<String> users=userService.findallusers();
        for(int i=0;i<users.size();i++){
            String temp=users.get(i);
            if(temp.equals(user.getUser())){
                request.setAttribute("msg","账号已存在");
                return "regist";
            }
        }
        if(user.getType()==3)user.setPass(true);
        else user.setPass(false);
        int temp=userService.adduser(user);
        if(temp!=0) {
            request.setAttribute("msg", "账号创建成功");
            return "regist";
        }
        else {
            request.setAttribute("msg", "账号创建失败");
            return "regist";
        }
    }
    @RequestMapping("/checkteachers")
    public String checkTeachers(HttpServletRequest request){
        NOW_PAGE=1;
        PageInfo teachers= userService.checkTeachers(NOW_PAGE,PAGE_SIZE);
        request.setAttribute("teachers",teachers);
        return "manager/teachers";
    }
    @ResponseBody
    @RequestMapping(value="/checkteachers_cpl")
    public void checkteachers_cpl(int x, int now, HttpSession session){
        if(now!=0)NOW_PAGE=now;
        if(x!=0)NOW_PAGE+=x;
        PageInfo teachers=userService.checkTeachers(NOW_PAGE,PAGE_SIZE);
        System.out.println(teachers);
        session.setAttribute("teachers",teachers);
    }

    @RequestMapping("/pass")
    public String passTeachers(Integer id,HttpServletRequest request){
        int x=0;
        try{
            x= userService.passTeacher(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(x>0){
            request.setAttribute("msg","通过成功");
        }
        else{
            request.setAttribute("msg","通过失败");
        }
        return "forward:/users/passAjaxSplit.do";
    }
    @RequestMapping(value="/passAjaxSplit",produces = "text/html;charset=utf-8")
    @ResponseBody
    public Object passAjaxSplit(HttpServletRequest request){
        NOW_PAGE=1;
        PageInfo teachers=userService.checkTeachers(NOW_PAGE,PAGE_SIZE);
        request.getSession().setAttribute("teachers",teachers);
        return request.getAttribute("msg");
    }

}
