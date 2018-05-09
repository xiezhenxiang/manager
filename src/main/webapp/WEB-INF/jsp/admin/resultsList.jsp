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
        <h2>成果列表</h2>

        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">成果名称</span>
            <input class="form-control" placeholder="请输入成果名称" id="cname">
            <span class="input-group-addon" id="basic-addon2">成果类型</span>
            <select class="form-control" id="ctype">
                <option value="-1" selected="selected">全部</option>
                <option value="理论成果">理论成果</option>
                <option value="科技创新">科技创新</option>
                <option value="科学成果">科学成果</option>
            </select>
            <span class="input-group-addon" id="basic-addon3">时间</span>
            <input class="form-control" onclick="laydate()" id="ctime">
            <span class="input-group-btn">
                <button class="btn btn-primary" type="button" onclick="query()">查询</button>
            </span>
        </div>

        <table cellpadding="0" cellspacing="0">
            <tr>
                <th>序号</th>
                <th>成果名称</th>
                <th>类型</th>
                <th>领域</th>
                <th>开始时间</th>
                <th>合作单位</th>
                <th>材料附件</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${list}" var="bean" varStatus="index">
                <c:if test="${bean.check eq 0}"><tr></c:if>
                <c:if test="${bean.check eq 1}"><tr class="bgcA"></c:if>
                <c:if test="${bean.check eq 2}"><tr class="bgcB"></c:if>
                    <td>${index.index + (page.pageNum - 1) * 10  + 1}</td>
                    <td>${bean.name}</td>
                    <td>${bean.type}</td>
                    <td>${bean.domain}</td>
                    <td>${bean.startTime}</td>
                    <td>${bean.unit}</td>
                    <c:if test="${empty bean.filePath or bean.filePath eq ''}">
                        <td>无</td>
                    </c:if>
                    <c:if test="${not empty bean.filePath and bean.filePath ne ''}">
                        <td><a href="user/uploadFile?filePath=${bean.filePath}">附件下载</a></td>
                    </c:if>
                    <td><a href="#" data-toggle="modal" data-target="#ViewModal" onclick="view('${bean.id}')">查看</a>
                        | <a data-toggle="modal" data-target="#checkModal" onclick="changeId('${bean.id}')">审核</a>
                    </td>
                </tr>

            </c:forEach>

        </table>

    </div>

</div>

    <ul id="PageNum">
        <li><a href="admin/resultsList?pageNum=${page.firstPage}">首页</a></li>
        <li><a href="admin/resultsList?pageNum=${page.prePage}">上一页</a></li>
        <c:forEach var="num" step="1" begin="1" end="${page.pages}">
            <li><a href="admin/resultsList?pageNum=${num}">${num}</a></li>
        </c:forEach>
        <li><a href="admin/resultsList?pageNum=${page.nextPage}">下一页</a></li>
        <li><a href="admin/resultsList?pageNum=${page.lastPage}">尾页</a></li>
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
                            <br/>负责人：<span id="charge"></span><br/>
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
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style = "width:70%">

            <div class="page ">

                <div class="banneradd bor">
                    <div class="baTopNo">
                        <span>&nbsp;&nbsp;审核：</span>
                    </div>
                    <div class="baBody" style="margin-left:50px">

                        <div class="bbD">
                            <select class="input1" id="check">
                            <option value="1" select="selected">通过</option>
                            <option value="2">不通过</option>
                        </select>
                        </div><br/>
                        <b>评语：</b>
                        <div class="bbD" style="margin-top: 0px">
                             <textarea rows="5" style="width:300px;" id="comment"></textarea>
                        </div>
                    </div><br/>
                    <div class="modal-footer">
                        <center><button type="button" class="btn btn-warning" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="check()">确定</button></center>
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
            layer.alert(message);
        }
    }

    function view(id) {

        $.ajax({
            type: "POST",
            url: "user/getResultsById",
            data: {
                id: id
            },
            dataType: "json",
            success: function(data){
                console.log(data);
                $("#name").text(data.name);
                $("#type").text(data.type);
                $("#charge").text(data.charge);
                $("#domain").text(data.domain);
                $("#description").text(data.description);
                $("#startTime").text(data.startTime);
                $("#endTime").text(data.endTime);
                $("#coin").text(data.coin);
                $("#unit").text(data.unit);
                $("#group").text(data.group);
            },
            error:function () {
                layer.alert("error!");
            }

        })
    }



    function query(){
        var type = $("#ctype").val();
        var name = $("#cname").val();
        var time = $("#ctime").val();
        var url = encodeURI(encodeURI("admin/resultsList?type=" + type + "&name=" + name + "&startTime=" + time));
        window.location.href = url;

    }

    laydate.render({
        elem: '#ctime'//指定元素
    });

    var rid = 0;
    function changeId(id) {
        rid = id;
    }

    function check() {

        if(rid > 0){
            var check = $("#check").val();
            var comment = $("#comment").val();
            var url = encodeURI(encodeURI("admin/checkResults?check=" + check + "&comment=" + comment + "&id=" + rid));
            window.location.href=url;
        }
    }
</script>
</html>