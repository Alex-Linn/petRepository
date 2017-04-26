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
<div class="navbg">
	<div class="nav">
	<ul>宠物爱好者平台</ul>
	<li class="at"><a href="<%=contextPath %>/pet/toMain" title="HOME">首页</a></li>
	<li ><a href="<%=contextPath%>/user/loadUserInfo?id=${currentUser.id}" title="ABOUT ME">个人资料</a></li>
	<li ><a href="<%=contextPath %>/pet/toBomei" title="博美">博美</a></li>
	<li ><a href="<%=contextPath %>/pet/toBixiong" title="比熊">比熊</a></li>
	<li ><a href="<%=contextPath%>/pet/toKeji" title="柯基犬">柯基犬</a></li>
	</div>
</div>
</body>
</html>
