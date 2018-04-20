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
public class PublicApi {

    @RequestMapping("/")
    public String loginHtml(){
        return "login";
    }

    @RequestMapping("/uHeadJsp")
    public String head(){
        return "user/head";
    }

    @RequestMapping("/uHead2Jsp")
    public String head2(){
        return "user/head2";
    }

    @RequestMapping("/uLeftJsp")
    public String left(){
        return "user/left";
    }

    @RequestMapping("/uMainJsp")
    public String main(){
        return "user/main";
    }

    @RequestMapping("/addResultsJsp")
    public String addResults(){
        return "user/addResults";
    }

    @RequestMapping("/resultsListJsp")
    public String resultsListJsp(){
        return "user/resultsList";
    }

    @RequestMapping("/contactJsp")
    public String contactJsp(){
        return "user/contact";
    }
}