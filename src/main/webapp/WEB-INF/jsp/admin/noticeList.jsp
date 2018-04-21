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
<!-- MainForm -->
<div id="MainForm" style="margin:0 auto;width:60%;margin-top:50px;">
    <div class="form_boxA">

        <table cellpadding="0" cellspacing="0">
            <tr>
                <th>序号</th>
                <th>公告标题</th>
                <th>发布时间</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${list}" var="bean" varStatus="index">
                <tr>
                    <td>${index.index + (page.pageNum - 1) * 10  + 1}</td>
                    <td><a href="admin/notice?id=${bean.id}">${bean.title}</a></td>
                    <td>${bean.pubTime}</td>
                    <td><a href="admin/delNotice?id=${bean.id}">删除</a></td>
                </tr>
            </c:forEach>

        </table>

    </div>

</div>

<ul id="PageNum">
    <li><a href="admin/noticeList?pageNum=${page.firstPage}">首页</a></li>
    <li><a href="admin/noticeList?pageNum=${page.prePage}">上一页</a></li>
    <c:forEach var="num" step="1" begin="1" end="${page.pages}">
        <li><a href="admin/noticeList?pageNum=${num}">${num}</a></li>
    </c:forEach>
    <li><a href="admin/noticeList?pageNum=${page.nextPage}">下一页</a></li>
    <li><a href="admin/noticeList?pageNum=${page.lastPage}">尾页</a></li>
</ul>

<div class="modal fade" id="ViewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:85%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">
                    成果详情
                </h4>
            </div>
            <div class="modal-body" style="margin-left: 45px">
                <div class="row">
                    <div class="col-md-10">
                        <div>
                            <br/>负责人：<span>${user.name}</span><br/>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div>
                            <br/>成果名称：<span id="name"></span><br/>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div>
                            <br/>成果类型：<span id="type"></span><br/>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div>
                            <br/>所属领域：<span id="domain"></span><br/>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div>
                            <br/>简单描述：<span id="description"></span><br/>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div>
                            <br/>开始时间：<span id="startTime"></span><br/>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div>
                            <br/>结束时间：<span id="endTime"></span><br/>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div>
                            <br/>申请金额：<span id="coin"></span><br/>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div>
                            <br/>研究成员：<span id="group"></span><br/>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div>
                            <br/>合作单位：<span id="unit"></span><br/>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div>
                            <br/>审核评语：<span id="comment"></span><br/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
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



</script>
</html>