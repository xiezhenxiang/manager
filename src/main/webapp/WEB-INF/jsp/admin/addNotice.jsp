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
                href="#">公告管理</a>&nbsp;-</span>&nbsp;添加公告
        </div>
    </div>
    <div class="page ">

        <div class="banneradd bor">
            <div class="baTopNo">
                <span>发布公告</span>
            </div>
            <div class="baBody">
                <form action="admin/addNotice" method="post" enctype="multipart/form-data" onsubmit="return validation()">
                    <div style="display: inline-block">
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公告标题：<input type="text" name="title" id="title" class="input1" style="width: 630px">
                        </div>
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公告内容：<br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="content" rows="20" id="content" style="width: 630px;margin-left:68px"></textarea>
                        </div>
                        <div class="bbD">
                            <p class="bbDP">
                                <button class="btn_ok" style="margin-left: 330px" type="submit">发布</button>
                            </p>
                        </div>

                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

</body>
<
<script>

    function message() {
        var message = "${message}";
        if(message != null && message != ""){
            alert(message);
        }
    }

    function validation() {
        var title = $("#title").val().trim();
        var content = $("#content").val().trim();


        if(title == "" || content == ""){
            layer.alert("请补全输入信息！");
            return false;
        }
        return true;
    }
</script>

</html>