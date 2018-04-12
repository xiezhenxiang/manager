package com.manager.rest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manager.bean.Results;
import com.manager.bean.User;
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
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserApi {

    @Autowired
    private UserService userService;
    @Autowired
    private ResultsService resultsService;

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
        if(para.getName() != null && para.getName().trim().equals("")){
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



}
