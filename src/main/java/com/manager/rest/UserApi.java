package com.manager.rest;

import com.manager.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserApi {

    @Autowired
    public UserService userService;

    @RequestMapping("/list")
    public String index(){
        return "";
    }
}
