<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="application-name" content="电影比价平台">
<meta name="title" content="电影资讯">
<title>电影比价平台-注册</title>
<link href="<%=request.getContextPath()%>/css/public.css"
	type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/list.css" type="text/css"
	rel="stylesheet">
</head>
<body>
<jsp:include page="head.jsp" />
	<!--end 导航-->
	<div class="wrapper">
		<div class="crumbs mart10">
			您的位置：<a href="http://www.189mv.cn/">电影比价平台</a> &gt; <span>注册</span>
		</div>
	</div>
	<div class="wrapper">
		<div class="com_b mart10 padd_28 fix">
			<div class="register-con">
				<h2>用户注册</h2>
				<h3>${message}</h3>
				<form id="myform" action="<%=request.getContextPath()%>/mt/register"
					method="post">
					<div class="regist_cont">
						<div class="k_item_2" style="width: 500px">
							<span class="t">用户名:</span> <input name="userName" id="userName"
								maxlength="11" type="text" class="ip_txt"> <span
								id="nameMsg"></span>
						</div>
						
						<div class="k_item_2" style="width: 500px">
							<span class="t">手机号码:</span> <input name="userTel" id="userTel"
								type="text" class="ip_txt"> <span id="telMsg"></span>
						</div>
						<div class="k_item_2" style="width: 500px">
							<span class="t">设置密码:</span> <input name="userPwd" id="userPwd"
								type="password" class="ip_txt"> <span id="pwdMsg"></span>
						</div>
						<div class="k_item_2" style="width: 500px">
							<span class="t">确认密码:</span> <input name="reUserPwd"
								id="repassword" type="password" class="ip_txt"> <span
								id="repwdMsg"></span>
						</div>
						<div class="k_item_2" style="width: 500px">
							<span class="t">喜欢影片类型:</span> 
								<select id="userHobby" name= "userHobby">
									<option value="动作">动作</option>
									<option value="喜剧">喜剧</option>
									<option value="爱情">爱情</option>
									<option value="科幻">科幻 </option>
									<option value="奇幻">奇幻 </option>
									<option value="灾难">灾难</option>
									<option value="恐怖">恐怖 </option>
									<option value="纪录">纪录</option>
									<option value="犯罪">犯罪</option>
									<option value="战争">战争 </option>
									<option value="冒险">冒险</option>
									<option value="动画">动画 </option>
									<option value="剧情">剧情 </option>
									<option value="其他">其他 </option>
									 
								</select>
						    <span
								id="nameMsg"></span>
						</div>
						<div class="k_regist">
							<a href="javascript:void(0);" id="registbtn" class="btn">提交注册</a>
							<span style="font-size: 12px; margin-left: 5px;">已有账号</span><a
								href="<%=request.getContextPath()%>/mt/toLogin" class="blue"
								style="font-size: 12px;">立即登录</a>
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
		function register() {
			//登录
			window.location.href = root + "regist/";
		}
		function login() {
			//登录
			window.location.href = root + "login/";
		}

		function refresh() {
			document.getElementById("imgcodedom").src = "http://www.189mv.cn/randomCode.jpg?now="
					+ new Date().getTime();
			$("#imagescode").val("");
			return false;
		}

		$(document).ready(function() {
			var userName = $("#userName").val();
			var userTel = $("#userTel").val();
			var userPwd= $("#userPwd").val();
			var repassword= $("#repassword").val();
			var reg = /^([a-zA-Z]|[0-9]){6,12}$/;

			$("#userName").change(function() {
				$("#nameMsg").html("");
				userName = $("#userName").val();
				if (userName == '') {
					$("#nameMsg").html("<font color='red'>用户名不能为空</font>");
					return;
				}
			});

			$("#userTel").change(function() {
				$("#telMsg").html("");
				userTel = $("#userTel").val();
				if (userTel == '') {
					$("#telMsg").html("<font color='red'>手机号不能为空</font>");
					return;
				}

				var isIeger = false;
				//手机号校验
				if (/^1[3-9]\d{9}$/.test(userTel)) {
					isIeger = true;
				}

				if (!isIeger) {
					$("#telMsg").html("<font color='red'>手机号格式错误</font>");
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

			$("#repassword").change(function() {
				repassword = $("#repassword").val();
				$("#repwdMsg").html("");
				
				if (repassword == '') {
					$("#repwdMsg").html("<font color='red'>密码不能为空</font>");
					return;
				}

				
			});
			
			$("#userPwd,#repassword").change(function(){
				$("#repwdMsg").html("");
				userPwd = $("#userPwd").val();
				repassword = $("#repassword").val();
				if (userPwd != repassword) {
					$("#repwdMsg").html("<font color='red'>密码 不一致</font>");
					return;
				}
			});

			$("#registbtn").click(function() {
				if(userName!=''&&userPwd!=''&&userTel!=''&&repassword!=''&&userPwd==repassword){
					$("#myform").submit();
				}
			});
		});
	</script>
</body>
</html>