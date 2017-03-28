<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>电影比价平台-登录</title>
<link href="<%=request.getContextPath()%>/css/public.css"
	type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/list.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<!--end 导航-->
	<div class="wrapper">
		<div class="crumbs mart10">
			您的位置：<a href="http://www.189mv.cn/">电影比价平台</a> &gt; <span>后台管理系统登录</span>
		</div>
	</div>
	<div class="wrapper">
		<div class="com_b mart10 padd_28 fix">
			<div class="register-con">
				<h2>后台管理系统登录</h2>
				<h3>${message}</h3>
				<form action="<%=request.getContextPath()%>/mt/loginAdmin" method="post"
					id="myform">
					<div class="login_cont">
						<div class="k_item_2">
							<span class="t">登录账号：</span> <input name="userName" id="userName"
								placeholder="账号" type="text" class="ip_txt">
								<span id="nameMsg"></span>
						</div>
						<div class="k_item_2" style="width: 500px">
							<span class="t">登录密码：</span> <input name="userPwd" id="userPwd"
								placeholder="密码" type="password" class="ip_txt">
								<span id="pwdMsg"></span>
						</div>

						<div class="k_login" style="padding-bottom: 40px;">
							<a href="javascript:void(0);" id="loginButton" class="btn">登录</a>
						</div>

					</div>
				</form>
			</div>

		</div>

	</div>
	<div id="footer" class="fix">
		<ul>
			<li>客服电话：1877091266<br>电影比价平台<br>Copyright©
				2017电影比价平台 版权所有
			</li>
		</ul>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		var userName='';
		var userPwd='';
		userName = $("#userName").val();
		userPwd = $("#userPwd").val();
		$("#userName").change(function() {
			$("#nameMsg").html("");
			userName = $("#userName").val();
			if (userName == '') {
				$("#nameMsg").html("<font color='red'>用户名不能为空</font>");
				return;
			}
		});

		
		$("#userPwd").change(function() {
			$("#pwdMsg").html("");
			userPwd = $("#userPwd").val();
			if (userPwd == '') {
				$("#pwdMsg").html("<font color='red'>密码不能为空</font>");
				return;
			}
			
		});
		
		$("#loginButton").click(function(){
			if(userName!=''&&userPwd!=''){
				$("#myform").submit();
			}
		});
	});
	</script>
</body>
</html>