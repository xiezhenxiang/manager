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

</head>
<body onload="message()">
<!-- MainForm -->
<div id="MainForm">
    <div class="form_boxA">
        <h2>我的项目列表</h2>

        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">项目名称</span>
            <input class="form-control" placeholder="请输入项目名称" id="cname">
            <span class="input-group-addon" id="basic-addon2">项目类型</span>
            <select class="form-control" id="ctype">
                <option value="-1" selected="selected">全部</option>
                <option value="理论成果">理论成果</option>
                <option value="科技创新">科技创新</option>
                <option value="科学成果">科学成果</option>
            </select>
            <span class="input-group-addon" id="basic-addon3">审核状态</span>
            <select name="type" class="form-control" id="ccheck">
                <option value="-1" selected="selected">全部</option>
                <option value="0">未审核</option>
                <option value="1">同意立项</option>
                <option value="2">不同意立项</option>
                <option value="3">同意结项</option>
                <option value="4">不同意结项</option>

            </select>
            <span class="input-group-btn">
                <button class="btn btn-primary" type="button" onclick="query()">查询</button>
            </span>
        </div>


        <table cellpadding="0" cellspacing="0">
            <tr>
                <th>序号</th>
                <th>项目名称</th>
                <th>项目类型</th>
                <th>领域</th>
                <th>开始时间</th>
                <th>合作单位</th>
                <th>立项材料</th>
                <th>结项材料</th>
                <th>状态</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${list}" var="bean" varStatus="index">
                <c:if test="${bean.check eq 0}"><tr></c:if>
                <c:if test="${bean.check eq 1 or bean.check eq 3}"><tr class="bgcA"></c:if>
                <c:if test="${bean.check eq 2 or bean.check eq 4}"><tr class="bgcB"></c:if>
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
                    <td><a href="user/uploadFile?filePath=${bean.filePath}">立项材料</a></td>
                </c:if>
                <c:if test="${empty bean.filePath2 or bean.filePath2 eq ''}">
                    <td>无</td>
                </c:if>
                <c:if test="${not empty bean.filePath2 and bean.filePath2 ne ''}">
                    <td><a href="user/uploadFile?filePath=${bean.filePath2}">结项材料</a></td>
                </c:if>
                <c:if test="${bean.check eq 0}">
                    <td>未审核</td>
                </c:if>
                <c:if test="${bean.check eq 1}">
                    <td>同意立项</td>
                </c:if>
                <c:if test="${bean.check eq 2}">
                    <td>不同意立项</td>
                </c:if>
                <c:if test="${bean.check eq 3}">
                    <td>同意结项</td>
                </c:if>
                <c:if test="${bean.check eq 4}">
                    <td>不同意结项</td>
                </c:if>
                <td><a href="#" data-toggle="modal" data-target="#ViewModal" onclick="view('${bean.id}')">查看</a>
                    | <a onclick="changeId('${bean.id}', '${bean.check}')">修改</a>
                    |<a onclick="del('${bean.id}')">删除</a></td>
                </tr>

            </c:forEach>

        </table>

    </div>

</div>

<ul id="PageNum">
    <li><a href="user/itemList?pageNum=${page.firstPage}">首页</a></li>
    <li><a href="user/itemList?pageNum=${page.prePage}">上一页</a></li>
    <c:forEach var="num" step="1" begin="1" end="${page.pages}">
        <li><a href="user/itemList?pageNum=${num}">${num}</a></li>
    </c:forEach>
    <li><a href="user/itemList?pageNum=${page.nextPage}">下一页</a></li>
    <li><a href="user/itemList?pageNum=${page.lastPage}">尾页</a></li>
</ul>

<div class="modal fade" id="ViewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:85%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">
                    项目详情
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
                            <br/>项目名称：<span id="name"></span><br/>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div>
                            <br/>项目类型：<span id="type"></span><br/>
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

<div class="modal fade" id="UploadModal" >
    <div class="modal-dialog" role="document" style = "width:900px;">
        <div class="modal-content">

            <div class="page ">
                <div class="banneradd bor">
                    <div class="baTopNo">
                        <span>修改</span>
                    </div>
                    <div class="baBody" style="margin-left:50px">
                        <form action="user/updateItem" method="post" enctype="multipart/form-data" onsubmit="return validation()">
                            <input type="hidden" name="id" id="rid">
                            <div style="display: inline-block">
                                <div class="bbD">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;负责人：<input type="text"  class="input1" value="${user.name}" readonly/>
                                </div>
                                <div class="bbD">
                                    &nbsp;&nbsp;&nbsp;&nbsp;项目名称：<input type="text" class="input1" name = "name" id="rname"/>
                                </div>
                                <div class="bbD">
                                    &nbsp;&nbsp;&nbsp;&nbsp;项目类型：<select disabled="true" class="input1" name= "type" id="rtype">
                                    <option value="理论成果" selected="selected">理论成果</option>
                                    <option value="科技创新">科技创新</option>
                                    <option value="科学成果">科学成果</option>
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
                                    &nbsp;&nbsp;&nbsp;&nbsp;开始时间：<input type="text" class="input1" name = "startTime" id="rstartTime" />
                                </div>
                                <div class="bbD">
                                    &nbsp;&nbsp;&nbsp;&nbsp;结束时间：<input type="text" class="input1" name = "endTime" id="rendTime" />
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
                            <div class="bbD" id="lxFile">
                                &nbsp;&nbsp;&nbsp;&nbsp;立项材料：<center><input type="file" name = "file" id="rfile"/></center>
                            </div>
                            <div class="bbD" id="jxFile">
                                &nbsp;&nbsp;&nbsp;&nbsp;结项材料：<center><input type="file" name = "file2" id="rfile2"/></center>
                            </div>
                            <div class="bbD">
                                <p class="bbDP" style="margin-left: 680px">
                                    <button class="btn btn-success" type="submit">修改</button>
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
    //执行一个laydate实例
    laydate.render({
        elem: '#rstartTime'
    });
    laydate.render({
        elem: '#rendTime'
    });

    var rid = 0;
    function changeId(id, check){

        if(check == 1){

            $("#rname").attr("disabled", true);
            $("#rdomain").attr("disabled", true);
            $("#rdescription").attr("disabled", true);
            $("#rstartTime").attr("disabled", true);
            $("#rendTime").attr("disabled", true);
            $("#rcoin").attr("disabled", true);
            $("#runit").attr("disabled", true);
            $("#rgroup").attr("disabled", true);
            $("#lxFile").hide();
            $("#jxFile").show();
        }else if(check == 0){

            $("#rname").removeAttr("disabled");
            $("#rdomain").removeAttr("disabled");
            $("#rdescription").removeAttr("disabled");
            $("#rstartTime").removeAttr("disabled");
            $("#rendTime").removeAttr("disabled");
            $("#rcoin").removeAttr("disabled");
            $("#runit").removeAttr("disabled");
            $("#rgroup").removeAttr("disabled");
            $("#jxFile").hide();
            $("#lxFile").show();
        }else if(check == 3 || check == 4 || check == 2){
            layer.alert("该项目已终止，不允许修改！")
            return;
        }
        var path = $("#rfile").val() + "";
        if(path != "" && path.substring(path.lastIndexOf(".") + 1) != "rar" && path.substring(path.lastIndexOf(".") + 1) != "zip"){
            layer.alert("仅支持rar或zip格式材料上传，请压缩文件后重试！");
            return;
        }
        path = $("#rfile2").val() + "";
        if(path != "" && path.substring(path.lastIndexOf(".") + 1) != "rar" && path.substring(path.lastIndexOf(".") + 1) != "zip"){
            layer.alert("仅支持rar或zip格式材料上传，请压缩文件后重试！");
            return;
        }

        rid = id;
        $("#rid").val(rid);
        $.ajax({
            type: "POST",
            url: "user/getItemById",
            data: {
                id: id
            },
            dataType: "json",
            success: function(data){
                console.log(data);
                $("#rname").val(data.name);
                $("#rtype").val(data.type);
                $("#rdomain").val(data.domain);
                $("#rdescription").val(data.description);
                $("#rstartTime").val(data.startTime);
                $("#rendTime").val(data.endTime);
                $("#rcoin").val(data.coin);
                $("#runit").val(data.unit);
                $("#rgroup").val(data.group);

                $("#UploadModal").modal("show");
            },
            error:function () {
                layer.alert("error!");
            }

        });
    }

    function view(id) {

        $.ajax({
            type: "POST",
            url: "user/getItemById",
            data: {
                id: id
            },
            dataType: "json",
            success: function(data){
                console.log(data);
                $("#name").text(data.name);
                $("#type").text(data.type);
                $("#domain").text(data.domain);
                $("#description").text(data.description);
                $("#startTime").text(data.startTime);
                $("#endTime").text(data.endTime);
                $("#coin").text(data.coin);
                $("#unit").text(data.unit);
                $("#group").text(data.group);
                var check = data.check;

                var comment = "";
                if(check == "0"){
                    comment += "未审核"
                }else if(check == "1"){
                    comment += "同意立项； "
                }else if(check == "2"){
                    comment += "不同意立项； "
                }else if(check == "3"){
                    comment += "同意结项； "
                }else if(check == "4"){
                    comment += "不同意结项； "
                }
                comment += "${data.comment}";
                $("#comment").text(comment);
            },
            error:function () {
                layer.alert("error!");
            }

        })
    }

    function del(id) {
        layer.confirm('确定删除该项目吗？', {
                btn: ['确定','取消'] //按钮
            }, function(){
                window.location.href = "user/delItem?id=" + id;
            }, function(){
                layer.close();
            }
        );
    }

    function query(){
        var type = $("#ctype").val();
        var name = $("#cname").val();
        var check = $("#ccheck").val();
        var url = encodeURI(encodeURI("user/itemList?type=" + type + "&name=" + name + "&check=" +check));
        window.location.href = url;

    }

</script>
</html>