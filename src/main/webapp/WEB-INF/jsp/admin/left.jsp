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
            <c:if test="${power9  != null}">
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a class="cks" href="aAddResultsJsp" target="main">成果录入</a><img class="icon5" src="img/coin21.png" />
            </dd>
            </c:if>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="img/coin01.png" /><img class="icon2" src="img/coin02.png" /> 公告管理
                <img class="icon3"src="img/coin19.png" /><img class="icon4" src="img/coin20.png" />
            </dt>
            <c:if test="${power1} == 1">
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a href="addNoticeJsp" target="main" class="cks">发布公告</a><img class="icon5" src="img/coin21.png" />
            </dd>
            </c:if>
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a href="admin/noticeList" target="main" class="cks">公告列表</a><img class="icon5" src="img/coin21.png" />
            </dd>

        </dl>
        <c:if test="${power2 != null or power3 != null}">
        <dl class="system_log">
            <dt>
                <img class="icon1" src="img/coin01.png" /><img class="icon2" src="img/coin02.png" /> 审批管理
                <img class="icon3"src="img/coin19.png" /><img class="icon4" src="img/coin20.png" />
            </dt>
            <c:if test="${power2 != null}">
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a href="admin/resultsList" target="main" class="cks">成果审批</a><img class="icon5" src="img/coin21.png" />
            </dd>
            </c:if>
            <c:if test="${power3  != null}">
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a href="admin/itemList" target="main" class="cks">项目审批</a><img class="icon5" src="img/coin21.png" />
            </dd>
            </c:if>
        </dl>
        </c:if>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="img/coin01.png" /><img class="icon2" src="img/coin02.png" /> 活动管理
                <img class="icon3"src="img/coin19.png" /><img class="icon4" src="img/coin20.png" />
            </dt>
            <c:if test="${power4  != null}">
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a href="addActivityJsp" target="main" class="cks">添加活动</a><img class="icon5" src="img/coin21.png" />
            </dd>
            </c:if>
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a href="admin/activityList" target="main" class="cks">活动列表</a><img class="icon5" src="img/coin21.png" />
            </dd>
        </dl>
        <c:if test="${power5  != null}">
        <dl class="system_log">

            <dt>
                <img class="icon1" src="img/coin01.png" /><img class="icon2" src="img/coin02.png" /> 用户管理
                <img class="icon3"src="img/coin19.png" /><img class="icon4" src="img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a href="admin/userList" target="main" class="cks">用户列表</a><img class="icon5" src="img/coin21.png" />
            </dd>
        </dl>
        </c:if>
        <c:if test="${power8  != null}">
        <dl class="system_log">
            <dt>
                <img class="icon1" src="img/coin01.png" /><img class="icon2" src="img/coin02.png" /> 权限管理
                <img class="icon3"src="img/coin19.png" /><img class="icon4" src="img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a href="admin/adminList" target="main" class="cks">权限分配</a><img class="icon5" src="img/coin21.png" />
            </dd>
        </dl>
        </c:if>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="img/coinL1.png" /><img class="icon2" src="img/coinL2.png" /> 系统管理
                <img class="icon3" src="img/coin19.png" /><img class="icon4" src="img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="img/coin111.png" /><img class="coin22" src="img/coin222.png" />
                <a href="admin/selfInfo" target="main" class="cks">修改密码</a><img class="icon5" src="img/coin21.png" />
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

<script>
    function exit() {

        parent.location.href="/";
    }
</script>
</html>