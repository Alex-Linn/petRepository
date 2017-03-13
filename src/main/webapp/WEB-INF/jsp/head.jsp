<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
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
						<img
							src="<%=request.getContextPath() %>/images/loading26.gif">
					</div>
				</div>

			</div>
			<!--城市选择-->
			<div class="t_nav" id="userstatediv">
				<a href="<%=request.getContextPath() %>/mt/loadUserInfo">${user.userName}</a> | <a
					href="<%=request.getContextPath() %>/mt/loadUserInfo" class="blue">我的个人中心</a> | <a
					href="<%=request.getContextPath() %>/mt/logout">退出</a> | <a
					href="javascript:void(0);" target="_blank">帮助</a>
			</div>
		</div>
	</div>

	<div class="b_blue">
		<div class="main_nav">
			<ul class="m_nav_list fix">
				<li class="home"><a href="<%=request.getContextPath() %>/mt/loadIndex">首页</a></li>
				<li><a href="<%=request.getContextPath() %>/mt/loadMovieList">正在热映电影</a></li>
				<li><a href="<%=request.getContextPath() %>/mt/loadMovieList">即将上映电影</a></li>
				<li><a href="<%=request.getContextPath() %>/mt/loadCinemaList">影院</a></li>
				<li><a href="<%=request.getContextPath() %>/mt/loadNews">电影资讯</a></li>
				<li><a href="<%=request.getContextPath() %>/mt/loadDiscount">优惠信息</a></li>
				<li><a href="<%=request.getContextPath() %>/mt/help"
					style="padding: 0px 20px;">帮助</a></li>
			</ul>
		</div>
	</div>