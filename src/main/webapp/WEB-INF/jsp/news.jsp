<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="<%=request.getContextPath()%>/css/index.css"
	type="text/css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/hm.js"></script>
</head>
<body>
	<jsp:include page="head.jsp" />
	<div class="wrapper"></div>
	<!--广告-->
	<div class="wrapper fix">
		<div class="mart hot_news_829 com_b">
			<div class="hot_news_inner">
				<div class="h_txt">
					<h2>热门新闻</h2>
					<a href="http://www.189mv.cn/news/"  class="more"
						id="more">更多&gt;&gt;</a>
				</div>
				<div class="news_cont fix">
					<div class="news_l">


						<div class="pic">
							<a href="<%=request.getContextPath() %>/mt/loadNews?id=${newsList[0].id}" ><img
								src="${newsList[0].newPicture}"
								alt="新闻" height="202" width="344"></a>
						</div>
						<div class="cont">
							<h3 class="blue">
								<a href="<%=request.getContextPath() %>/mt/loadNews?id=${newsList[0].id}" >${newsList[0].newTitle}</a>
							</h3>
							<p>
								${newsList[0].newWebsite} <span class="more">[<a
									href="<%=request.getContextPath() %>/mt/loadNews?id=${newsList[0].id}" >阅读全文</a>]
								</span>
							</p>

						</div>

					</div>
					
					
					<div class="news_r">
						<c:forEach items="${newsList}" var="news">
						<dl>
							<dt>
								<a href="<%=request.getContextPath() %>/mt/loadNews?id=${news.id}">${news.newTitle}</a>
							</dt>
							<dd>${news.newWebsite},${news.createTime}</dd>
						</dl>
						</c:forEach>

					</div>
				</div>
			</div>
			<!--热点新闻-->

		</div>
		<div class="rw_news com_b mart">
			<div class="h_txt">
				<h2>人物专访</h2>
			</div>
			<div class="rw_cont">

				<dl class="fix">
					<dt class="pic">
						<a title="专访《锦绣缘》黄晓明：我喜欢演霸道总裁"
							href="http://www.189mv.cn/news/13500/"><img
							src="<%=request.getContextPath()%>/images/news_37425.jpg"
							height="90" width="90"></a>
					</dt>
					<dd>
						<h4>
							<a href="http://www.189mv.cn/news/13500/" 
								title="专访《锦绣缘》黄晓明：我喜欢演霸道总裁" class="blue">专访《锦绣缘》黄晓明...</a>
						</h4>
						<p>
							这是他首次担任电视剧出品人，发布会上，黄晓明表现的很卖力，他配合着记...<span class="more">[<a
								href="http://www.189mv.cn/news/13500/">阅读全文</a>]
							</span>
						</p>
					</dd>
				</dl>

				<dl class="fix">
					<dt class="pic">
						<a title="独家专访迪士尼《超能陆战队》主创团队" 
							href="http://www.189mv.cn/news/13439/"><img
							src="<%=request.getContextPath()%>/images/news_37361.jpg"
							height="90" width="90"></a>
					</dt>
					<dd>
						<h4>
							<a href="http://www.189mv.cn/news/13439/" 
								title="独家专访迪士尼《超能陆战队》主创团队" class="blue">独家专访迪士尼《超能...</a>
						</h4>
						<p>
							美国特派记者专赴《超能陆战队》诞生之地——迪士尼动画工作室，与影片中...<span class="more">[<a
								" href="http://www.189mv.cn/news/13439/">阅读全文</a>]
							</span>
						</p>
					</dd>
				</dl>

				<dl class="fix">
					<dt class="pic">
						<a title="专访动画电影《花木兰》导演巴里·库克" "
							href="http://www.189mv.cn/news/13140/"><img
							src="<%=request.getContextPath()%>/images/news_37003.jpg"
							height="90" width="90"></a>
					</dt>
					<dd>
						<h4>
							<a href="http://www.189mv.cn/news/13140/" "
								title="专访动画电影《花木兰》导演巴里·库克" class="blue">专访动画电影《花木兰...</a>
						</h4>
						<p>
							在《花木兰》导演巴里·库克看来，要想让“孙悟空”走向世界，不仅需要大...<span class="more">[<a
								" href="http://www.189mv.cn/news/13140/">阅读全文</a>]
							</span>
						</p>
					</dd>
				</dl>

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
		src="<%=request.getContextPath()%>/js/des.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/common.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/index.js"></script>
</body>
</html>