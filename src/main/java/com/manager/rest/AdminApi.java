package com.manager.rest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manager.bean.*;
import com.manager.service.*;
import javafx.beans.DefaultProperty;
import net.sf.json.JSONArray;
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
    @Autowired
    ActivityService activityService;
    @Autowired
    UserService userService;


    @RequestMapping("/addResults")
    public String addResults(HttpServletRequest request, Results results, MultipartFile file) throws IOException {

        System.out.println(123);
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

        if(check == 3){
            Item bean = itemService.selectByPrimaryKey(id);
            Results results = new Results();
            results.setComment(bean.getComment());
            results.setCheck(1);
            results.setCharge(bean.getCharge());
            results.setType(bean.getType());
            results.setUserId(bean.getUserId());
            results.setFilePath(bean.getFilePath2());
            results.setName(bean.getName());
            results.setActivityId(bean.getActivityId());
            results.setCoin((Double.parseDouble(bean.getCoin())));
            results.setDescription(bean.getDescription());
            results.setDomain(bean.getDomain());
            results.setEndTime(bean.getEndTime());
            results.setGroup(bean.getGroup());
            results.setStartTime(bean.getStartTime());
            results.setUnit(bean.getUnit());
            resultsService.insertSelective(results);
        }

        request.setAttribute("message", "审核成功！");
        return itemList(request, 1, new Item());
    }

    @RequestMapping("/addActivity")
    public String addActivity(HttpServletRequest request, Activity activity, MultipartFile file) throws IOException, ServletException {
        Admin admin = (Admin) request.getSession().getAttribute("admin");

        if(!file.getOriginalFilename().equals("")){

            File dataDir = new File("C:/bsData");

            if(!dataDir.exists()){
                dataDir.mkdir();
            }
            File tempFile = new File("C:/bsData/" + "_" + activity.getName()
                    + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")));
            FileUtils.copyInputStreamToFile(file.getInputStream(), tempFile);
            activity.setFilePath(tempFile.getAbsolutePath().replaceAll("\\\\", "/"));
        }
        if(activity.getId() != null && activity.getId() > 0){
            activityService.updateByPrimaryKeySelective(activity);
            request.setAttribute("message", "修改成功！");
            return activityList(request, 1, new Activity());
        }else {
            activityService.insertSelective(activity);
            request.setAttribute("message", "添加成功！");
            return "admin/addActivity";
        }


    }

    @RequestMapping("/getActivity")
    public void addActivity(HttpServletResponse response, int id) throws IOException, ServletException {

        response.setCharacterEncoding("utf-8");
        PrintWriter pw = response.getWriter();

        Activity activity = activityService.selectByPrimaryKey(id);
        JSONObject json = JSONObject.fromObject(activity);

        pw.write(json.toString());
        pw.flush();
        pw.close();
    }

    @RequestMapping("/activityList")
    public String activityList(HttpServletRequest request, @RequestParam(required=true,defaultValue="1") Integer pageNum
            , Activity para) throws IOException, ServletException {


        if(para.getType() != null){
            para.setType(URLDecoder.decode(para.getType(), "utf-8"));
        }
        if(para.getName() != null && !para.getName().trim().equals("")){
            para.setName(URLDecoder.decode(para.getName(), "utf-8"));
        }
        if(para.getState() != null && !para.getState().trim().equals("")){
            para.setState(URLDecoder.decode(para.getState(), "utf-8"));
        }
        if(para.getType() != null && para.getType().equals("-1")){
            para.setType(null);
        }

        List<Activity> ls = new ArrayList<Activity>();
        List<Activity> ls2 = new ArrayList<Activity>();
        PageHelper.startPage(pageNum, 10);
        ls = activityService.selectBySelective(para);

        PageInfo<Activity> pageInfo =new PageInfo<Activity>(ls);

        ls.forEach((Activity activity) ->{
            int applyCount = activityService.getApplyCount(activity.getId());
            activity.setApplyCount(applyCount);
            int end = activity.getDescription().length() > 16 ? 16 :activity.getDescription().length();
            activity.setDescription(activity.getDescription().substring(0, end) + (end == 16 ? "....." : ""));
            if(activity.getStartTime().compareTo(new SimpleDateFormat("yyyy-MM-dd").format(new Date())) > 0){
                activity.setState("未开始");
            }else if(activity.getEndTime().compareTo(new SimpleDateFormat("yyyy-MM-dd").format(new Date())) < 0){
                activity.setState("已结束");
            }else{
                activity.setState("进行中");
            }

            if(para.getState() != null && !para.getState().equals("-1")){
                if(activity.getState().equals(para.getState())) {
                    ls2.add(activity);
                }
            }else{
                ls2.add(activity);
            }
        });

        request.setAttribute("page", pageInfo);
        request.setAttribute("list", ls2);
        request.setAttribute("type", 0);
        return "admin/activityList";
    }


    @RequestMapping("/delActivity")
    public String delActivity(HttpServletRequest request, Integer id) throws IOException, ServletException {

        activityService.deleteByPrimaryKey(id);
        request.setAttribute("message", "删除成功！");
        return activityList(request, 1, new Activity());

    }

    @RequestMapping("/activity")
    public String activity(HttpServletRequest request, Integer id, @RequestParam(required=true,defaultValue="0") int type) throws IOException, ServletException {

        Activity bean = activityService.selectByPrimaryKey(id);

        if(bean.getDescription() != null){
            bean.setDescription(bean.getDescription().replaceAll("\r\n", "<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")
                    .replaceAll("\n", "<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"));
        }
        request.setAttribute("bean", bean);
        request.setAttribute("type", type);

        return "admin/activity";

    }

    @RequestMapping("/adminList")
    public String adminList(HttpServletRequest request, @RequestParam(required=true,defaultValue="1") Integer pageNum
            , String keyword) throws IOException, ServletException {


        if(keyword != null){
            keyword = URLDecoder.decode(keyword, "utf-8");
        }

        List<Admin> ls = new ArrayList<Admin>();
        PageHelper.startPage(pageNum, 10);
        ls = adminService.selectByKeyword(keyword);

        PageInfo<Admin> pageInfo =new PageInfo<Admin>(ls);


        request.setAttribute("page", pageInfo);
        request.setAttribute("list", ls);

        return "admin/adminList";
    }

    @RequestMapping("/delAdmin")
    public String delAdmin(HttpServletRequest request, Integer id) throws IOException, ServletException {

        adminService.deleteByPrimaryKey(id);
        request.setAttribute("message", "删除成功！");
        return adminList(request, 1, "");
    }

    @RequestMapping("/addAdmin")
    public String addAdmin(HttpServletRequest request, Admin para) throws IOException, ServletException {
        try {
            adminService.insertSelective(para);
            request.setAttribute("message", "添加成功！");
        }catch (Exception e){
            request.setAttribute("message", "添加失败！该帐号已存在！");
        }
        return adminList(request, 1, "");
    }

    @RequestMapping("/updateAdmin")
    public String updateAdmin(HttpServletRequest request, Admin para) throws IOException, ServletException {

        adminService.updateByPrimaryKeySelective(para);
        User user = userService.selectByPrimaryKey(para.getId());
        request.setAttribute("message", "修改成功！");
        return selfInfo(request);
    }

    @RequestMapping("/selfInfo")
    public String selfInfo(HttpServletRequest request) throws IOException, ServletException {

        Admin admin = (Admin)request.getSession().getAttribute("user");
        request.setAttribute("admin", admin);

        return "admin/selfInfo";

    }

    @RequestMapping("/userList")
    public String userList(HttpServletRequest request, @RequestParam(required=true,defaultValue="1") Integer pageNum
            , String keyword) throws IOException, ServletException {


        if(keyword != null){
            keyword = URLDecoder.decode(keyword, "utf-8");
        }

        List<User> ls = new ArrayList<User>();
        PageHelper.startPage(pageNum, 10);
        ls = userService.selectByKeyword(keyword);

        PageInfo<User> pageInfo =new PageInfo<User>(ls);


        request.setAttribute("page", pageInfo);
        request.setAttribute("list", ls);

        return "admin/userList";
    }

    @RequestMapping("/delUser")
    public String delUser(HttpServletRequest request, Integer id) throws IOException, ServletException {

        adminService.deleteUser(id);
        request.setAttribute("message", "删除成功！");
        return userList(request, 1, "");
    }

    @RequestMapping("/updateUser")
    public String updateUser(HttpServletRequest request, User para) throws IOException, ServletException {

        userService.updateByPrimaryKeySelective(para);
        User user = userService.selectByPrimaryKey(para.getId());
        request.setAttribute("message", "重置成功！");
        return userList(request,1,null);
    }

    @RequestMapping(value = "getPrivilegeById")
    public void getPrivilegeById(HttpServletResponse response, int id) throws UnsupportedEncodingException {
        PrintWriter pw = null;
        List<Integer> list = null;
        try {
            pw = response.getWriter();
            list = adminService.getPrivilegeById(id);
        } catch (IOException e) {
            e.printStackTrace();
        }
        JSONArray jsonObject = JSONArray.fromObject(list);
        pw.write(jsonObject.toString());
        pw.close();
        pw = null;
    }


    @RequestMapping("/quanxian")
    public String quanxian(HttpServletRequest request, int rId) throws IOException, ServletException {
        String pIds[] = request.getParameterValues("check");
        adminService.delRp(rId);
        for(int i = 0; i < pIds.length; i ++){
            try {

                int pid = Integer.parseInt(pIds[i]);
                adminService.addPower(rId, pid);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        request.setAttribute("message", "分配成功!");
        return adminList(request,1,null);
    }
}
