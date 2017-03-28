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
			您的位置：<a href="http://www.189mv.cn/">电影比价平台</a> &gt; 我的信息
		</div>
	</div>
	<!--当前显示-->
	<!--当前显示-->
	<div class="myITVcontent10 clearfix">
		<!--内容区Start-->
		<div class="side">
			<!--左-->
			<div class="listContent">
				<h3>
					我的信息
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
								<h3>我的资料</h3>
								<div class="left">
									<p>
										<img src="<%=request.getContextPath()%>/images/ele_07.jpg"
											width="170" height="170">
									</p>
									<p class="loadPic my-changeInfo clearfix">
										<a href="http://www.189mv.cn/memberManager.htm"
											class="myYxtCha">更换头像</a>
									</p>

								</div>

								<div class="right">
									<p class="clearfix">
										<span class="leftLabel">登录账号：</span> <span
											style="color: #ff6600; font-weight: bold;">${u.userName}</span>
									</p>
									<p class="clearfix">
										<span class="leftLabel">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</span>
										<span style="color: #ff6600; font-weight: bold;">${u.userEmail}</span>
									</p>
									<p class="clearfix">
										<span class="leftLabel">喜欢电影类型：</span> <span
											style="color: #ff6600; font-weight: bold;">${u.userHobby}</span>
									</p>
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
	



	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/common.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/myITV.js"></script>
	<script type="text/javascript">
	
	</script>
</body>
</html>