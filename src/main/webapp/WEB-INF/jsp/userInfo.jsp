<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	String contextPath = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>主页</title>
	<link href="../webCss/style.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="head.jsp" />
<!-- end 顶部导航栏 -->
<div class="main">
	<!-- left -->
	<jsp:include page="leftMain.jsp" />
	<!-- right -->
	<div class="maright">
		<div class="ritit">
			个人信息
		</div>
		<div class="right">
			<p class="clearfix">
				<span class="leftLabel" style="color: #000000;font-size:20px;">用户名：</span> <span
					style="color: #1d8fe5; font-weight: bold;font-size:20px;">${currentUser.ownerUsername}</span>
			</p><br/>
			<p class="clearfix">
				<span class="leftLabel" style="color: #000000;font-size:20px;">密码：</span> <span
					style="color: #1d8fe5; font-weight: bold;">${currentUser.ownerPassword}</span>
			</p><br/>
			<p class="clearfix">
				<span class="leftLabel" style="color: #000000;font-size:20px;">性别：</span> <span
					style="color: #1d8fe5; font-weight: bold;">${currentUser.ownerSex}</span>
			</p><br/>
			<p class="clearfix">
				<span class="leftLabel" style="color: #000000;font-size:20px;">年龄：</span> <span
					style="color: #1d8fe5; font-weight: bold;">${currentUser.ownerAge}</span>
			</p><br/>
			<p class="clearfix">
				<span class="leftLabel" style="color: #000000;font-size:20px;">邮箱：</span> <span
					style="color: #1d8fe5; font-weight: bold;">${currentUser.ownerEmail}</span>
			</p><br/>
			<p class="clearfix">
				<span class="leftLabel" style="color: #000000;font-size:20px;">住址：</span> <span
					style="color: #1d8fe5; font-weight: bold;">${currentUser.address}</span>
			</p><br/>
			<p class="clearfix">
				<span class="leftLabel" style="color: #000000;font-size:20px;">电话：</span> <span
					style="color: #1d8fe5; font-weight: bold;">${currentUser.telephone}</span>
			</p><br/>
			<p class="clearfix">
				<span class="leftLabel" style="color: #000000;font-size:20px;">职业：</span> <span
					style="color: #1d8fe5; font-weight: bold;">${currentUser.occupation}</span>
			</p><br/>
			<p class="clearfix">
				<span class="leftLabel" style="color: #000000;font-size:20px;">注册时间：</span> <span
					style="color: #1d8fe5; font-weight: bold;">${currentUser.createTime}</span>
			</p><br/>
			<div class="update">
				<a href="<%=contextPath%>/pet/toUpdateInfo?id=${currentUser.id}">更新个人信息</a>
			</div>
		</div>
	</div>
</div>

<!-- foot -->
	<jsp:include page="foot.jsp" />

</body>
</html>
