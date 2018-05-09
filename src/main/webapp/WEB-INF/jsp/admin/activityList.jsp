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
    <style type="text/css" media=print>
        .noprint{display : none }
    </style>
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
            <input class="form-control"  id="ctime">
            <span class="input-group-addon">活动状态</span>
            <select class="form-control" id="cstate">
                <option value="-1" selected="selected">全部</option>
                <option value="未开始">未开始</option>
                <option value="进行中">进行中</option>
                <option value="已结束">已结束</option>
            </select>
            <span class="input-group-btn">
                <button class="btn btn-primary" type="button" onclick="query()">查询</button>
            </span>
        </div>
        <div id="con">
        <table cellpadding="0" cellspacing="0">
            <tr class="noprint">
                <th>序号</th>
                <th>活动名称</th>
                <th>活动类型</th>
                <th>活动详情</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>申报人数</th>
                <th>附件</th>
                <th>活动状态</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${list}" var="bean" varStatus="index">
                <tr>
                    <td>${index.index + (page.pageNum - 1) * 10  + 1}</td>
                    <td>${bean.name}</td>
                    <td>${bean.type}</td>
                    <td><a href="admin/activity?id=${bean.id}&type=0">${bean.description}</a></td>
                    <td>${bean.startTime}</td>
                    <td>${bean.endTime}</td>
                    <td>${bean.applyCount}</td>
                    <c:if test="${empty bean.filePath or bean.filePath eq ''}">
                        <td>无</td>
                    </c:if>
                    <c:if test="${not empty bean.filePath and bean.filePath ne ''}">
                        <td><a href="user/uploadFile?filePath=${bean.filePath}">附件下载</a></td>
                    </c:if>
                    <td>${bean.state}</td>
                    <td>
                        <c:if test="${power7  != null}">
                        <a data-toggle="modal" data-target="#updateModal" onclick="update('${bean.id}')">修改</a>| <a href="admin/delActivity?id=${bean.id}">删除</a>
                        </c:if>
                        <c:if test="${power7  == null}">
                            无权限
                        </c:if>
                    </td>
                </tr>

            </c:forEach>

        </table>
        </div>
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


<div class="modal fade" id="updateModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 130%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">活动修改</h4>
            </div>


            <form action="admin/addActivity" method="post" enctype="multipart/form-data" onsubmit="return validation()">
                <div style="display: inline-block">
                    <<input type="hidden" name="id" id="aId">
                    <div class="bbD">
                        &nbsp;&nbsp;&nbsp;&nbsp;活动类型：<select class="input1" name= "type" id="type">
                        <option value="综合" selected="selected">综合</option>
                        <option value="理论成果">理论成果</option>
                        <option value="科技创新">科技创新</option>
                        <option value="科学成果">科学成果</option>
                    </select>
                    </div>
                    <div class="bbD">
                        &nbsp;&nbsp;&nbsp;&nbsp;活动名称：<input type="text" class="input1" name = "name" id="name"/>
                    </div>


                </div>
                <div style="display: inline-block">
                    <div class="bbD">
                        &nbsp;&nbsp;&nbsp;&nbsp;开始时间：<input type="text" class="input1" name = "startTime" id="startTime" />
                    </div>
                    <div class="bbD">
                        &nbsp;&nbsp;&nbsp;&nbsp;结束时间：<input type="text" class="input1" name = "endTime" id="endTime" />
                    </div>

                </div>
                <br/>&nbsp;&nbsp;&nbsp;&nbsp;活动详情：
                <div class="bbD">
                    &nbsp;&nbsp;&nbsp;&nbsp;<textarea name="description" id="description" rows="10" style="width: 695px;margin-left:68px"></textarea>
                </div>
                <div class="bbD">
                    &nbsp;&nbsp;&nbsp;&nbsp;材料附件：<input type="file" name = "file" id="file"/>
                </div>
                <div class="bbD">
                    <p class="bbDP" style="margin-left: 330px">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button><button class="btn btn-primary"  type="submit">提交</button>
                    </p>
                </div>
            </form>
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

    //执行一个laydate实例
    laydate.render({
        elem: '#startTime'//指定元素
    });
    laydate.render({
        elem: '#endTime'//指定元素
    });
    laydate.render({
        elem: '#ctime'//指定元素
    });
    function  update(aId) {

        $.ajax({
           url: "admin/getActivity",
           type: "post",
           data: {id: aId},
           dataType: "json",
            success: function(data){
                console.log(data);
                $("#aId").val(data.id);
                $("#name").val(data.name);
                $("#startTime").val(data.startTime);
                $("#endTime").val(data.endTime);
                $("#description").val(data.description);
            },
            error:function(){
            }
        });
    }

    function query(){
        var type = $("#ctype").val().trim();
        var name = $("#cname").val().trim();
        var time = $("#ctime").val().trim();
        var state = $("#cstate").val().trim();
        var url = encodeURI(encodeURI("admin/activityList?type=" + type + "&name=" + name + "&startTime=" + time + "&state=" + state));
        window.location.href = url;

    }


    function validation() {
        var name = $("#name").val().trim();
        var description = $("#description").val().trim();
        var startTime = $("#startTime").val().trim();
        var endTime = $("#endTime").val().trim();
        var path = $("#file").val() + "";

        if(name == "" || description == "" || startTime == "" || endTime == ""){
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