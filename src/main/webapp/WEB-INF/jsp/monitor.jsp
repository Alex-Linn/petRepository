<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-tanguage" content="zh-CN">
<title>后台管理</title>
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
			</div>
			<div class="turn_city fl">
				<div id="select_city_sub_menu" class="city popres t_c_list"
					style="display: none;">
					<div class="loading_city" style="display: none" id="loadingCity">
						<img src="./我的院线通-我的订单_files/loading26.gif">
					</div>
				</div>

			</div>
			<!--城市选择-->
			<div class="t_nav" id="userstatediv">
				<a href="javascript:void(0);">${admin.userName}</a>  <a
					href="<%=request.getContextPath()%>/mt/Adminlogout">退出</a> | <a
					href="http://www.189mv.cn/help/" target="_blank">帮助</a>
			</div>
		</div>
	</div>

	<div class="b_blue">
		<div class="main_nav">
			<ul class="m_nav_list fix">
				<li class="home"><a
							href="<%=request.getContextPath()%>/mt/commentList">影评管理</a></li>
						<li><a href="<%=request.getContextPath()%>/mt/toAdminNotice">公告管理</a></li>
						<li><a href="<%=request.getContextPath()%>/mt/monitor">爬虫监控</a></li>
			</ul>
		</div>
	</div>
	<!--end 导航-->
	<div class="wrapper">
		<div class="crumbs mart10">
			您的位置：<a href="http://www.189mv.cn/">后台管理系统</a> <span>爬虫监控</span>
		</div>
	</div>
	<!--当前显示-->
	<div class="myITVcontent6 clearfix">
		<!--内容区Start-->
		<div class="side">
			<!--左-->
			<div class="listContent">
				<h3>
					<a href="http://www.189mv.cn/home/">后台管理平台</a>
				</h3>
				<div class="sonList">
					<h4>我的账户</h4>
					<ul id="leftBarCon1">
						<li class="home"><a
							href="<%=request.getContextPath()%>/mt/commentList">影评管理</a></li>
						<li><a href="<%=request.getContextPath()%>/mt/toAdminNotice">公告管理</a></li>
						<li><a href="<%=request.getContextPath()%>/mt/monitor">爬虫监控</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="ContentR">
			<!--右-->
			<div class="mainContent">
				<div class="mainTitle clearfix">
					<!--标题-->
					<h3>爬虫监控</h3>
				</div>
				<!--标题End-->
				<div class="detailContent">
					<!--详细内容-->
					<div class="content1">
						<div class="tableList">
							<table class="table1" width="700" border="0" cellpadding="0"
								cellspacing="0">
								<tbody>
									<tr>
										<th style="width: 40%;">爬虫类型</th>
										<th style="width: 22%;">爬取数量</th>
										<th style="width: 20%;">爬取时间</th>
										<th style="width: 18%">操作</th>
									</tr>



									<tr id="nogroupontr">
										<td style="width: 40%;">电影信息爬虫</td>
										<td style="width: 22%;">${mCrawler.num}</td>
										<td style="width: 20%;"><fmt:formatDate value="${mCrawler.date}" pattern="yyyy/MM/dd"/></td>
										<td style="width: 18%">成功</td>
									</tr>

								</tbody>
							</table>


						</div>
						<div class="clean"></div>
					</div>
					<div class="content1">
						<div class="tableList">
							<table class="table1" width="700" border="0" cellpadding="0"
								cellspacing="0">
								<tbody>
									<tr>
										<th style="width: 40%;">爬虫类型</th>
										<th style="width: 22%;">爬取数量</th>
										<th style="width: 20%;">爬取时间</th>
										<th style="width: 18%">操作</th>
									</tr>



									<tr id="nogroupontr">
										<td style="width: 40%;">影院信息爬虫</td>
										<td style="width: 22%;">${cCrawler.num}</td>
										<td style="width: 20%;"><fmt:formatDate value="${cCrawler.date}" pattern="yyyy/MM/dd"/></td>
										<td style="width: 18%">成功</td>
									</tr>

								</tbody>
							</table>


						</div>
						<div class="clean"></div>
					</div>
					
					<div class="content1">
						<div class="tableList">
							<table class="table1" width="700" border="0" cellpadding="0"
								cellspacing="0">
								<tbody>
									<tr>
										<th style="width: 40%;">爬虫类型</th>
										<th style="width: 22%;">爬取数量</th>
										<th style="width: 20%;">爬取时间</th>
										<th style="width: 18%">操作</th>
									</tr>



									<tr id="nogroupontr">
										<td style="width: 40%;">影院信息爬虫</td>
										<td style="width: 22%;">${sCrawler.num}</td>
										<td style="width: 20%;"><fmt:formatDate value="${sCrawler.date}" pattern="yyyy/MM/dd"/></td>
										<td style="width: 18%">成功</td>
									</tr>

								</tbody>
							</table>


						</div>
						<div class="clean"></div>
					</div>

					<div class="content1">
						<div class="tableList">
							<table class="table1" width="700" border="0" cellpadding="0"
								cellspacing="0">
								<tbody>
									<tr>
										<th style="width: 40%;">爬虫类型</th>
										<th style="width: 22%;">爬取数量</th>
										<th style="width: 20%;">爬取时间</th>
										<th style="width: 18%">操作</th>
									</tr>



									<tr id="nogroupontr">
										<td style="width: 40%;">新闻资讯爬虫</td>
										<td style="width: 22%;">${nCrawler.num}</td>
										<td style="width: 20%;"><fmt:formatDate value="${nCrawler.date}" pattern="yyyy/MM/dd"/></td>
										<td style="width: 18%">成功</td>
									</tr>
								</tbody>
							</table>


						</div>
						<div class="clean"></div>
					</div>
					
					<div class="content1">
						<div class="tableList">
							<table class="table1" width="700" border="0" cellpadding="0"
								cellspacing="0">
								<tbody>
									<tr>
										<th style="width: 40%;">爬虫类型</th>
										<th style="width: 22%;">爬取数量</th>
										<th style="width: 20%;">爬取时间</th>
										<th style="width: 18%">操作</th>
									</tr>



									<tr id="nogroupontr">
										<td style="width: 40%;">优惠信息爬虫</td>
										<td style="width: 22%;">${dCrawler.num}</td>
										<td style="width: 20%;"><fmt:formatDate value="${dCrawler.date}" pattern="yyyy/MM/dd"/></td>
										<td style="width: 18%">成功</td>
									</tr>
								</tbody>
							</table>


						</div>
						<div class="clean"></div>
					</div>
					<!--内容1End-->
				</div>
				<!--详细内容End-->
			</div>
		</div>
	</div>
	<!--右End-->
	<div id="footer" class="fix">
		<p class="frlink">
			友情链接:<a href="http://webmail23.189.cn/webmail/" target="_blank">189邮箱</a>
			| <a href="http://itv.huiyong123.com/" target="_blank">ITV</a> | <a
				href="http://gd.189.cn/" target="_blank">网上营业厅</a> | <a
				href="http://gd.chinavnet.com/" target="_blank">互联星空</a> | <a
				href="http://www.189mv.cn/contactUs/" target="_blank">联系我们</a>
		</p>
		<ul>

			<li>客服电话：4008610001<br> <br>Copyright© 2007—2013
				电影比价平台版权所有
			</li>
		</ul>
	</div>
</body>
</html>