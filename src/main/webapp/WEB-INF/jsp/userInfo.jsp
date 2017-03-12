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
				<a href="javascript:void(0);">${user.userName}</a> | <a
					href="http://www.189mv.cn/home/" class="blue">首页</a> | <a
					href="<%=request.getContextPath()%>/mt/logout">退出</a> | <a
					href="http://www.189mv.cn/help/" target="_blank">帮助</a>
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

				<!--<li><a href="javascript:void(0);" >会员专区</a></li>  -->
			</ul>
		</div>
	</div>
	<!--end 导航-->
	<div class="wrapper">
		<div class="crumbs mart10">
			您的位置：<a href="http://www.189mv.cn/">电影比价平台</a> &gt; 我的信息
		</div>
	</div>
	<!--当前显示-->
	<div class="myITVcontent10 clearfix">
		<!--内容区Start-->
		<div class="side">
			<!--左-->
			<div class="listContent">
				<h3>
					<a href="http://www.189mv.cn/home/">我的信息</a>
				</h3>
				<div class="sonList">
					<h4>我的账户</h4>
					<ul id="leftBarCon1">

						<li id="points"><a href="http://www.189mv.cn/home/points/">电信积分</a></li>

						<li id="voucher"><a href="http://www.189mv.cn/home/voucher/">兑换劵</a></li>
						<li id="coupon"><a href="http://www.189mv.cn/home/coupon/">抵用劵</a></li>
						<li id="filmcoin"><a
							href="http://www.189mv.cn/home/filmcoin/">影币</a></li>
						<li id="groupon"><a href="http://www.189mv.cn/home/groupon/">商企券</a></li>

					</ul>
					<h4>我的订单</h4>
					<ul id="leftBarCon2">
						<li><a href="http://www.189mv.cn/home/order/">影票订单</a></li>
						<li><a href="http://www.189mv.cn/home/goods/">卖品订单</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="ContentR">
			<!--右-->
			<div class="mainContent">
				<div class="mainTitle clearfix">
					<!--标题-->
					<h3>我的资料</h3>
				</div>
				<!--标题End-->
				<div class="detailContent">
					<!--详细内容-->
					<div class="content1">
						<!--内容1-->
						<div class="part1">
							<!--第一部分-->
							<p style="margin-top: 16px; margin-bottom: 12px;">
								<span style="font-size: 18px; color: #0099CC;">个人信息</span>
							</p>
							<div class="userDataEnter clearfix">
								<div class="left">

									<p>
										<img src="<%=request.getContextPath()%>/images/ele_07.jpg"
											width="170" height="170">
									</p>
									<p class="loadPic my-changeInfo clearfix">
										<a href="http://www.189mv.cn/memberManager.htm"
											class="myYxtCha">修改资料</a>
									</p>

								</div>


								<div class="right">
									<p class="clearfix">
										<span class="leftLabel">登录账号：</span> <span
											style="color: #ff6600; font-weight: bold;">${user.userName}</span>
									</p>

									<p class="clearfix">
										<span class="leftLabel">登录密码：</span> <span
											style="color: #ff6600; font-weight: bold;"><a
											href="javascript:void(0)" class="myYxtCha" id="changeInfo">更改</a></span>
									</p>



									<p class="clearfix">
										<span class="leftLabel">会员级别：</span> <span class="my-grade"
											style="margin-right: 5px;"><img
											src="<%=request.getContextPath()%>/images/xiao4.png"
											height="29"></span> <span style="font-size: 12px;">银卡会员</span>
										<a href="http://www.189mv.cn/qryUserLvs.htm" class="fl"><span
											style="font-size: 12px; color: #ff6600;">（升级会员获取更多购票优惠）</span></a>
									</p>
									<p class="clearfix">
										<span class="leftLabel">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</span>
										<span>${user.userName}</span>
									</p>
									<p class="clearfix">
										<span class="leftLabel">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span>
										<span>未知</span>
									</p>
									<p class="clearfix">
										<span class="leftLabel">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</span>
										<span id="showemail">${user.userEmail}</span> <span
											style="color: #ff6600; font-weight: bold;"><a
											href="javascript:void(0)" class="myYxtCha my-change"
											id="changeMail">更改</a></span>
									</p>
								</div>
							</div>
							<div class="colorTab clearfix">
								<!--标签行-->
								<p class="color1 clearfix">
									<span id="pointBalance">电信积分:0</span>
								</p>
								<p class="color2 clearfix">
									<span>兑换劵:0张</span>
								</p>
								<p class="color3 clearfix">
									<span>抵用劵:0张</span>
								</p>
								<p class="color6 clearfix">
									<span>商企券:0张</span>
								</p>
								<p class="color4 clearfix">
									<span>影币:0个</span>
								</p>
								<p class="color5 clearfix">
									<span>本月话费代扣:额度:0元/余额:0元</span>
								</p>

							</div>
							<!--标签行End-->
						</div>
						<!--第一部分End-->
					</div>
					<!--内容1End-->
				</div>
				<!--详细内容End-->
			</div>
			<div class="mainContent2">
				<!--mainContent2-->

				<p style="margin-top: 16px; margin-bottom: 12px;">
					<span style="font-size: 18px; color: #0099CC; margin-left: 10px;">即将上映的电影</span>
				</p>

				<div class="filmEnd clearfix">
					<!--你看过的电影-->
					<div>
						<p>
							<a href="http://www.189mv.cn/movie/30071/"><img
								src="./我的院线通-个人中心_files/fdc2985666cc2930a740cc6a64017d52_HB1_42379.jpg"
								width="130" height="180"></a>
						</p>
						<p style="margin-bottom: 15px; margin-top: 12px;">毛丰美</p>
					</div>

					<div>
						<p>
							<a href="http://www.189mv.cn/movie/30070/"><img
								src="<%=request.getContextPath()%>/images/b00e2b10e24f31771d1492a4d70296ac_HB1_42375.jpg"
								width="130" height="180"></a>
						</p>
						<p style="margin-bottom: 15px; margin-top: 12px;">上海王2</p>
					</div>

					<div>
						<p>
							<a href="http://www.189mv.cn/movie/27309/"><img
								src="<%=request.getContextPath()%>/images/faa64dccc9ae92ecae24bbd52561d7d9_HB1_33527.jpg"
								width="130" height="180"></a>
						</p>
						<p style="margin-bottom: 15px; margin-top: 12px;">美好的意外</p>
					</div>

					<div>
						<p>
							<a href="http://www.189mv.cn/movie/30072/"><img
								src="<%=request.getContextPath()%>/images/bfd0de382def2ec4a209278a3f8e4326_HB1_42381.jpg"
								width="130" height="180"></a>
						</p>
						<p style="margin-bottom: 15px; margin-top: 12px;">追击</p>
					</div>

					<div>
						<p>
							<a href="http://www.189mv.cn/movie/29830/"><img
								src="<%=request.getContextPath()%>/images/107d69f2649f2a59ea0d93f8d829166b_HB1_41736.jpg"
								width="130" height="180"></a>
						</p>
						<p style="margin-bottom: 15px; margin-top: 12px;">美女与野兽</p>
					</div>

				</div>
				<!--你看过的电影End-->
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



	<script type="text/javascript">
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "//hm.baidu.com/hm.js?f3a470502268bd255498a2e6bd23f8d4";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</script>

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
	<div class="reset_c_tips cotr-pop" style="display: none;" id="zz_mail2">
		<div class="c_tips_cont">
			<a href="javascript:void(0)" class="c_close" id="mail_close">关闭</a>
			<h3 class="tip_h3">更改邮箱！</h3>
			<div class="tablePw">
				<table>
					<tbody>
						<tr>
							<td class="left"><span>密码：</span></td>
							<td class="right"><input type="password" id="pwd"><span
								id="pwd_msg"></span></td>
						</tr>

						<tr>
							<td class="left"><span>邮箱：</span></td>
							<td class="right"><input type="text" id="email"><span
								id="email_msg"></span></td>
						</tr>
						<tr>
							<td colspan="2" align="center">我们将会给您的绑定邮箱发送一封邮件，请点击邮件中的地址确认。</td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="c_tips_btn" style="margin-top: 20px;">
				<a href="javascript:void(0)"
					style="width: 60px; letter-spacing: 4px;" onclick="saveMailBtn();">确定</a>
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

			$.ajax({
				url : 'http://www.189mv.cn/queryPoints.htm',
				dataType : 'json',
				data : {},
				sync : false,
				type : 'post',
				success : function(json) {

					$("#pointBalance").html("电信积分:" + json.pointBalance);

				},
				error : function(json) {
					$("#pointBalance").html("电信积分:0");
					//showTips("系统错误");
				}
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
		var pwdreg = /^([a-zA-Z]|[0-9]){6,12}$/;
		function saveMailBtn() {

			var pwd = $.trim($("#pwd").val());
			var email = $.trim($("#email").val());
			$("#pwd_msg").text("");
			$("#email_msg").text("");
			if (pwd == "") {

				$("#pwd_msg").text("密码不能为空!");
				$("#pwd_msg").css("color", "red");
				return;
			}
			if (email == "") {

				$("#email_msg").text("邮箱不能为空!");
				$("#email_msg").css("color", "red");
				return;
			}
			var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
			if (!pattern.test(email)) {

				$("#email_msg").text("邮箱格式错误!");
				$("#email_msg").css("color", "red");
				return;
			}
			loading();
			$.ajax({
				url : "http://www.189mv.cn/changeMail.htm",
				dataType : "json",
				cache : false,
				async : false,
				type : "POST",
				data : {
					"pwd" : pwd,
					"email" : email
				},
				success : function(json) {

					var result = json.result;
					if (result == "00") {
						hideLoading();
						//$("#showemail").html(email);
						showTips(json.reason);

						hideCoverAll();
						$("#zz_mail2").hide();
					} else if (result == "505") {
						hideLoading();
						window.location.href = "http://www.189mv.cn/";
					} else {
						$("#email_msg").text(json.reason);
						$("#email_msg").css("color", "red");
					}
				},
				error : function(json) {
					hideLoading();
					$("#email_msg").text("亲，服务出现了点小问题… 请重新尝试");
					$("#email_msg").css("color", "red");

				}
			});

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

			if (!pwdreg.test(newpwd)) {
				$("#newpwd_msg").text("密码由6~12位(字母、数字)组成，区分大小写");
				$("#newpwd_msg").css("color", "red");
				return;
			}

			if (!pwdreg.test(newpwd2)) {

				$("#newpwd2_msg").text("密码由6~12位(字母、数字)组成，区分大小写");
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