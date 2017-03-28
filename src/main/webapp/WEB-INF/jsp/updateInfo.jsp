<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="application-name" content="个人中心">
<meta name="title" content="个人中心">
<title>我的信息-个人中心</title>
<link href="<%=request.getContextPath()%>/css/public.css"
	type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/list.css" type="text/css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/myITV.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="head.jsp" />
	<!--end 导航-->
	<div class="wrapper">
		<div class="crumbs mart10">
			您的位置：<a href="#">电影比价平台</a> &gt; 我的信息
		</div>
	</div>
	<!--当前显示-->
	<div class="myITVcontent10 clearfix">
		<!--内容区Start-->
		<div class="side">
			<!--左-->
			<div class="listContent">
				<h3>
					<a
						href="<%=request.getContextPath()%>/mt/loadUserInfo?id=${u.id}">我的信息</a>
				</h3>
				<div class="sonList">
					<ul id="leftBarCon1">
						<li id="coupon"><a
							href="<%=request.getContextPath()%>/mt/loadUserInfo?id=${u.id}">我的信息</a></li>
					</ul>
					<ul id="leftBarCon1">
						<li id="coupon"><a
							href="<%=request.getContextPath()%>/mt/toUpdateInfo">更新信息</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="ContentR">
			<!--右-->
			<div class="mainContent">
				<div class="mainTitle clearfix"></div>
				<!--标题End-->
				<div class="detailContent">
					<!--详细内容-->
					<div class="content1">
						<!--内容1-->
						<div class="part1">
							<div class="userDataEnter clearfix">
								<h3>更新资料</h3>
								<div class="right">
									<form action="<%=request.getContextPath()%>/mt/updateInfo">
										<div class="content1">
											<div class="tableList">
												<table class="table1" width="700" border="0" cellpadding="0"
													cellspacing="0">
													<tbody>
														<tr>
															<td class="left"><span>登录账号：</span></td>
															<td class="right"><input type="text" value="${u.userName }" name="userName"
																id="userName"><span id="oldpwd_msg"></span></td>
														</tr>
														<tr>
															<td class="left"><span>邮箱：</span></td>
															<td class="right"><input type="text"
																name="userEmail" value="${u.userEmail }" id="userEmail"><span
																id="newpwd_msg"></span></td>
														</tr>
														<tr>
															<td class="left"><span>喜欢电影类型：</span></td>
															<td class="right"><select id="userHobby"
																name="userHobby">
																	<option value="动作">动作</option>
																	<option value="喜剧">喜剧</option>
																	<option value="爱情">爱情</option>
																	<option value="科幻">科幻</option>
																	<option value="奇幻">奇幻</option>
																	<option value="灾难">灾难</option>
																	<option value="恐怖">恐怖</option>
																	<option value="纪录">纪录</option>
																	<option value="犯罪">犯罪</option>
																	<option value="战争">战争</option>
																	<option value="冒险">冒险</option>
																	<option value="动画">动画</option>
																	<option value="剧情">剧情</option>
																	<option value="其他">其他</option>

															</select></td>
														</tr>
														<tr>
															<td colspan="2"><input type="submit" value="更新信息" /><span
																id="save_pwd_msg"></span></td>
														</tr>
													</tbody>
												</table>

											</div>
											<div class="clean"></div>
										</div>
										<input type="hidden" value="${user.id}" name="id" />
									</form>
								</div>
							</div>

							<!--标签行End-->
						</div>
						<!--第一部分End-->
					</div>
					<!--内容1End-->
				</div>
				<!--详细内容End-->
			</div>
			<!--mainContent2 End-->
		</div>
		<!--右End-->
	</div>
	<!--内容区域End-->
	<div id="footer" class="fix">
		<ul>
			<li>客服电话：4008610001<br>电影比较平台经营许可证：粤ICP备14020429号<br>Copyright©
				2007—2013 电影比价平台 版权所有
			</li>
		</ul>
	</div>





	<div class="reset_c_tips cotr-pop" style="display: none;" id="zz_pwd2">
		<div class="c_tips_cont">
			<a href="javascript:void(0)" class="c_close" id="pwd_close">关闭</a>
			<h3 class="tip_h3">互联网帐号存在被盗风险，建议您定期更改密码以保护账户安全！</h3>
			<div class="tablePw">
				<table>
					<tbody>
						<tr>
							<td class="left"><span>原密码：</span></td>
							<td class="right"><input type="password" id="oldpwd"><span
								id="oldpwd_msg"></span></td>
						</tr>
						<tr>
							<td class="left"><span>新密码：</span></td>
							<td class="right"><input type="password" id="newpwd"><span
								id="newpwd_msg"></span></td>
						</tr>
						<tr>
							<td class="left"><span>再次输入：</span></td>
							<td class="right"><input type="password" id="newpwd2"><span
								id="newpwd2_msg"></span></td>
						</tr>

						<tr>

							<td colspan="2"><span id="save_pwd_msg"></span></td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="c_tips_btn" style="margin-top: 20px;">
				<a href="javascript:void(0)"
					style="width: 60px; letter-spacing: 4px;" onclick="savePwdBtn();">确定</a>
			</div>
		</div>
	</div>




	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/common.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/myITV.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.huodong').click(function() {
				$('.buyFilm').hide();
				$('.hotFun').show();
				$('.hotChoose').removeClass('bg1').addClass('bg2');
			});
			$('.yingpian').click(function() {
				$('.buyFilm').show();
				$('.hotFun').hide();
				$('.hotChoose').removeClass('bg2').addClass('bg1');
			});

			$("#changeInfo").click(function() {

				$("#oldpwd").val("");
				$("#newpwd").val("");
				$("#newpwd2").val("");
				$("#save_pwd_msg").text("");
				$("#newpwd2_msg").text("");
				$("#newpwd_msg").text("");
				$("#oldpwd_msg").text("");

				showCoverAll();

				$("#zz_pwd2").show();

			});

			//修改密码弹窗关闭
			$("#pwd_close").click(function() {

				hideCoverAll();
				$("#zz_pwd2").hide();
				hideLoading();
			});

			$("#changeMail").click(function() {

				$("#pwd").val("");
				$("#email").val("");
				$("#pwd_msg").text("");
				$("#email_msg").text("");
				showCoverAll();
				$("#zz_mail2").show();
			});
			//修改邮箱弹窗关闭
			$("#mail_close").click(function() {

				hideCoverAll();
				$("#zz_mail2").hide();
				hideLoading();
			});

		});

		function loginCallback(json) {

			location.reload();
		}

		function savePwdBtn() {

			var oldpwd = $.trim($("#oldpwd").val());
			var newpwd = $.trim($("#newpwd").val());
			var newpwd2 = $.trim($("#newpwd2").val());

			$("#oldpwd_msg").text("");
			$("#newpwd_msg").text("");
			$("#newpwd2_msg").text("");
			$("#save_pwd_msg").text("");

			if (oldpwd == "") {

				$("#oldpwd_msg").text("原密码不能为空!");
				$("#oldpwd_msg").css("color", "red");

				return;
			}
			if (newpwd == "") {

				$("#newpwd_msg").text("新密码不能为空!");
				$("#newpwd_msg").css("color", "red");

				return;
			}
			if (newpwd2 == "") {

				$("#newpwd2_msg").text("再次输入不能为空!");
				$("#newpwd2_msg").css("color", "red");
				return;
			}

			if (newpwd != newpwd2) {
				$("#newpwd2_msg").text("密码不一致!");
				$("#newpwd2_msg").css("color", "red");
				return;
			}
			loading();
			$.ajax({
				url : "http://www.189mv.cn/updateMemberPwd.htm",
				dataType : "json",
				cache : false,
				type : "POST",
				data : {
					"oldpwd" : oldpwd,
					"newpwd" : newpwd,
					"newpwd2" : newpwd2
				},
				success : function(json) {

					var result = json.result;
					if (result == "00") {
						hideLoading();
						$("#zz_pwd2").hide();
						$.ajax({
							url : root + "logout.htm",
							dataType : "json",
							cache : false,
							type : "POST",
							success : function(json) {
								var code = json.result;
								if (code === "00") {

									window.location.href = getReloginUrl();
								} else {
									showTips(json.reason);
								}
							},
							error : function(json) {
								showTips("亲，服务出现了点小问题… 请重新尝试");
							}
						});

					} else if (result == "505") {
						hideLoading();
						$("#save_pwd_msg").text(json.reason);
						$("#save_pwd_msg").css("color", "red");
						//window.location.href = getLoginUrl();
						window.location.href = "http://www.189mv.cn/";
					} else {

						$("#save_pwd_msg").text(json.reason);
						$("#save_pwd_msg").css("color", "red");
					}
				},
				error : function(json) {
					hideLoading();
					$("#save_pwd_msg").text("亲，服务出现了点小问题… 请重新尝试");
					$("#save_pwd_msg").css("color", "red");

				}
			});
		}

		function logoutCallback(json) {
			window.location.href = root;
		}
	</script>
</body>
</html>