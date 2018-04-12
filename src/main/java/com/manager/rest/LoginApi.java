package com.manager.rest;

import com.manager.bean.Admin;
import com.manager.bean.User;
import com.manager.service.AdminService;
import com.manager.service.UserService;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class LoginApi {

    @Autowired
    private UserService userService;
    @Autowired
    private AdminService adminService;


    @RequestMapping("/regist")
    public String regist(HttpServletRequest request, User user){

        userService.insert(user);
        request.setAttribute("message", "注册成功，请登录!");
        return "login";
    }

    @RequestMapping("/login")
    public String regist(HttpServletRequest request, String account, String pwd, int type){

        if(type == 1){
            List<User> ls = new ArrayList<User>();
            User para = new User();
            para.setAccount(account);
            para.setPwd(pwd);
            ls = userService.SelectUserSelective(para);
            if(ls == null || ls.size() == 0){
                request.setAttribute("message", "帐号密码错误，请重新登录!");
                return "login";
            }else{
                para = ls.get(0);
                request.getSession().setAttribute("user", para);
                return "/user/index";
            }
        }else{
            List<Admin> ls = new ArrayList<Admin>();
            Admin para = new Admin();
            para.setAccount(account);
            para.setPwd(pwd);
            ls = adminService.selectAdminSelective(para);
            if(ls == null || ls.size() == 0){
                request.setAttribute("message", "帐号密码错误，请重新登录!");
                return "login";
            }else{
                para = ls.get(0);
                request.getSession().setAttribute("admin", para);
                return "";
            }
        }

    }

}
