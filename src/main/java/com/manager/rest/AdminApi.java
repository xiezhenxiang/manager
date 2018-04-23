package com.manager.rest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manager.bean.*;
import com.manager.service.*;
import net.sf.json.JSONObject;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class AdminApi {

    @Autowired
    AdminService adminService;
    @Autowired
    ResultsService resultsService;
    @Autowired
    ItemService itemService;
    @Autowired
    NoticeService noticeService;


    @RequestMapping("/addResults")
    public String addResults(HttpServletRequest request, Results results, MultipartFile file) throws IOException {


        if(!file.getOriginalFilename().equals("")){

            File dataDir = new File("C:/bsData");

            if(!dataDir.exists()){
                dataDir.mkdir();
            }
            File tempFile = new File("C:/bsData/" + "_" + results.getCharge()
                    + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")));
            FileUtils.copyInputStreamToFile(file.getInputStream(), tempFile);
            results.setFilePath(tempFile.getAbsolutePath().replaceAll("\\\\", "/"));
        }
        results.setCheck(1);
        resultsService.insertSelective(results);
        request.setAttribute("message", "录入成功！");
        return "admin/addResults";
    }

    @RequestMapping("/noticeList")
    public String noticeList(HttpServletRequest request, @RequestParam(required=true,defaultValue="1") Integer pageNum) throws IOException, ServletException {

        List<Notice> ls = new ArrayList<Notice>();
        PageHelper.startPage(pageNum, 10);
        ls = noticeService.selectAll();

        PageInfo<Notice> pageInfo =new PageInfo<Notice>(ls);
        request.setAttribute("page", pageInfo);
        request.setAttribute("list", ls);
        return "admin/noticeList";

    }

    @RequestMapping("/addNotice")
    public String addNotice(HttpServletRequest request, Notice notice) throws IOException {
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        notice.setAdminId(admin.getId());
        notice.setPubTime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        noticeService.insertSelective(notice);

        request.setAttribute("message", "发布成功！");
        return "admin/addNotice";
    }

    @RequestMapping("/delNotice")
    public String delNotice(HttpServletRequest request, Integer id) throws IOException, ServletException {

        noticeService.deleteByPrimaryKey(id);

        request.setAttribute("message", "删除成功！");
        return noticeList(request,1);
    }

    @RequestMapping("/notice")
    public String notice(HttpServletRequest request, Integer id) throws IOException, ServletException {

        Notice notice = noticeService.selectByPrimaryKey(id);

        if(notice.getContent() != null){
            notice.setContent(notice.getContent().replaceAll("\r\n", "<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")
                    .replaceAll("\n", "<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"));
        }
        request.setAttribute("notice", notice);
        return "admin/notice";

    }

    @RequestMapping("/resultsList")
    public String resultsList(@RequestParam(required=true,defaultValue="1") Integer pageNum, HttpServletRequest request, Results para) throws IOException {

        if(para.getType() != null){
            para.setType(URLDecoder.decode(para.getType(), "utf-8"));
        }
        if(para.getName() != null && !para.getName().trim().equals("")){
            para.setName(URLDecoder.decode(para.getName(), "utf-8"));
        }
        if(para.getType() != null && para.getType().equals("-1")){
            para.setType(null);
        }

        List<Results> ls = new ArrayList<Results>();
        para.setCheck(0);
        PageHelper.startPage(pageNum, 10);
        ls = resultsService.selectBySelective(para);

        PageInfo<Results> pageInfo =new PageInfo<Results>(ls);
        request.setAttribute("page", pageInfo);
        request.setAttribute("list", ls);
        return "admin/resultsList";
    }

    @RequestMapping("/checkResults")
    public String checkResults(HttpServletRequest request, Integer check, String comment, Integer id) throws IOException {

        if(comment != null && !comment.equals("")){
            comment = URLDecoder.decode(comment, "UTF-8");
        }

        Results res = new Results();
        res.setId(id);
        res.setCheck(check);
        res.setComment(comment);
        resultsService.updateByPrimaryKeySelective(res);

        request.setAttribute("message", "审核成功！");
        return resultsList(1, request, new Results());
    }

    @RequestMapping("/itemList")
    public String itemList(HttpServletRequest request, @RequestParam(required=true,defaultValue="1") Integer pageNum
            , Item para) throws IOException, ServletException {


        if(para.getName() != null && !para.getName().trim().equals("")){
            para.setName(URLDecoder.decode(para.getName(), "utf-8"));
        }
        if(para.getType() != null && para.getType().equals("-1")){
            para.setType(null);
        }
        if(para.getType() != null && !para.getType().equals("-1")){
            para.setType(URLDecoder.decode(para.getType(), "utf-8"));
        }
        if(para.getCheck() == null)
            para.setCheck(-1);
        List<Item> ls = new ArrayList<Item>();
        PageHelper.startPage(pageNum, 10);
        ls = itemService.selectBySelective(para);

        PageInfo<Item> pageInfo =new PageInfo<Item>(ls);
        request.setAttribute("page", pageInfo);
        request.setAttribute("list", ls);

        return "admin/itemList";
    }

    @RequestMapping("/checkItem")
    public String checkItem(HttpServletRequest request, Integer check, String comment, Integer id) throws IOException, ServletException {

        if(comment != null && !comment.equals("")){
            comment = URLDecoder.decode(comment, "UTF-8");
        }

        Item item = new Item();
        item.setId(id);
        item.setCheck(check);
        item.setComment(comment);
        itemService.updateByPrimaryKeySelective(item);

        request.setAttribute("message", "审核成功！");
        return itemList(request, 1, new Item());
    }
}
