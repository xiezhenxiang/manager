<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/public.css" />
    <link rel="stylesheet" type="text/css" href="layer/skin/layer.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/public.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
</head>
<body id="bg">

<!-- 左边节点 -->
<div class="container">

    <div class="leftsidebar_box">

        <dl class="system_log">
            <dt>
                <img class="icon1" src="img/coin03.png" /><img class="icon2" src="img/coin04.png" /> 成果库
                <img class="icon3" src="img/coin19.png" /><img class="icon4" src="img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a class="cks" href="user/allResults" target="main">成果搜索</a><img class="icon5" src="img/coin21.png" />
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="img/coin01.png" /><img class="icon2" src="img/coin02.png" /> 通知公告
                <img class="icon3"src="img/coin19.png" /><img class="icon4" src="img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a href="user/noticeList" target="main" class="cks">公告列表</a><img class="icon5" src="img/coin21.png" />
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="img/coin07.png" /><img class="icon2"src="img/coin08.png" /> 我的成果
                <img class="icon3" src="img/coin19.png" /><img class="icon4" src="img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a href="addResultsJsp" target="main" class="cks">成果申报</a><img class="icon5" src="img/coin21.png" />
            </dd>
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a href="user/resultsList" target="main" class="cks">成果管理</a><img class="icon5" src="img/coin21.png" />
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="img/coin10.png" /><img class="icon2" src="img/coin09.png" /> 活动申报
                <img class="icon3" src="img/coin19.png" /><img class="icon4" src="img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a href="user/activityList" target="main" class="cks">活动列表</a><img class="icon5" src="img/coin21.png" />
            </dd>
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a class="cks" href="user/itemList" target="main">我的项目</a><img class="icon5" src="img/coin21.png" />
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="img/coin11.png" /><img class="icon2" src="img/coin12.png" /> 联系我们
                <img class="icon3" src="img/coin19.png" /><img class="icon4" src="img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a class="cks" href="contactJsp" target="main">联系方式</a><img class="icon5" src="img/coin21.png" />
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="img/coinL1.png" /><img class="icon2" src="img/coinL2.png" /> 系统管理
                <img class="icon3" src="img/coin19.png" /><img class="icon4" src="img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a href="user/selfInfo" target="main" class="cks">修改密码</a><img class="icon5" src="img/coin21.png" />
            </dd>
            <dd onclick="exit()">
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a class="cks">退出</a>
                <img class="icon5" src="img/coin21.png" />
            </dd>
        </dl>

    </div>

</div>

</body>

<
<script>
    function exit() {

        parent.location.href="/";
    }
</script>
</html>