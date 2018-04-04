package com.manager.rest;

import com.manager.bean.Role;
import com.manager.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class Test {

    @Autowired
    public TestService testService;

    @RequestMapping("/index")
    public String index(){
        List<Role> ls = testService.getList();
        System.out.println(78945646);
        System.out.println(4123);
        System.out.println(132);
        return "index";
    }
}
