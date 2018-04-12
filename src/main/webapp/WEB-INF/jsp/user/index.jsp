<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>
</head>

<frameset rows="100,*" cols="*" scrolling="No" framespacing="0" frameborder="no" border="0">

    <frame src="uHeadJsp" name="headmenu" id="mainFrame" title="mainFrame">

    <frameset rows="100*" cols="220,*" scrolling="No" framespacing="0" frameborder="no" border="0">
        <frame src="uLeftJsp" name="leftmenu" id="mainFrame" title="mainFrame">
        <frame src="uMainJsp" name="main" scrolling="yes" noresize="noresize" id="rightFrame" title="rightFrame">
    </frameset>

</frameset>
</html>