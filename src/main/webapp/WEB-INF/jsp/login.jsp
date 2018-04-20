<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/public.css" />
    <link rel="stylesheet" type="text/css" href="css/page.css" />
    <link rel="stylesheet" type="text/css" href="css/css.css" />
    <link rel="stylesheet" type="text/css" href="layer/skin/layer.css">
    <link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/public.js"></script>
    <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
</head>
<body onload="message()">
<!-- 登录body -->
<div class="logDiv">
    <img class="logBanner" src="img/logBanner.png" />
    <div class="logGet">
        <!-- 头部提示信息 -->
        <div class="logD logDtip">
            <p class="p1">登录</p>
        </div>
        <form action="login" method="post" onsubmit="return validation2();">
        <!-- 输入框 -->
        <div class="lgD">
            <img class="img1" src="img/logName.png" /><input type="text" name="account" id = "account1"
                                                             placeholder="输入用户帐号" />
        </div>
        <div class="lgD">
            <img class="img1" src="img/logPwd.png" /><input type="password" name = "pwd" id = "name1"
                                                            placeholder="输入用户密码" />
        </div>
        <div class="lgD">
            <img class="img1" src="img/coin09.png" /><select name = "type" id = "type1">
            <option value="1" selected="selected">用  户</option>
            <option value="0">管 理 员</option>
        </select>
        </div>
        <div class="logC">
            <a class="logC" href="#" target="_self"><button type="submit">登 录</button></a>

            <a class="logR" href="#" data-toggle="modal" data-target="#GlyModal"><button>注 册</button></a>
        </div>
        </form>
    </div>
</div>
<!-- 登录body  end -->

<!-- 登录页面底部 -->
<div class="logFoot">
    <p class="p1">版权所有：郑州轻工业学院</p>
</div>
<!-- 登录页面底部end -->

<div class="modal fade" id="GlyModal" >
    <div class="modal-dialog" role="document">
        <div class="modal-content" style = "width:85%">

            <div class="page ">
                <!-- 会员注册页面样式 -->
                <div class="banneradd bor">
                    <div class="baTopNo">
                        <span>注册</span>
                    </div>
                    <div class="baBody">
                        <form action="regist" method="post" onsubmit="return validation();">
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
                                性别：<select class="input1" name="sex">
                                <option value="男" select="selected">男</option>
                                <option value="女">女</option>
                            </select>
                            </div>
                            <div class="bbD">
                                电话：<input type="text" class="input1" name="phone"
                                          id="phone" maxlength="11" placeholder="请输入电话"/>
                            </div>
                            <div class="bbD">
                                邮箱：<input type="text" class="input1" name="email" id="email"
                                          placeholder="请输入邮箱" maxlength="50" />
                            </div>
                            <div class="bbD">
                                单位：<input type="text" class="input1" name="unit" id="unit"
                                          placeholder="请输入单位" maxlength="16" />
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
<
<script>

    function message() {

        var message = "${message}";
        if(message != null && message != ""){
            layer.alert(message);
        }
    }

    function validation(){
        var account = $("#account").val().trim();
        var pwd = $("#pwd").val().trim();
        var name = $("#name").val().trim();
        var phone = $("#phone").val().trim();
        var email = $("#email").val().trim();
        var unit = $("#unit").val().trim();
        if(email == "" || account == "" || pwd == "" || name == "" || phone == "" || unit == ""){
            layer.alert("请补全输入信息！")
            return false
        }
        return true;
    }

    function validation2(){
        var account = $("#account1").val().trim();
        var pwd = $("#pwd1").val().trim();
        var type = $("#type1").val().trim();
        if(type == "" || account == "" || pwd == ""){
            layer.alert("请补全输入信息！")
            return false
        }
        return true;
    }
</script>
</html>