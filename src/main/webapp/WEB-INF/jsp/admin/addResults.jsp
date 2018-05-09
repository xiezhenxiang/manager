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
                href="#">成果库</a>&nbsp;-</span>&nbsp;成果录入
        </div>
    </div>
    <div class="page ">

        <div class="banneradd bor">
            <div class="baTopNo">
                <span>成果录入</span>
            </div>
            <div class="baBody">
                <form action="admin/addResults" method="post" enctype="multipart/form-data" onsubmit="return validation()">
                    <div style="display: inline-block">
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;负责人：<input type="text"  name="charge" id="charge" class="input1"/>
                        </div>
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;成果名字：<input type="text" class="input1" name = "name" id="name"/>
                        </div>
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;成果类型：<select class="input1" name= "type" id="type">
                            <option value="理论成果" selected="selected">理论成果</option>
                            <option value="科技创新">科技创新</option>
                            <option value="科学成果">科学成果</option>
                        </select>
                        </div>
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;所属领域：<input type="text" class="input1" name = "domain" id="domain"/>
                        </div>

                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;简单描述：<input type="text" class="input1" name = "description" id="description"/>
                        </div>
                    </div>
                    <div style="display: inline-block">
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;开始时间：<input type="text" class="input1" name = "startTime" id="startTime"/>
                        </div>
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;结束时间：<input type="text" class="input1" name = "endTime" id="endTime"/>
                        </div>
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;申请金额：<input type="text" class="input1" name = "coin" id="coin"/>
                        </div>
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;研究成员：<input type="text" class="input1" name = "group" id="group"/>
                        </div>
                        <div class="bbD">
                            &nbsp;&nbsp;&nbsp;&nbsp;合作单位：<input type="text" class="input1" name = "unit" id="unit"/>
                        </div>

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
<
<script>

    function message() {
        var message = "${message}";
        if(message != null && message != ""){
            alert(message);
        }
    }

    //执行一个laydate实例
    laydate.render({
        elem: '#startTime'//指定元素
    });
    laydate.render({
        elem: '#endTime'//指定元素
    });

    function validation() {
        var name = $("#name").val().trim();
        var charge = $("#charge").val().trim();
        var type = $("#type").val().trim();
        var domain = $("#domain").val().trim();
        var description = $("#description").val().trim();
        var startTime = $("#startTime").val().trim();
        var endTime = $("#endTime").val().trim();
        var coin = $("#coin").val().trim();
        var group = $("#group").val().trim();
        var unit = $("#unit").val().trim();
        var path = $("#file").val() + "";

        if(name == "" || charge == "" || type == "" || domain == "" || description == "" || startTime == "" || endTime == "" || coin == "" || group == "" || unit == ""){
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