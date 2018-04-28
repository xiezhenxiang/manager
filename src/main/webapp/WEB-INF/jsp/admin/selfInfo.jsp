<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
    <title></title>
</head>
<body onload="message()">
<div id="pageAll">
    <div class="pageTop">
        <div class="page">
            <img src="img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
                href="#">系统管理</a>&nbsp;-</span>&nbsp;修改密码
        </div>
    </div>
    <div class="page ">
        <!-- 修改密码页面样式 -->
        <div class="bacen">
            <form action="admin/updateAdmin" method="post" onsubmit="return validation()">
                <input type="hidden" value="${admin.id}" name="id">
                <div class="bbD">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户UID：&nbsp;&nbsp;&nbsp;&nbsp;${admin.id}</div>
                <div class="bbD">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名：&nbsp;&nbsp;&nbsp;&nbsp;${admin.name}</div>
                <div class="bbD">
                    &nbsp;&nbsp;&nbsp;&nbsp;输入原密码：<input type="password" class="input3" id="pwd1" />
                </div>
                <div class="bbD">
                    &nbsp;&nbsp;&nbsp;&nbsp;输入新密码：<input type="password" class="input3" id="pwd2"/>
                </div>
                <div class="bbD">
                    &nbsp;&nbsp;&nbsp;&nbsp;确认新密码：<input type="password" class="input3" name="pwd" id="pwd3"/>
                </div>
                <div class="bbD">
                    <p class="bbDP">
                        <button class="btn_ok btn_yes" type="submit">提交</button>
                    </p>
                </div>
            </form>
        </div>

        <!-- 修改密码页面样式end -->
    </div>
</div>
</body>

<script>

    function message() {
        var message = "${message}";
        if(message != null && message != ""){
            layer.alert(message);
        }
    }

    function validation() {
        var pwd = "${admin.pwd}";
        var pwd1 = $("#pwd1").val().trim();
        var pwd2 = $("#pwd2").val().trim();
        var pwd3 = $("#pwd3").val().trim();

        if(pwd1 == "" || pwd2 == "" || pwd3 == ""){
            layer.alert("请补全输入信息！");
            return false;
        }else if(pwd1 != pwd){
            layer.alert("原密码错误！");
            return false;
        }else if(pwd2 != pwd3){
            layer.alert("新密码输入不一致！");
            return false;
        }
        return true;
    }

</script>
</html>