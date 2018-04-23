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
    public String uHeadJsp(){
        return "user/head";
    }

    @RequestMapping("/addNoticeJsp")
    public String addNoticeJsp(){
        return "admin/addNotice";
    }

    @RequestMapping("/uHead2Jsp")
    public String uHead2Jsp(){
        return "user/head2";
    }

    @RequestMapping("/uLeftJsp")
    public String uLeftJsp(){
        return "user/left";
    }

    @RequestMapping("/aLeftJsp")
    public String aLeftJsp(){
        return "admin/left";
    }

    @RequestMapping("/aAddResultsJsp")
    public String aAddResultsJsp(){
        return "admin/addResults";
    }

    @RequestMapping("/uMainJsp")
    public String uMainJsp(){
        return "user/main";
    }

    @RequestMapping("/addResultsJsp")
    public String addResultsJsp(){
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

    @RequestMapping("/addActivityJsp")
    public String addActivityJsp(){
        return "admin/addActivity";
    }
}