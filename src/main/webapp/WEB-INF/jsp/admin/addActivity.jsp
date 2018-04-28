<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/css.css" />
    <link rel="stylesheet" type="text/css" href="layer/skin/layer.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <script src="js/laydate/laydate.js"></script>
    <title></title>
</head>
<body onload="message()">
<div id="pageAll">
    <div class="pageTop">
        <div class="page">
            <img src="img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
                href="#">活动管理</a>&nbsp;-</span>&nbsp;发布活动
        </div>
    </div>
    <div class="page ">

        <div class="banneradd bor">
            <div class="baTopNo">
                <span>活动发布</span>
            </div>
            <div class="baBody">
                <form action="admin/addActivity" method="post" enctype="multipart/form-data" onsubmit="return validation()">
                    <div style="display: inline-block">

                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;活动类型：<select class="input1" name= "type" id="type">
                            <option value="综合" selected="selected">综合</option>
                            <option value="理论成果">理论成果</option>
                            <option value="科技创新">科技创新</option>
                            <option value="科学成果">科学成果</option>
                        </select>
                        </div>
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;活动名称：<input type="text" class="input1" name = "name" id="name"/>
                        </div>


                    </div>
                    <div style="display: inline-block">
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;开始时间：<input type="text" class="input1" name = "startTime" id="startTime" onclick="laydate()"/>
                        </div>
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;结束时间：<input type="text" class="input1" name = "endTime" id="endTime" onclick="laydate()"/>
                        </div>

                    </div>
                    <br/>&nbsp;&nbsp;&nbsp;&nbsp;活动详情：
                    <div class="bbD">
                        &nbsp;&nbsp;&nbsp;&nbsp;<textarea name="description" id="description" rows="15" style="width: 695px;margin-left:68px"></textarea>
                    </div>
                    <div class="bbD">
                        &nbsp;&nbsp;&nbsp;&nbsp;材料附件：<input type="file" name = "file" id="file"/>
                    </div>
                    <div class="bbD">
                        <p class="bbDP">
                            <button class="btn_ok" style="margin-left: 330px" type="submit">提交</button>
                        </p>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

</body>

<script>

    function message() {
        var message = "${message}";
        if(message != null && message != ""){
            alert(message);
        }
    }

    function validation() {
        var name = $("#name").val().trim();
        var description = $("#description").val().trim();
        var startTime = $("#startTime").val().trim();
        var endTime = $("#endTime").val().trim();
        var path = $("#file").val() + "";

        if(name == "" || description == "" || startTime == "" || endTime == ""){
            layer.alert("请补全输入信息！");
            return false;
        }else if(path != "" && path.substring(path.lastIndexOf(".") + 1) != "rar" && path.substring(path.lastIndexOf(".") + 1) != "zip"){
            layer.alert("仅支持rar或zip格式材料上传，请压缩文件后重试！");
            return false;
        }
        return true;
    }

</script>

</html>