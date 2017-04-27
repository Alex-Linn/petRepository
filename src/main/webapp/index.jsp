<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%
	String contextPath = request.getContextPath();
%>
<html lang="en" class="translated-ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
	<link rel="stylesheet" href="<%=contextPath %>/css/style.css?v=1480662015">
	<link rel="stylesheet" href="<%=contextPath %>/css/ui-dialog.css">
	<link rel="stylesheet" href="<%=contextPath %>/css/translateelement.css">
</head>
<body>
	<div class="login-container">
		<div class="login">
			<div class="layout clearfix">
				<div class="login-form fr">
					<!-- <div class="login-row tc">
						<label class="login-choose">
						  <input type="radio" name="usertype" class="J-chooseLoginType" value="0" checked="">
							<font>
							  <font>用户登录</font>
							</font>
						</label>
						<label class="login-choose">
						  <input type="radio" name="usertype" class="J-chooseLoginType" value="1">
							<font>
							 <font>管理员登录</font>
							</font>
						</label>
					</div> -->
					<div class="J-loginMod">
						<div class="login-business">
							<form class="J-loginForm" id="myform" action="<%=contextPath%>/user/loginCheck"
								method="post">
								<div class="login-row">
									<input type="text" name="username" id="username" class="login-input placeholder" placeholder="用户名">
								</div>
								<div class="login-row">
									<input type="password" name="password" id="password" class="login-input" placeholder="密码">
								</div>
								<div class="login-row">
									<a href="javascript:void(0);" class="login-submit" id="login-submit">
										<font>
											<font>用户登录</font>
										</font>
									</a>
								</div>
								<div class="info_list register">
									<span class="in_txt">还没有账号?</span>
									<a target ="_blank" href="register.jsp">立即注册！</a>
								</div>
								<div class="login-row">
									<p class="login-error hide"></p>
								</div>
								<input type="hidden" name="usertype" value="0">
							</form>
						</div>
						<!-- <div class="login-staff hide">
							<form class="J-loginForm" id="myform1" action="" method="post">
								<div class="login-row">
									<input type="text" name="username" id="username"class="login-input placeholder" placeholder="管理员账号">
								</div>
								<div class="login-row">
									<input type="text" name="mobile" id="mobile"class="login-input placeholder" placeholder="管理员编号">
								</div>
								<div class="login-row">
									<input type="password" name="password" id="password"class="login-input" placeholder="密码">
								</div>
								<div class="login-row">
									<a href="javascript:void(0);" class="login-submit" id="login-submit">
										<font>
											<font>管理员登录</font>
										</font>
									</a>
								</div>
								<div class="login-row">
									<p class="login-error hide"></p>
								</div>
								<input type="hidden" name="usertype" value="1">
							</form>
						</div>
 -->					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
			// 用户登录
				$(function(){
				$("#login-submit").click(function(){
					var user = $('#username').val();
					var pass = $('#password').val();
					alert(user+"3333")
					$("#username").change(function() {
					$("#nameMsg").html("");
					userName = $("#username").val();
					if (user == '') {
						$("#nameMsg").html("<font color='red'>用户名不能为空</font>");
						return;
			}
		});
					/* if(user == ''){
						$error.removeClass('hide').html('用户名不能为空');
					}else if(pass == ''){
						$error.removeClass('hide').html('密码不能为空');
					}else{
						$("#myform").submit();
					} */
				})
				$.ajax({
						url : '<%=contextPath%>/user/loginCheck',
						type : 'POST',
						data :{
							"username" : username,
							"password" : password
						}
						
					}) 
				})
				/* }) */
		
			/* alert("00000000000");
			 $('.login-submit').on('click',
					function() {
						var $this = $(this), $form = $this
								.parents('form.J-loginForm'), $error = $(
								'.login-error', $form), $code = $(
								'.login-loadCode', $form);

						if ($this.hasClass('btn-disabled')) {
							return;
						}

						$this.addClass('btn-disabled');
						$.ajax({
							type : 'POST',
							url : '/user/loginCheck',
							data : $form.serialize(),
							success : function(res) {
								$error.removeClass('hide').html("登录成功！");
							},
							error : function() {
								$error.removeClass('hide').html('登录失败，请重试！');
							},
							complete : function() {
								$this.removeClass('btn-disabled');
							}
						});
					});

		})(jQuery);  */
	</script>
</body>
</html>
