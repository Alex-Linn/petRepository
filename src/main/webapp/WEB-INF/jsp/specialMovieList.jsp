<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<!-- saved from url=(0026)http://www.189mv.cn/movie/ -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="application-name" content="院线通">
<meta name="title" content="院线通">
<title>电影比较平台</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link href="<%=request.getContextPath()%>/css/public.css"
	type="text/css" rel="stylesheet">
<link href="http://www.189mv.cn/web/style/list.css?version=6.2"
	type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="head.jsp" />
	<div class="wrapper">
		<div class="crumbs mart10">
			您的位置：<a href="http://www.189mv.cn/">电影比价平台</a> &gt; <span>个性化推荐</span>
		</div>
	</div>
	<div class="wrapper">
		<div class="hot_film com_b mart10 fix top-film">
			<div class="film-tab">
				<ul id="filmTab">
					<li><a href="javascript:void(0);" class="cur">个性化推荐</a></li>
				</ul>
			</div>

			<div id="section-cont">
				<div class="section hot-section" id="hotfilmsection"
					style="min-height: 300px; display: block;">
					<p class="total-film">
						共<span class="num">14</span>部影片上映
					</p>
					<div class="hot-line">
						<div class="hot-cont">
							<ul class="JQ-slide-content pic_lsit fix">
								<c:forEach items="${movieList}" var="movie">
									<li><a
										href="<%=request.getContextPath()%>/mt/movieDetail?movieId=${movie.id}"
										class="pic" title="${movie.movieName }"><img
											src="${movie.posterUrl}" width="137" height="170"></a>

										<div class="con">
											<h3>
												<a
													href="<%=request.getContextPath()%>/mt/movieDetail?movieId=${movie.id}"
													class="blue" title="${movie.movieName }">${movie.movieName }</a>
											</h3>
											<div class="s">
												<span class="star"> <span class="star_now"
													style="width: 82%"></span>
												</span> <em class="score">${movie.score}</em>
											</div>
										</div></li>
								</c:forEach>


							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer" class="fix">
		
		<ul>

			<li>客服电话：1877091266<br>电影比价平台<br>Copyright©
				2017 许望禄 版权所有
			</li>
		</ul>
	</div>
</body>
</html>