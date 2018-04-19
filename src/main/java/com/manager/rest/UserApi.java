package com.manager.rest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manager.bean.Activity;
import com.manager.bean.Item;
import com.manager.bean.Results;
import com.manager.bean.User;
import com.manager.service.ActivityService;
import com.manager.service.ItemService;
import com.manager.service.ResultsService;
import com.manager.service.UserService;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserApi {

    @Autowired
    private UserService userService;
    @Autowired
    private ResultsService resultsService;
    @Autowired
    private ActivityService activityService;
    @Autowired
    private ItemService itemService;

    @RequestMapping("/addResults")
    public String addResults(HttpServletRequest request, Results results, MultipartFile file) throws IOException {

        User user = (User)request.getSession().getAttribute("user");

        if(!file.getOriginalFilename().equals("")){
            File dataDir = new File("C:/bsData");
            if(!dataDir.exists()){
                dataDir.mkdir();
            }
            File tempFile = new File("C:/bsData/" + user.getId() + "_" + user.getName()
                    + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")));
            FileUtils.copyInputStreamToFile(file.getInputStream(), tempFile);
            results.setFilePath(tempFile.getAbsolutePath().replaceAll("\\\\", "/"));
        }

        results.setUserId(user.getId());
        resultsService.insertSelective(results);
        request.setAttribute("message", "申报成功，等待审核！");
        return "user/addResults";
    }

    @RequestMapping("/resultsList")
    public String resultsList(@RequestParam(required=true,defaultValue="1") Integer pageNum, Results para, HttpServletRequest request) throws IOException {

        User user = (User)request.getSession().getAttribute("user");
        para.setUserId(user.getId());
        List<Results> ls = new ArrayList<Results>();
        if(para.getType() != null){
            para.setType(URLDecoder.decode(para.getType(), "utf-8"));
        }
        if(para.getName() != null && !para.getName().trim().equals("")){
            para.setName(URLDecoder.decode(para.getName(), "utf-8"));
        }
        if(para.getType() != null && para.getType().equals("-1")){
            para.setType(null);
        }
        if(para.getCheck() != null && para.getCheck() == -1){
            para.setCheck(null);
        }
        PageHelper.startPage(pageNum, 10);
        ls = resultsService.selectBySelective(para);

        PageInfo<Results> pageInfo =new PageInfo<Results>(ls);
        request.setAttribute("page", pageInfo);
        request.setAttribute("list", ls);
        return "user/resultsList";
    }


    @RequestMapping("/allResults")
    public String allResults(@RequestParam(required=true,defaultValue="1") Integer pageNum, Results para, HttpServletRequest request) throws IOException {

        para.setCheck(1);
        List<Results> ls = new ArrayList<Results>();
        if(para.getType() != null){
            para.setType(URLDecoder.decode(para.getType(), "utf-8"));
        }
        if(para.getName() != null && !para.getName().trim().equals("")){
            para.setName(URLDecoder.decode(para.getName(), "utf-8"));
        }
        if(para.getType() != null && para.getType().equals("-1")){
            para.setType(null);
        }

        PageHelper.startPage(pageNum, 10);
        ls = resultsService.selectBySelective(para);

        PageInfo<Results> pageInfo =new PageInfo<Results>(ls);

        request.setAttribute("page", pageInfo);
        request.setAttribute("list", ls);
        return "user/allResults";
    }


    @RequestMapping("/uploadFile")
    public void uploadFile(HttpServletResponse response, String filePath) throws IOException {

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/force-download");
        String fileName =  "附件" + filePath.substring(filePath.lastIndexOf("."));
        fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
        response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
        InputStream in = new FileInputStream(filePath);

        OutputStream out = response.getOutputStream();
        byte[] b = new byte[1024];
        int len = 0;
        while((len = in.read(b))!=-1){
            out.write(b, 0, len);
        }
        out.flush();
        out.close();
        in.close();
    }

    @RequestMapping("/getResultsById")
    public void getResultsById(HttpServletResponse response, Integer id) throws IOException {

        response.setContentType("UTF-8");
        Results results = resultsService.selectByPrimaryKey(id);
        PrintWriter pw =  response.getWriter();
        JSONObject json = JSONObject.fromObject(results);
        pw.write(new String(json.toString().getBytes("UTF-8"), "ISO-8859-1"));
        pw.close();
    }

    @RequestMapping("/delResults")
    public String delResults(HttpServletRequest request, HttpServletResponse response, Integer id) throws IOException, ServletException {

        resultsService.deleteByPrimaryKey(id);
        request.setAttribute("message", "删除成功！");

        return resultsList(1, new Results(), request);

    }

    @RequestMapping("/updateResults")
    public String updateResults(HttpServletRequest request, Results results, MultipartFile file) throws IOException, ServletException {

        User user = (User)request.getSession().getAttribute("user");
        if(!file.getOriginalFilename().equals("")){
            File dataDir = new File("C:/bsData");
            if(!dataDir.exists()){
                dataDir.mkdir();
            }
            File tempFile = new File("C:/bsData/" + user.getId() + "_" + user.getName()
                    + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")));
            FileUtils.copyInputStreamToFile(file.getInputStream(), tempFile);
            results.setFilePath(tempFile.getAbsolutePath().replaceAll("\\\\", "/"));
        }

        resultsService.updateByPrimaryKeySelective(results);
        request.setAttribute("message", "修改成功！");
        return resultsList(1, new Results(), request);

    }

    @RequestMapping("/activityList")
    public String activityList(HttpServletRequest request, @RequestParam(required=true,defaultValue="1") Integer pageNum
                                                                , Activity para) throws IOException, ServletException {

        User user = (User)request.getSession().getAttribute("user");

        if(para.getType() != null){
            para.setType(URLDecoder.decode(para.getType(), "utf-8"));
        }
        if(para.getName() != null && !para.getName().trim().equals("")){
            para.setName(URLDecoder.decode(para.getName(), "utf-8"));
        }
        if(para.getType() != null && para.getType().equals("-1")){
            para.setType(null);
        }
        List<Activity> ls = new ArrayList<Activity>();
        PageHelper.startPage(pageNum, 10);
        ls = activityService.selectBySelective(para);

        PageInfo<Activity> pageInfo =new PageInfo<Activity>(ls);

        Item para2 = new Item();
        ls.forEach((Activity activity) ->{
            para2.setActivityId(activity.getId());
            para2.setUserId(user.getId());
            List<Item> itemLs = itemService.selectBySelective(para2);
            if(itemLs == null || itemLs.size() < 1){
                activity.setStatus("未申报");
            }else{
                activity.setStatus("已申报");
            }
        });

        request.setAttribute("page", pageInfo);
        request.setAttribute("list", ls);

        return "user/activityList";
    }

    @RequestMapping("/getActivityById")
    public void getActivityById(HttpServletResponse response, Integer id) throws IOException {

        response.setContentType("UTF-8");
        Activity bean = activityService.selectByPrimaryKey(id);
        PrintWriter pw =  response.getWriter();
        JSONObject json = JSONObject.fromObject(bean);
        pw.write(new String(json.toString().getBytes("UTF-8"), "ISO-8859-1"));
        pw.close();
    }

    @RequestMapping("/addItem")
    public String addItem(HttpServletRequest request, Item item, MultipartFile file) throws IOException, ServletException {

        User user = (User)request.getSession().getAttribute("user");

        if(!file.getOriginalFilename().equals("")){
            File dataDir = new File("C:/bsData");
            if(!dataDir.exists()){
                dataDir.mkdir();
            }
            File tempFile = new File("C:/bsData/" + user.getId() + "_" + user.getName()
                    + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")));
            FileUtils.copyInputStreamToFile(file.getInputStream(), tempFile);
            item.setFilePath(tempFile.getAbsolutePath().replaceAll("\\\\", "/"));
        }

        item.setUserId(user.getId());
        itemService.insertSelective(item);
        request.setAttribute("message", "申报成功，请等待审核！");
        return activityList(request, 1, new Activity());
    }

    @RequestMapping("/cancelApply")
    public String cancelApply(HttpServletRequest request, Integer activityId) throws IOException, ServletException {

        User user = (User)request.getSession().getAttribute("user");

        Map<String, Object> para = new HashMap<String, Object>();
        para.put("activityId", activityId);
        para.put("userId", user.getId());

        itemService.cancelApply(para);
        request.setAttribute("message", "取消成功！");
        return activityList(request, 1, new Activity());
    }
}
