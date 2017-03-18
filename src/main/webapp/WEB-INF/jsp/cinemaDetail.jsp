<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>院线通-深圳电影院</title>
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
			您的位置：<a href="http://www.189mv.cn/">电影比价平台</a> &gt; <a
				href="http://www.189mv.cn/cinema/">影院</a> &gt; <span>${cinema.cinemaName}</span>
		</div>
	</div>

	<div class="wrapper fix">
		<div class="cinema_list mart10 com_b"  style=" height:1000px;padding: 12px 25px;">
			<div class="m_ci fix">
				<div class="m_ci_picshow fl">
					<div id="spec-n1" class="m_ci_bigimg">
						<img id="cinemaimage" src="${cinema.picture}" width="263"
							height="168">
					</div>

					<div id="spec-n5" class="m_ci_tumb_img fix" style="display: none;">
						<div id="spec-left" class="m_ci_t_pre"></div>
						<div id="spec-list" class="m_ci_t_cont">
							<ul id="cinemalistul"></ul>
						</div>
						<div id="spec-right" class="m_ci_t_next"></div>
					</div>
				</div>
				<div class="m_ci_cont fr">
					<h2>
						${cinema.cinemaName}<span class="s"></span>
					</h2>
					<div class="m_ci_addrres">
						<ul>

							<li>${cinema.address}<a
								href="javascript:showCinemaMap(&#39;null&#39;,&#39;null&#39;,&#39;南昌市东湖区佘山路66号樟树林9号楼3层&#39;,&#39;星美国际影城-南昌樟树林店&#39;);"
								class="map">电子地图&gt;&gt;</a></li>

							<!-- <li>营业时间：09:50 - 23:40</li> -->
							<li class="lastBar">
								<div class="detailSome">电话：${cinema.tel}</div>
								<div class="detailSome">介绍：${cinema.introduction}</div>
								<div class="detailAll" id="detailAll">详细信息：${cinema.cinemaDesc}</div>
							</li>
						</ul>
					</div>


				</div>
			</div>
			<div class="h_txt">
				<h2>电影排期</h2>
			</div>

			<div class="cin_s" id="cinemashowdiv">
				<div id="gd_cont" class="gd_cont">
					<div class="JQ-slide-nav"></div>
					<div class="gd_slide_cont">
						<ul class="JQ-slide-content pic_lsit fix"
							style="width: 1020px; left: 0px;">
							<c:forEach items="${movieList}" var="movie">
								<li><a
									href="<%=request.getContextPath()%>/mt/movieDetail?movieId=${movie.id}"
									id="hit_29790" class="pic"
									style="border: 1px solid rgb(204, 204, 204);"><img
										src="${movie.posterUrl}" width="137" height="170"></a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
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
</body>
</html>