<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="application-name" content="院线通">
<meta name="title" content="院线通">
<title>电影比价平台-首页</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="dns-prefetch" href="http://www.189mv.cn/">
<link rel="dns-prefetch" href="http://image.189mv.cn/">
<link href="<%=request.getContextPath()%>/css/public.css"
	type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/index.css" type="text/css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/page.css" type="text/css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/hm.js"></script>
<script type="text/javascript">
	//热门影片
</script>
</head>
<body>
	<jsp:include page="head.jsp" />
	<!--end 导航-->

	<div class="wrapper">
		<div class="crumbs mart10">
			您的位置：<a href="http://www.189mv.cn/">院线通</a> &gt;<a
				href="http://www.189mv.cn/news/">电影资讯</a> &gt; <span>资讯详情</span>
		</div>
	</div>
	<div class="wrapper fix">
		<div class="zx_wrapper mart10 com_b">

			<h1 class="txt">2016年11月内地影市前瞻</h1>
			<div class="infos infos_828">

				<span class="t"> </span>
			</div>
			<div class="dec">
				<strong>【导语】</strong>${news.newTitle }
			</div>
			<div class="art_h">

				<div>
					<p style="text-align: center">${news.newContext}</p>
				</div>


			</div>
		</div>
		<!--热点新闻-->
		<div class="zx_side mart10 com_b">
			<h2>精彩推荐</h2>
			<div class="zx_tou">
				<div class="pic">
					<img src="${newsList[0].newPicture}" width="274" height="189">
				</div>
				<h4>
					<a
						href="<%=request.getContextPath() %>/mt/loadNews?id=${newsList[0].id}"
						class="blue">${newsList[0].newTitle}</a>
				</h4>
			</div>
			<div class="zx_mlist">
				<ul>
					<c:forEach items="${newsList}" var="news">
						<li>• <a
							href="<%=request.getContextPath() %>/mt/loadNews?id=${news.id}">${news.newTitle}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!--h-->


	<div id="footer" class="fix">
		<p class="frlink">
			友情链接:<a href="http://webmail23.189.cn/webmail/" target="_blank">189邮箱</a>
			| <a href="http://itv.huiyong123.com/" target="_blank">ITV</a> | <a
				href="http://gd.189.cn/" target="_blank">网上营业厅</a> | <a
				href="http://gd.chinavnet.com/" target="_blank">互联星空</a> | <a
				href="http://www.189mv.cn/contactUs/" target="_blank">联系我们</a>
		</p>
		<ul>
			<li>客服电话：4008610001<br>电信及增值业务经营许可证：粤ICP备14020429号<br>Copyright©
				2007—2013 中国电信 版权所有
			</li>
		</ul>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/des.js"></script>
</body>
</html>