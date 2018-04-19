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
                <th>开始时间</th>
                <th>结束时间</th>
                <th>附件</th>
                <th>状态</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${list}" var="bean" varStatus="index">
                <c:if test="${bean.status eq '已申报'}"><tr class="bgcA"></c:if>
                <c:if test="${bean.status eq '未申报'}"><tr></c:if>
                    <td>${index.index + (page.pageNum - 1) * 10  + 1}</td>
                    <td>${bean.name}</td>
                    <td>${bean.type}</td>
                    <td>${bean.startTime}</td>
                    <td>${bean.endTime}</td>
                    <c:if test="${empty bean.filePath or bean.filePath eq ''}">
                        <td>无</td>
                    </c:if>
                    <c:if test="${not empty bean.filePath and bean.filePath ne ''}">
                        <td><a href="user/uploadFile?filePath=${bean.filePath}">附件下载</a></td>
                    </c:if>
                    <td>${bean.status}</td>
                    <td><a href="#" data-toggle="modal" data-target="#ViewModal" onclick="view('${bean.id}')">详情</a>
                        | <a onclick="apply('${bean.id}', '${bean.name}', '${bean.type}','${bean.status}')">申报</a> | <a onclick="cancelApply('${bean.id}', '${bean.status}')">取消申报</a>
                </tr>

            </c:forEach>

        </table>

    </div>

</div>

<ul id="PageNum">
    <li><a href="user/activityList?pageNum=${page.firstPage}">首页</a></li>
    <li><a href="user/activityList?pageNum=${page.prePage}">上一页</a></li>
    <c:forEach var="num" step="1" begin="1" end="${page.pages}">
        <li><a href="user/activityList?pageNum=${num}">${num}</a></li>
    </c:forEach>
    <li><a href="user/activityList?pageNum=${page.nextPage}">下一页</a></li>
    <li><a href="user/activityList?pageNum=${page.lastPage}">尾页</a></li>
</ul>


<div class="modal fade" id="ViewModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:85%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">
                    活动详情
                </h4>
            </div>
            <div class="modal-body" style="margin-left: 45px">
                <div class="row">
                    <div class="col-md-10">
                        <div>
                            <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="description"></span><br/>
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

<div class="modal fade" id="SbModal" >
    <div class="modal-dialog" role="document" style = "width:900px;">
        <div class="modal-content">

            <div class="page ">
                <div class="banneradd bor">
                    <div class="baTopNo">
                        <span>项目申报</span>
                    </div>

                    <div class="baBody" style="margin-left:50px">
                        <form action="user/addItem" method="post" enctype="multipart/form-data" onsubmit="return validation()">
                            <input type="hidden" name="activityId" id="ractivityId">
                            <div style="display: inline-block">
                                <div class="bbD">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;负责人：<input type="text"  class="input1" value="${user.name}" readonly/>
                                </div>
                                <div class="bbD">
                                    &nbsp;&nbsp;&nbsp;&nbsp;项目名称：<input type="text" class="input1" name = "name" id="rname"/>
                                </div>
                                <div class="bbD">
                                    &nbsp;&nbsp;&nbsp;&nbsp;项目类型：<select class="input1" name= "type" id="rtype">
                                    <option id="理论成果" value="理论成果">理论成果</option>
                                    <option id="科技创新" value="科技创新">科技创新</option>
                                    <option id="科学成果" value="科学成果">科学成果</option>
                                </select>
                                </div>
                                <div class="bbD">
                                    &nbsp;&nbsp;&nbsp;&nbsp;所属领域：<input type="text" class="input1" name = "domain" id="rdomain"/>
                                </div>

                                <div class="bbD">
                                    &nbsp;&nbsp;&nbsp;&nbsp;简单描述：<input type="text" class="input1" name = "description" id="rdescription"/>
                                </div>
                            </div>
                            <div style="display: inline-block">
                                <div class="bbD">
                                    &nbsp;&nbsp;&nbsp;&nbsp;开始时间：<input type="text" class="input1" name = "startTime" id="rstartTime" onclick="laydate()"/>
                                </div>
                                <div class="bbD">
                                    &nbsp;&nbsp;&nbsp;&nbsp;结束时间：<input type="text" class="input1" name = "endTime" id="rendTime" onclick="laydate()"/>
                                </div>
                                <div class="bbD">
                                    &nbsp;&nbsp;&nbsp;&nbsp;申请金额：<input type="text" class="input1" name = "coin" id="rcoin"/>
                                </div>
                                <div class="bbD">
                                    &nbsp;&nbsp;&nbsp;&nbsp;研究成员：<input type="text" class="input1" name = "group" id="rgroup"/>
                                </div>
                                <div class="bbD">
                                    &nbsp;&nbsp;&nbsp;&nbsp;合作单位：<input type="text" class="input1" name = "unit" id="runit"/>
                                </div>
                            </div>
                            <div class="bbD">
                                &nbsp;&nbsp;&nbsp;&nbsp;材料附件：<center><input type="file" name = "file" id="rfile"/></center>
                            </div>
                            <div class="bbD">
                                <p class="bbDP" style="margin-left: 680px">
                                    <button class="btn btn-success" type="submit">申报</button>
                                    <button type="button" class="btn btn-warning" data-dismiss="modal">取消</button><br/><br/>
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

    function view(id) {

        $.ajax({

            type: "POST",
            url: "user/getActivityById",
            data: {
                id: id
            },
            dataType: "json",
            success: function(data){
                console.log(data);
                $("#description").text(data.description);
            },
            error:function () {
                layer.alert("error!");
            }

        })
    }

    function apply(id, name, type, status) {

        if(status == "已申报"){
            layer.alert("你已申报该活动，请勿重复操作！");
            return;
        }

        $("#ractivityId").val(id);

        if(type == "综合"){
            $("#rtype").removeAttr("disabled");
            $("#rtype").val("理论成果");
        }else{
            $("#rtype").val(type);
            $("#rtype").attr("disabled", true);
        }

        $("#SbModal").modal("show");
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

    function cancelApply(id, status) {

        if(status == "未申报"){
            layer.alert("你未申报此项目！");
            return;
        }

        layer.confirm('确定取消申报该活动吗？', {
                btn: ['确定','取消'] //按钮
            }, function(){
                window.location.href = "user/cancelApply?activityId=" + id;
            }, function(){
                layer.close();
            }
        );
    }
</script>
</html>