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
	<div class="body_w">
		<div class="header">
			<div class="logo">
				<a href="http://www.189mv.cn/">电影比价平台</a>
			</div>
			<div class="turn_city fl">
				<span class="t_c_box">南昌<em><i></i></em></span>

				<div id="select_city_sub_menu" class="city popres t_c_list"
					style="display: none;">
					<div class="loading_city" style="display: none" id="loadingCity">
						<img src="<%=request.getContextPath()%>/images/loading26.gif">
					</div>
				</div>

			</div>
			<!--城市选择-->
			<div class="t_nav" id="userstatediv">
				<a href="<%=request.getContextPath()%>/mt/toRegister">注册</a> | <a
					href="<%=request.getContextPath()%>/mt/toLogin" id="loginbtn">登录</a>
				| <a href="http://www.189mv.cn/help/" target="_blank">帮助</a>
			</div>
		</div>
	</div>

	<div class="b_blue">
		<div class="main_nav">
			<ul class="m_nav_list fix">
				<li class="home"><a href="http://www.189mv.cn/">首页</a></li>
				<li><a href="http://www.189mv.cn/movie/">电影</a></li>
				<li><a href="http://www.189mv.cn/cinema/">影院</a></li>
				<li><a href="http://www.189mv.cn/news/">电影资讯</a></li>
				<li><a href="http://www.189mv.cn/phone/">手机订票</a></li>
				<li><a href="http://www.189mv.cn/activity/">活动</a></li>
				<li><a href="http://www.189mv.cn/groupon/">商企优选</a></li>
				<li><a href="http://www.189mv.cn/voucher/"
					style="padding: 0px 20px;">兑换券购买</a></li>
			</ul>
		</div>
	</div>
	<!--end 导航-->
	<div class="wrapper">
		<div class="crumbs mart10">
			您的位置：<a href="http://www.189mv.cn/">电影比价平台</a> &gt; <span>登录</span>
		</div>
	</div>
	<div class="wrapper">
		<div class="com_b mart10 padd_28 fix">
			<div class="register-con">
				<h2>用户登录</h2>
				<h3>${message}</h3>
				<form action="<%=request.getContextPath()%>/mt/login" method="post"
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

						<div class="k_item_3">
							<span class="rem"> <label><input type="checkbox"
									id="remember" style="margin-right: 5px;">记住账号</label>
							</span> <a href="http://www.189mv.cn/forget/" class="blue"
								style="margin-left: 130px;">找回密码</a>
						</div>
						<div class="k_login" style="padding-bottom: 40px;">
							<a href="javascript:void(0);" id="loginButton" class="btn">登录</a>
						    <a href="<%=request.getContextPath()%>/mt/toRegister" class="blue"
								style="margin-left: 5px; font-size: 12px;">我要注册</a>
						</div>

					</div>
				</form>
			</div>

		</div>

	</div>
	<div id="footer" class="fix">
		<ul>
			<li>客服电话：4008610001<br>电影比价平台业务经营许可证：粤ICP备14020429号<br>Copyright©
				2007—2017 电影比价平台 版权所有
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
			alert(userPwd);
			alert(userName);
			if(userName!=''&&userPwd!=''){
				$("#myform").submit();
			}
		});
	});
	</script>
</body>
</html>