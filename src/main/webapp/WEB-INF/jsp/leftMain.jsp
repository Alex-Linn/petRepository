<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

<%-- <jsp:include page="head.jsp" />
<!-- end 顶部导航栏 --> --%>

<!-- left -->
<div class="maleft">
	<div class="lefttit">导航栏目<span>NEWS</span></div>
	<div class="TabTitle2">
		<ul class="expmenu">
			<li>
				<div class="header">
					<span class="arrow down"></span>
					<a href="<%=contextPath%>/pet/toMain">首页</a>
				</div>
			</li>
			<li>
				<div class="header">
					<span class="arrow down"></span>
					<a href="<%=contextPath%>/pet/toLoadUserInfo">个人资料</a>
				</div>
			</li>
			<li>
				<div class="header">
					<span class="arrow down"></span>
					<a href="<%=contextPath%>/pet/toBomei">博美</a>
				</div>
			</li>
			<li>
				<div class="header">
					<span class="arrow down"></span>
					<a href="<%=contextPath%>/pet/toBixiong">比熊</a>
				</div>
			</li>
			<li>
				<div class="header">
					<span class="arrow down"></span>
					<a href="<%=contextPath%>/pet/toKeji">柯基犬</a>
				</div>
			</li>
		</ul>
	</div>
	<div class="lefttit">联系我们<span>CONTACT US</span></div>
	<div class="contact">
		宠物爱好者平台<br/>联系电话：18146704981<br/>
		QQ号：1016059606<br/>座机：0796-3365414<br/>邮箱：1016059606@qq.com<br/>
		地址：深圳市南山区科技一路<br/><br/>
	</div>
</div>
<!-- end left -->

</body>
</html>
