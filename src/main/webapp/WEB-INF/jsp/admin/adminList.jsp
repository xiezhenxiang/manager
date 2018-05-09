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
    <h3 style="text-align: center;color: #FF6600;display: block;font-size: 1.17em;-webkit-margin-before: 1em;-webkit-margin-after: 1em;-webkit-margin-start: 0px;-webkit-margin-end: 0px;font-weight: bold;">
        ${notice.title}
    </h3>
</head>
<body onload="message()">

<div style="margin:0 auto;width:80%;margin-top:50px;">

    <div class="input-group" style="float:left;width:20%;">

        <input class="form-control" id="keyword">
        <span class="input-group-addon" id="basic-addon1" onclick="search()">搜索</span>&nbsp;&nbsp;
    </div>
    <div class="input-group" style="float:left;width:10%;">
        <span class="input-group-addon" id="basic-addon1" data-toggle="modal" data-target="#GlyModal">添加管理员</span>
    </div>

</div>

<!-- MainForm -->
<div id="MainForm" style="margin:0 auto;width:80%;">
    <div class="form_boxA">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th>序号</th>
                <th>姓名</th>
                <th>帐号</th>
                <th>联系方式</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${list}" var="bean" varStatus="index">
                <c:if test="${admin.id != bean.id}">
                <tr>
                    <td>${index.index + (page.pageNum - 1) * 10  + 1}</td>
                    <td>${bean.name}</td>
                    <td>${bean.account}</td>
                    <td>${bean.phone}</td>
                    <td><a href="admin/delAdmin?id=${bean.id}">删除</a> | <a data-toggle="modal" data-target="#GlyPrivilegeModal" onclick="quanxian('${bean.id}')"> 权限</a></td>
                </tr>
                </c:if>
            </c:forEach>

        </table>

    </div>

</div>

<ul id="PageNum">
    <li><a href="admin/adminList?pageNum=${page.firstPage}">首页</a></li>
    <li><a href="admin/adminList?pageNum=${page.prePage}">上一页</a></li>
    <c:forEach var="num" step="1" begin="1" end="${page.pages}">
        <li><a href="admin/adminList?pageNum=${num}">${num}</a></li>
    </c:forEach>
    <li><a href="admin/adminList?pageNum=${page.nextPage}">下一页</a></li>
    <li><a href="admin/adminList?pageNum=${page.lastPage}">尾页</a></li>
</ul>

<!-- 权限框 -->
<div class="modal fade" id="GlyPrivilegeModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">权限分配</h4>
            </div>
            <form action="admin/quanxian" method="post">
                <input type="hidden" name = "rId" id = "rId">
            <table class="table table-bordered table-striped" style="padding:20px">
                <tr>
                    <th><input type="checkbox" name="check" id="check1"
                               value="1" />&nbsp;&nbsp;公告发布</th>
                    <th><input type="checkbox" name="check" id="check2"
                               value="2" />&nbsp;&nbsp;成果审批</th>
                    <th><input type="checkbox" name="check" id="check3"
                               value="3" />&nbsp;&nbsp;项目审批</th>

                </tr>
                <tr>
                    <th><input type="checkbox" name="check" id="check4"
                               value="4" />&nbsp;&nbsp;活动添加</th>
                    <th><input type="checkbox" name="check" id="check5"
                               value="5" />&nbsp;&nbsp;用户管理</th>
                    <th><input type="checkbox" name="check" id="check6"
                               value="6" />&nbsp;&nbsp;公告编辑</th>
                </tr>
                <tr>
                    <th><input type="checkbox" name="check" id="check7"
                               value="9" />&nbsp;&nbsp;成果录入</th>
                    <th><input type="checkbox" name="check" id="check7"
                               value="7" />&nbsp;&nbsp;活动编辑</th>
                    <th><input type="checkbox" name="check" id="check8"
                               value="8" />&nbsp;&nbsp;权限管理</th>
                </tr>
            </table>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="submit" class="btn btn-primary" id="setPrivilege">设置</button>
            </div>
            </form>
        </div>
    </div>
</div>


<div class="modal fade" id="GlyModal" >
    <div class="modal-dialog" role="document">
        <div class="modal-content" style = "width:85%">

            <div class="page ">
                <!-- 会员注册页面样式 -->
                <div class="banneradd bor">
                    <div class="baTopNo">
                        <span>添加管理员</span>
                    </div>
                    <div class="baBody">
                        <form action="admin/addAdmin" method="post" onsubmit="return validation2();">
                            <div class="bbD">
                                账号：
                                <input type="text" class="input1" name="account" id="account" maxlength="18" placeholder="请输入账号" />
                            </div>
                            <div class="bbD">
                                密码：<input type="password" class="input1" name="pwd" id="pwd"
                                          placeholder="请输入密码" maxlength="25" />
                            </div>
                            <div class="bbD">
                                姓名：<input type="text" class="input1" name="name"
                                          id="name" placeholder="请输入姓名" maxlength="16" />
                            </div>
                            <div class="bbD">
                                电话：<input type="text" class="input1" name="phone"
                                          id="phone" maxlength="11" placeholder="请输入电话"/>
                            </div>
                            <div class="bbD">
                                <p class="bbDP">
                                    <button type="submit" class="btn_ok btn_yes" href="#">提交</button>
                                    <button type="button" class="btn_ok btn_no" data-dismiss="modal">取消</button>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- 会员注册页面样式end -->
            </div>
        </div>
    </div>
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

    function quanxian(id) {
        $.ajax({
            type : "POST",
            url : "admin/getPrivilegeById",
            data : {
                id : id
            },
            dataType : "json",
            success : function(data) {
                var str = data;
                for (var i = 1; i <= 8 ; i++) {
                    $("#check" + i).removeAttr(
                        "checked");
                }
                console.log(str);
                for (var i = 0; i < str.length; i++) {
                    var temp = "check" + str[i];
                    $("#" + temp).prop("checked", 'true');
                }
                document.getElementById("rId").value = id;
            },
            error : function(data) {
                layer.alert("出错了！");
            }

        });
    }

    function validation2(){
        var account = $("#account").val().trim();
        var pwd = $("#pwd").val().trim();
        var name = $("#name").val().trim();
        if(name == "" || account == "" || pwd == ""){
            layer.alert("请补全输入信息！")
            return false
        }
        return true;
    }

    function search() {
        var keyword = $("#keyword").val().trim();
        if(keyword != ""){
            window.location.href = encodeURI(encodeURI("admin/adminList?keyword=" + keyword));
        }

    }
</script>
</html>