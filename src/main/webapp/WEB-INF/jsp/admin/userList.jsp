<%--suppress ALL --%>
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
    <link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="layer/skin/layer.css">
    <link rel="stylesheet" type="text/css" href="css/template/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/template/ionicons.min.css">
    <link rel="stylesheet" type="text/css" href="css/css.css" />
    <link href="css/haiersoft.css" rel="stylesheet" type="text/css" media="screen,print" />
    <link href="css/print.css" rel="stylesheet" type="text/css"  media="print" />
    <script src="js/jquery-1.10.1.min.js"></script>
    <script src="js/side.js" type="text/javascript"></script>
    <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <title></title>
</head>
<body onload="message()">

<div style="margin:0 auto;width:80%;margin-top:50px;">

    <div class="input-group" style="float:left;width:20%;">

        <input class="form-control" id="keyword">
        <span class="input-group-addon" id="basic-addon1" onclick="search()">搜索</span>
    </div>

</div>

<!-- MainForm -->
<div id="MainForm" style="margin:0 auto;width:80%;">
    <div class="form_boxA">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th>序号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>帐号</th>
                <th>联系方式</th>
                <th>邮箱</th>
                <th>单位</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${list}" var="bean" varStatus="index">
                <tr>
                    <td>${index.index + (page.pageNum - 1) * 10  + 1}</td>
                    <td>${bean.name}</td>
                    <td>${bean.sex}</td>
                    <td>${bean.account}</td>
                    <td>${bean.phone}</td>
                    <td>${bean.email}</td>
                    <td>${bean.unit}</td>
                    <td><a href="admin/delUser?id=${bean.id}">删除</a> | <a onclick="updatePwd('${bean.id}')">重置密码</a></td>
                </tr>
            </c:forEach>

        </table>

    </div>

</div>

<ul id="PageNum">
    <li><a href="admin/userList?pageNum=${page.firstPage}">首页</a></li>
    <li><a href="admin/userList?pageNum=${page.prePage}">上一页</a></li>
    <c:forEach var="num" step="1" begin="1" end="${page.pages}">
        <li><a href="admin/userList?pageNum=${num}">${num}</a></li>
    </c:forEach>
    <li><a href="admin/userList?pageNum=${page.nextPage}">下一页</a></li>
    <li><a href="admin/userList?pageNum=${page.lastPage}">尾页</a></li>
</ul>

</body>
<script>
    function message() {
        var message = "${message}";
        if(message != null && message != ""){
            layer.alert(message);
        }
    }



    function updatePwd(id) {

        var pwd = prompt("请输入新密码：", "");

        if(pwd != null && pwd != ""){
            window.location.href = "admin/updateUser?id=" + id + "&pwd=" + pwd;
        }
    }

    function search() {
        var keyword = $("#keyword").val().trim();
        if(keyword != ""){
            window.location.href = encodeURI(encodeURI("admin/userList?keyword=" + keyword));
        }

    }
</script>
</html>