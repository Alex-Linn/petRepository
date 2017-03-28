<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<!DOCTYPE html>
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
	<div class="wrapper">
		<div class="crumbs mart10">
			您的位置：<a href="http://www.189mv.cn/">院线通</a> &gt; <span>影院</span>
		</div>
	</div>

	<div class="wrapper fix">
		<div class="cinema_list mart10 com_b">
			<div class="h_txt top-title">
				<h2>
					影院列表 <span class="m">深圳共有<em class="blue">183</em> 家影院
					</span>
				</h2>
				<div class="act_ser search-box">
					<div class="i_so">
						<input type="text" id="keyword" placeholder="搜索影院名字" value=""
							class="search-keyword" name="keyword"> <a
							href="javascript:search();" class="search_btn"></a>
					</div>
				</div>
			</div>
			<div class="cin_com">
				<div class="cin_com_t"></div>
				<div class="cin_comp">
					<div class="cin_area"
						style="border-bottom: none; margin-bottom: 0;">
						<ul class="fix" id="zoneul">
							<c:forEach items="${areaList}" var="area">
								<li><a
									href="<%=request.getContextPath()%>/mt/loadCinemaList?city=深圳&area=${area}"
									class="">${area}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="cin_com_b"></div>
			</div>


			<div id="cinemediv">

				<div class="area_s mart10 com_b">
					<div class="hx_txt" onclick="" style="display: none;">
						<h2 class="cur" id="zonetitle_search"></h2>
					</div>
					<div class="area_c" id="zonediv_search">
						<c:forEach var="cinema" items="${cinemaList}">

							<dl class="area_dl last fix">
								<dt class="pic">
									<a href="<%=request.getContextPath()%>/mt/loadCinema?cinemaId=${cinema.id}"><img
										src="${cinema.picture}" width="263"
										height="168"></a>
								</dt>
								<dd>
									<h3 class="txt">
										<a href="<%=request.getContextPath()%>/mt/loadCinema?cinemaId=${cinema.id}">${cinema.cinemaName}</a>
									</h3>

									<p class="p">
										${cinema.address}<a
											href="${cinema.mapInfo}"
											class="map blue">查看地图&gt;&gt;</a>
									</p>


									<p class="p">电话:${cinema.tel}</p>

									<div class="clear"></div>
									<p class="p" style="margin-top: 15px;">${cinema.introduction }</p>
								</dd>
							</dl>
						</c:forEach>
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

	<div class="c_tips" id="warntips" style="width: 364px; display: none;">
		<div class="c_tips_cont">
			<a href="javascript:void(0);" class="c_close">关闭</a>
			<h3 class="f_tip_txt">温馨提示</h3>
			<div class="ct_wrapper">
				<p class="vred" id="tipsmsg"></p>
			</div>
			<div class="c_tips_btn" id="tipsbotton"></div>
		</div>
	</div>
	<div class="waiting-pop" id="waitingPop" style="display: none;">
		<div class="waiting-con"></div>
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

	<div class="adrPop" id="map_pop">
		<div style="padding: 27px;">
			<a href="javascript:void(0);" class="pop_close" id="close_map">关闭</a>
			<div id="map_canvas" class="mapCon"></div>
		</div>
	</div>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/common.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/api"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/getscript"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/getscript(1)"></script>
	<script type="text/javascript">
		
		function showZone(zone) {
			var clz = $.trim($("#zonetitle_" + zone).attr("class"));
			if ("cur" == clz) {
				$("#zonetitle_" + zone).removeClass("cur");
				$("#zonediv_" + zone).hide();
			} else {
				$(".hx_txt h2").removeClass("cur");
				$(".area_c").hide();
				$("#zonetitle_" + zone).addClass("cur");
				$("#zonediv_" + zone).show();
			}
		}

		function showMap(longitude, latitude, addr, cname) {
			// latitude=23.1782;
			// longitude=113.273009;
			//显示电子地图区域
			showCoverAll();
			$("#map_pop").fadeIn("slow");
			//alert(longitude + " : " + latitude);
			var map = new BMap.Map("map_canvas");
			var point = new BMap.Point(longitude, latitude);
			var marker = new BMap.Marker(point);
			map.centerAndZoom(point, 15);
			map.addOverlay(marker);
			map.enableScrollWheelZoom();//启用滚轮放大缩小
			map.addControl(new BMap.NavigationControl());//添加默认缩放平移控件
			var ss = '<div style="padding-right:10px;text-align:center;font-size:12px;color:#666;line-height:20px;width:210px;">'
					+ addr + '<br />' + cname + '</div>';
			var infoWindow = new BMap.InfoWindow(ss); // 创建信息窗口对象
			marker.addEventListener("mouseover", function() {
				this.openInfoWindow(infoWindow);
			});
		}

		function closeMap() {
			hideCoverAll();
			$("#map_pop").hide();
		}

		$(document).ready(function() {
			$("#close_map").click(function() {
				closeMap();
			});

			$("#keyword").keyup(function(event) {
				var keycode = event.which;
				if (keycode == 13) {
					search();
				}
			});
		});
	</script>
</body>
</html>