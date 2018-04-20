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

    <style>

        body {
            background: #f7f7f7;
            font-family: "微软雅黑", "Microsoft Yahei", Arial, Helvetica, sans-serif, "宋体";
            font-size: 14px;
            color: #515151;
            margin: 0;
            padding: 0;
            height: auto;
        }
        .left-half, .right-half {
            width: 50%;
            float: left;
        }
        .section-content-1 {
            background: #f7f7f7;
        }
        .clearfix {
            overflow: hidden;
        }
        .section-content-1 p {
            padding-left: 80px;
        }
        .content p {
            font-size: 16px;
            color: #666;
            line-height: 30px;
            padding-left: 30px;
            position: relative;
            display: inline-block;
        }
        .content img {
            display: block;
        }
    </style>
</head>
<body onload="message()">
<div id="pageAll">
    <div class="pageTop">
        <div class="page">
            <img src="img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
                href="#">联系我们</a>&nbsp;-</span>&nbsp;联系方式
        </div>
    </div>
    <div class="page ">

        <div class="banneradd bor">
            <div class="baTopNo">
                <span>联系我们：</span>
            </div>
            <div class="baBody">
                <div class="content">
                    <div class="section-content-1 clearfix">
                        <div class="left-half">
                            <h3>联系方式</h3>
                            <p><span>机构：</span>郑州轻工业学院<br>
                                http://www.zzuli.edu.cn/</p><br/><br/><br/>
                            <p><span>地址：</span>河南省郑州市高新区科学大道136号<br>
                                No. 136 science Avenue, Zhengzhou high tech Zone, Henan<br>
                                Made In China</p><br/><br/><br/>

                            <h4>客服</h4>
                            <p>24小时热线：0371-788-3333<br>
                                Email：<a href="mailto:MZ_KF@meizu.com">CGManage@KC.com</a></p>

                        </div>
                        <div class="right-half">
                            <img src="img/map.png" alt="">
                        </div>
                    </div>
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
            alert(message);
        }
    }

</script>
</html>