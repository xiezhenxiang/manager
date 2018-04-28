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
    <script src="js/laydate/laydate.js"></script>
    <title></title>

</head>
<body onload="message()">
<!-- MainForm -->
<div id="MainForm">
    <div class="form_boxA">
        <h2>我的成果列表</h2>

        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">活动名称</span>
            <input class="form-control" placeholder="请输入活动名称" id="cname">
            <span class="input-group-addon" id="basic-addon2">活动类型</span>
            <select class="form-control" id="ctype">
                <option value="-1" selected="selected">全部</option>
                <option value="综合">综合</option>
                <option value="理论成果">理论成果</option>
                <option value="科技创新">科技创新</option>
                <option value="科学成果">科学成果</option>
            </select>
            <span class="input-group-addon" id="basic-addon3">活动时间</span>
            <input class="form-control" placeholder="请选择活动时间" id="ctime" onclick="laydate()">
            <span class="input-group-btn">
                <button class="btn btn-primary" type="button" onclick="query()">查询</button>
            </span>
        </div>

        <table cellpadding="0" cellspacing="0">
            <tr>
                <th>序号</th>
                <th>活动名称</th>
                <th>活动类型</th>
                <th>活动详情</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>申报人数</th>
                <th>附件</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${list}" var="bean" varStatus="index">
                <tr>
                    <td>${index.index + (page.pageNum - 1) * 10  + 1}</td>
                    <td>${bean.name}</td>
                    <td>${bean.type}</td>
                    <td><a href="admin/activity?id=${bean.id}">${bean.description}</a></td>
                    <td>${bean.startTime}</td>
                    <td>${bean.endTime}</td>
                    <td>${bean.applyCount}</td>
                    <c:if test="${empty bean.filePath or bean.filePath eq ''}">
                        <td>无</td>
                    </c:if>
                    <c:if test="${not empty bean.filePath and bean.filePath ne ''}">
                        <td><a href="user/uploadFile?filePath=${bean.filePath}">附件下载</a></td>
                    </c:if>
                    <td><a>修改</a> | <a>删除</a></td>
                </tr>

            </c:forEach>

        </table>

    </div>

</div>

<ul id="PageNum">
    <li><a href="admin/activityList?pageNum=${page.firstPage}">首页</a></li>
    <li><a href="admin/activityList?pageNum=${page.prePage}">上一页</a></li>
    <c:forEach var="num" step="1" begin="1" end="${page.pages}">
        <li><a href="admin/activityList?pageNum=${num}">${num}</a></li>
    </c:forEach>
    <li><a href="admin/activityList?pageNum=${page.nextPage}">下一页</a></li>
    <li><a href="admin/activityList?pageNum=${page.lastPage}">尾页</a></li>
</ul>

</body>
<script>
    function message() {
        var message = "${message}";
        if(message != null && message != ""){
            layer.alert(message);
        }
    }

    function query(){
        var type = $("#ctype").val().trim();
        var name = $("#cname").val().trim();
        var time = $("#ctime").val().trim();
        var url = encodeURI(encodeURI("user/activityList?type=" + type + "&name=" + name + "&startTime=" + time));
        window.location.href = url;

    }




    function validation() {
        var name = $("#rname").val().trim();
        var type = $("#rtype").val().trim();
        var domain = $("#rdomain").val().trim();
        var description = $("#rdescription").val().trim();
        var startTime = $("#rstartTime").val().trim();
        var endTime = $("#rendTime").val().trim();
        var coin = $("#rcoin").val().trim();
        var group = $("#rgroup").val().trim();
        var unit = $("#runit").val().trim();
        var path = $("#rfile").val() + "";

        if(name == "" || type == "" || domain == "" || description == "" || startTime == "" || endTime == "" || coin == "" || group == "" || unit == ""){
            layer.alert("请补全输入信息！");
            return false;
        }else if(path != "" && path.substring(path.lastIndexOf(".") + 1) != "rar" && path.substring(path.lastIndexOf(".") + 1) != "zip"){
            layer.alert("仅支持rar或zip格式材料上传，请压缩文件后重试！");
            return false;
        }
        return true;
    }

    function query(){
        var type = $("#ctype").val().trim();
        var name = $("#cname").val().trim();
        var time = $("#ctime").val().trim();
        var url = encodeURI(encodeURI("user/activityList?type=" + type + "&name=" + name + "&startTime=" +time));
        window.location.href = url;

    }

</script>
</html>