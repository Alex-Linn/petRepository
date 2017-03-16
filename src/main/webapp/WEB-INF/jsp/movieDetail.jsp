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
<title>电影比价平台</title>
<meta name="keywords"
	content="金刚狼3：殊死一战,剧情介绍,预告片,上映日期,电影海报,影评,导演,主演(休·杰克曼 / 帕特里克·斯图尔特 / 波伊德·霍布鲁克 / 理查德·E·格兰特 / 斯戴芬·莫昌特)">
<link
	href="<%=request.getContextPath()%>/css/public.css"
	type="text/css" rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/css/list.css"
	type="text/css" rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/js/hm.js"></script>
<script type="text/javascript">
	function showYinping() {
	}
</script>
<script
	src="<%=request.getContextPath()%>/js/share.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/share_style0_16.css">
</head>
<body>
	<jsp:include page="head.jsp" />
	<!--end 导航-->
	<div class="wrapper">
		<div class="crumbs mart10">
			您的位置：<a href="http://www.189mv.cn/">电影比价平台</a> &gt;<a
				href="http://www.189mv.cn/movie/">电影</a> &gt; <span>${movie.movieName}</span>
		</div>
	</div>
	<div class="wrapper">
		<div class="hot_film com_b mart10 fix">
			<div class="tx_film fl">
				<div class="playOuter" id="playVideo">
					<a href="javascript:void(0);" class="p"><img
						src="${movie.posterUrl}"
						height="216" width="352"></a>

					<div class="playBtn">
						<a class="btn" href="javascript:void(0)" style="display: block;"
							id="filmUrl"></a>
					</div>

				</div>
			</div>
			<input name="viewId" id="filmViewId" value="14990" type="hidden">
			<div class="ct fr">
				<div class="c">
					<h4 style="width: 200px">${movie.movieName}</h4>
				</div>
				<div class="hu">
					<ul>
						<li>导演:${movie.director}</li>
						<li>主演:${movie.performer}</li>
						<li>语言:${movie.movieLanguage}</li>
						<li>片长:${movie.movieTime}</li>

						<li>${movie.rescheduledTime}</li>

						<li class="pf fix"><span class="fl">评分:${movie.score}</span>
						</li>
								
					</ul>
					
				</div>
			</div>
		</div>
	</div>
	<div class="wrapper fix">
		<div class="hot_cont mart10">
			<div class="com_b com_no ">
				<div class="h_s_sel border1">
					<ul class="fix" id="fixtabul">

						<li><a href="javascript:chgTab(this,'tab1');" id="lia_tab1"
							class="cur">选座购票</a></li>

						<li><a href="javascript:chgTab(this,'tab2');" id="lia_tab2"
							class="">影片详情</a></li>


						<li><a href="javascript:chgTab(this,'tab3');" id="lia_tab3"
							class="w">影评</a></li>

					</ul>
					<div class="clear"></div>
				</div>



				<div id="movie_tab1" style="display: block;">
					<div class="h_s_cin com_border">
					<!-- 	<div class="cin_select">
							<div class="cin_tabs cin_tabs_x cin_tabs_723">
								<ul class="fix" id="showdateul">

									<li class="cur" onclick="chgShowDate(this,'2017-03-14');"><p>今天</p>
										<p>（3月14日）</p></li>

									<li class="last_li" onclick="chgShowDate(this,'2017-03-15');"><p>明天</p>
										<p>（3月15日）</p></li>

								</ul>
							</div>

						</div> -->

						<div class="cin_com">
							<div class="cin_com_t"></div>
							<div class="cin_s">
								<div class="cin_comp">
									<div class="cin_area cin_area_723">
										<ul class="fix" id="arealistul">
											<li><a href="javascript:showAreaCinema('allcinema');"
												id="allcinema" class="">全部影院</a></li>

											<li><a href="javascript:showAreaCinema('360102');"
												id="360102">东湖区</a></li>

											<li><a href="javascript:showAreaCinema('360111');"
												id="360111">青山湖区</a></li>

											<li><a href="javascript:showAreaCinema('360121');"
												id="360121">南昌县</a></li>

											<li><a href="javascript:showAreaCinema('360122');"
												id="360122">新建县</a></li>

											<li><a href="javascript:showAreaCinema('360199');"
												id="360199">红谷滩区</a></li>

										</ul>
									</div>
									<div class="cin_area cin_f_reset reset-cin">
										<ul class="fix" id="cinemalistul">

											<li style=""><a style="overflow: hidden;"
												title="南昌17.5影城-胜利店"
												href="javascript:showCinema('sp01936011101');">南昌17.5影城-胜利店</a></li>

										</ul>
									</div>
								</div>
								<div class="cin_com_b"></div>

								<div class="cin_s_btn" style="display: none;" id="showAllCinema">
									<a href="javascript:void(0)" onclick="showAllCinema()"
										id="showAll">全部展开</a>
								</div>
							</div>
						</div>

					</div>

					<div class="graybg">
						<div class="area_s  border1 mart10" id="mart_div"
							style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; display: block;">
							<div class="hx_cin">
								<div class="hs_com" id="show_div">
									<div class="hs_mtxt fix">
										<span class="reset-828"><a
											href="http://www.189mv.cn/cinema/sp01936011101/">南昌17.5影城-胜利店</a></span><span
											class="adress-828">东湖区胜利路263号炫谷青年街三层</span>
									</div>
									<div class="fw_show" id="cfilmype_sp01936011101">
										<a id="cfilmype_sp01936011101_2D"
											href="javascript:chgFilmAttr('sp01936011101','2D');"
											class="cur">2D</a>
									</div>
									<div class="mdcont fix">
										<div class="mdcont_l fix" style="width: 688px;">
											<div class="md_times" id="cshow_sp01936011101_2D_0"
												onclick="qrySeats('sp01936011101','01027548556','');"
												style="margin-right: 10px;">
												<div class="md_mtime">10:45</div>
												<div class="md_mt md_mt_715" title="四号厅">四号厅</div>
												<div class="md_com md_com_1">
													<span class="cdcare">钻/金卡价</span><span class="price">30元</span>
												</div>
												<div class="md_com md_com_2">
													<span class="cdcare">银卡价</span><span class="price">30元</span>
												</div>
												<div class="md_com md_com_3">
													<span class="cdcare">影院价</span><span class="price price_1">--</span>
												</div>
											</div>
											
											<div class="md_times" id="cshow_sp01936011101_2D_6"
												onclick="qrySeats('sp01936011101','01027548584','');"
												style="margin-right: 10px;">
												<div class="md_mtime">21:50</div>
												<div class="md_mt md_mt_715" title="五号厅">五号厅</div>
												<div class="md_com md_com_1">
													<span class="cdcare">钻/金卡价</span><span class="price">30元</span>
												</div>
												<div class="md_com md_com_2">
													<span class="cdcare">银卡价</span><span class="price">30元</span>
												</div>
												<div class="md_com md_com_3">
													<span class="cdcare">影院价</span><span class="price price_1">--</span>
												</div>
											</div>
											<div class="clea"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<p id="nodata" class="nodata border3 mar_pad"
						style="display: none;">无符合条件的影院</p>
					<p id="qryshowloading" class="nodata border3 mar_pad"
						style="display: none;">
						<img
							src="%E9%99%A2%E7%BA%BF%E9%80%9A-%E9%87%91%E5%88%9A%E7%8B%BC3%EF%BC%9A%E6%AE%8A%E6%AD%BB%E4%B8%80%E6%88%98_files/loading.gif">
					</p>

					<script type="text/javascript">
						cinemaList = [ {
							"cinemaId" : "sp01936011101",
							"cinemaName" : "南昌17.5影城-胜利店",
							"countyCode" : "360102",
							"countyName" : "东湖区",
							"showCnt" : 0,
							"type" : "1"
						}, {
							"cinemaId" : "sp0313282",
							"cinemaName" : "冷杉欢腾影城上海北路店",
							"countyCode" : "360111",
							"countyName" : "青山湖区",
							"showCnt" : 0,
							"type" : "0"
						}, {
							"cinemaId" : "sp019CMT36014601",
							"cinemaName" : "南昌冷杉欢腾影城",
							"countyCode" : "360111",
							"countyName" : "青山湖区",
							"showCnt" : 0,
							"type" : "0"
						}, {
							"cinemaId" : "sp019DD36014301",
							"cinemaName" : "南昌越幕影院莲塘路店",
							"countyCode" : "360121",
							"countyName" : "南昌县",
							"showCnt" : 0,
							"type" : "0"
						}, {
							"cinemaId" : "sp019CMT36012801",
							"cinemaName" : "星美国际影城-南昌红谷新城店",
							"countyCode" : "360122",
							"countyName" : "新建县",
							"showCnt" : 0,
							"type" : "0"
						}, {
							"cinemaId" : "sp01936011201",
							"cinemaName" : "南昌17.5影城-乐买佳店",
							"countyCode" : "360122",
							"countyName" : "新建县",
							"showCnt" : 0,
							"type" : "0"
						}, {
							"cinemaId" : "sp019VS121113",
							"cinemaName" : "南昌金逸影城-红谷滩店",
							"countyCode" : "360199",
							"countyName" : "红谷滩区",
							"showCnt" : 0,
							"type" : "0"
						} ];

						$("#moreFilm").click(function() {
							if ($(this).next("div").is(":hidden")) {
								$(this).next("div").show();
								$(this).parent().addClass("cur");
							} else {
								$(this).next("div").hide();
								$(this).parent().removeClass("cur");
							}
						});
					</script>
				</div>


				<!-- 影片详情部分-开始 -->
				<div class="border3" id="movie_tab2" style="display: none;">
					<div class="xq_com">
						<div class="u_jq">
							<h4>剧情简介</h4>
							<div class="u_jq_cont">

								<span id="some_1"><br>${movie.movieStory}
								</span><span id="total_1" style="display: none;">【温馨提示】小学生及学龄前儿童应在家长陪同下观看。<br>${movie.movieStory}
								</span> <a href="javascript:void(0)" class="blue" onclick="showall()"
									id="juqing_1">展开&gt;&gt;</a>

							</div>
						</div>
						<div class="u_pl">
							<h4>综合评论</h4>
							<div class="u_pl_cont">
								${movie.movieStory}
							</div>
						</div>

						<div class="u_jz">
							<h4>剧照</h4>
							<div id="h_n_col_1" class="u_jz_col" style="display: block;">
								<div class="JQ-slide-nav">
									<a class="prev" href="javascript:void(0);">‹</a> <a
										class="next" href="javascript:void(0);">›</a>
								</div>
								<div class="u_jz_cont">
									<ul class="JQ-slide-content fix" style="width: 4592px;">

										<li><a href="javascript:void(0);" class="film-Img curImg"><img
												src="${movie.posterUrl}"
												height="98" width="150"></a></li>
									</ul>
								</div>
							</div>
						</div>

					</div>
				</div>

				<!-- 影片详情部分-结束 -->

				<!-- 影评部分-开始 -->
				<div class="" id="movie_tab3" style="display: none;">
					<div class="hot_cmt">
						<div class="cmt_comment">
							<h3 class="cmt_h3">写影评</h3>
							<div class="cmt_tar">
								<textarea name="" class="cmt_textarea toLogin" cols="" rows=""
									id="discuss-300" onclick="toLogin(this)"></textarea>
							</div>
							<div id="msgTime"></div>
							<div class="cmt_stxt">
								<span class="t">我给<strong class="red" id="filmName">${movie.movieName}</strong>打分
								</span> <span id="hitscore" style="float: left; margin-top: 5px;">
								</span>
								<div class="cmt_fbtn">
									<span class="counts">还可以输入<em id="textCount-300">140</em>字
									</span> <input class="btn" id="submitCritic" onclick="submitCritics()"
										value="发表评论" style="cursor: pointer;" type="button">
								</div>
							</div>
						</div>
						<div class="cmt_wrapper">
							<div class="cmt_ftxt">
								<h3 class="cmt_h3 fl">
									${movie.movieName}-影评(共<span id="totalbar">20</span>条)
								</h3>
								<div class="cmt_sel">
									<ul class="fix" id="changeTab">
										<li class="cur" onclick="calltagPage(this);" id="z"
											style="cursor: pointer;">最 新</li>
										<li onclick="calltagPage(this);" id="r"
											style="cursor: pointer;">热 门</li>
									</ul>
								</div>
							</div>
								<c:forEach items="commentViewList" var="commentView">
								<div class="cmt_acont fix">
									<div style="width: 100%;">
										<span class="ico_face"><img
											src="${commentView.userPicture}"
											height="52" width="52"></span>
										<div class="cmt_cont">
											<p class="cmt_hd">
												<span class="t">${commentView.userTel}</span>
											</p>
											<div class="cmt_bd">
												<p style="word-break: break-all; word-wrap: break-word">${commentView.comment}</p>
											</div>
											<div class="cmt_fd fix">
												<div class="art_score fl">
													<em class="score_t fl">评分：${commentView.score}</em><span class="hitscore"><span
														class="scorew" style="width: 100%;"></span></span>
												</div>
												<div class="art_times fl">${commentView.createTime}</div>
												<div class="art_stu fr">
													<span class="cmt_agree" onclick="praiseOrTrod(this)"
														id="praise_43669">赞(<span class="praise_num"
														style="padding: 0px;">1</span>)
													</span><span class="cmt_disagree" onclick="praiseOrTrod(this)"
														id="trod_43669">踩(<span class="trod_num"
														style="padding: 0px;">0</span>)
													</span><span class="cmt_feedback" onclick="toggle(this)"
														id="reply_43669">回复(0)</span>
												</div>
											</div>
											<div class="clear"></div>
											<div id="slide_43669" style="display: none;">
												<div class="top-reply">
													<img
														src="%E9%99%A2%E7%BA%BF%E9%80%9A-%E9%87%91%E5%88%9A%E7%8B%BC3%EF%BC%9A%E6%AE%8A%E6%AD%BB%E4%B8%80%E6%88%98_files/ts_j.jpg"
														height="11" width="24">
												</div>
												<div class="huiFu">
													<div>
														<input name="textfield"
															class="textfield replyRemainNumInput"
															onkeyup="onlyIntegerKeyUp(this,event)"
															onclick="toLogin()" type="text"><input
															name="button1" class="btnReply"
															onclick="submitHuifu(this)" id="button_43669"
															type="button">
														<div class="clear"></div>
														<table style="font-size: 12px;" cellspacing="0"
															cellpadding="0" border="0" width="100%">
															<tbody>
																<tr>
																	<td height="26">共<span id="totalReply_43669">0</span>条
																	</td>
																	<td align="right">还可以输入 <span
																		class="replyRemainNum">140</span> 字
																	</td>
																	<td width="100">&nbsp;</td>
																</tr>
															</tbody>
														</table>
													</div>
													<div id="replyTab_43669"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
							<div class="pagecontrolre">
								<a href="#fixtabul" onclick="javascript:callPage(1,'z')"><font
									color="#F76300">1</font></a><a href="#fixtabul"
									onclick="javascript:callPage(2,'z')">2</a><a href="#fixtabul"
									onclick="javascript:callPage(2,'z')">下一页</a>
							</div>
						</div>

					</div>
				</div>
				<!-- 影评部分-结束 -->

			</div>
		</div>

		<!-- 热门推荐部分 -->
		<div class="hot_z mart10 com_b">
			<h2>热门推荐</h2>

			<div class="hot_z_list">
				<ul class="pic_lsit fix">

					<li class=""><a href="http://www.189mv.cn/movie/29790/"
						class="pic" title="一条狗的使命" target="_blank"><img
							src="%E9%99%A2%E7%BA%BF%E9%80%9A-%E9%87%91%E5%88%9A%E7%8B%BC3%EF%BC%9A%E6%AE%8A%E6%AD%BB%E4%B8%80%E6%88%98_files/f014f945658b3d287a7128021c0d82f1_HB1_41676.jpg"
							height="170" width="137"></a>
						<div class="con">
							<h3>
								<a href="http://www.189mv.cn/movie/29790/" class="blue"
									title="一条狗的使命" target="_blank">一条狗的使命</a>
							</h3>
							<div class="s">
								<span class="star"> <span class="star_now"
									style="width: 82%"></span>
								</span> <em class="score">8.2</em>
							</div>
						</div></li>

					<li class=""><a href="http://www.189mv.cn/movie/29731/"
						class="pic" title="金刚狼3：殊死一战" target="_blank"><img
							src="%E9%99%A2%E7%BA%BF%E9%80%9A-%E9%87%91%E5%88%9A%E7%8B%BC3%EF%BC%9A%E6%AE%8A%E6%AD%BB%E4%B8%80%E6%88%98_files/9850221fec6c4d27a6fb2213e9382203_HB1_42156.jpg"
							height="170" width="137"></a>
						<div class="con">
							<h3>
								<a href="http://www.189mv.cn/movie/29731/" class="blue"
									title="金刚狼3：殊死一战" target="_blank">金刚狼3：殊死一战</a>
							</h3>
							<div class="s">
								<span class="star"> <span class="star_now"
									style="width: 82%"></span>
								</span> <em class="score">8.2</em>
							</div>
						</div></li>

					<li class=""><a href="http://www.189mv.cn/movie/29650/"
						class="pic" title="生化危机：终章" target="_blank"><img
							src="%E9%99%A2%E7%BA%BF%E9%80%9A-%E9%87%91%E5%88%9A%E7%8B%BC3%EF%BC%9A%E6%AE%8A%E6%AD%BB%E4%B8%80%E6%88%98_files/7499965c0fffafc8424c36b8ba37b0d8_HB1_41836.jpg"
							height="170" width="137"></a>
						<div class="con">
							<h3>
								<a href="http://www.189mv.cn/movie/29650/" class="blue"
									title="生化危机：终章" target="_blank">生化危机：终章</a>
							</h3>
							<div class="s">
								<span class="star"> <span class="star_now"
									style="width: 80%"></span>
								</span> <em class="score">8.0</em>
							</div>
						</div></li>

					<li class=""><a href="http://www.189mv.cn/movie/29670/"
						class="pic" title="最终幻想15：王者之剑" target="_blank"><img
							src="%E9%99%A2%E7%BA%BF%E9%80%9A-%E9%87%91%E5%88%9A%E7%8B%BC3%EF%BC%9A%E6%AE%8A%E6%AD%BB%E4%B8%80%E6%88%98_files/8da8d2857fe10a437361f20db18c085d_HB1_41376.jpg"
							height="170" width="137"></a>
						<div class="con">
							<h3>
								<a href="http://www.189mv.cn/movie/29670/" class="blue"
									title="最终幻想15：王者之剑" target="_blank">最终幻想15：王者之剑</a>
							</h3>
							<div class="s">
								<span class="star"> <span class="star_now"
									style="width: 80%"></span>
								</span> <em class="score">8.0</em>
							</div>
						</div></li>

					<li class="last"><a href="http://www.189mv.cn/movie/29952/"
						class="pic" title="天才捕手" target="_blank"><img
							src="%E9%99%A2%E7%BA%BF%E9%80%9A-%E9%87%91%E5%88%9A%E7%8B%BC3%EF%BC%9A%E6%AE%8A%E6%AD%BB%E4%B8%80%E6%88%98_files/63e220b8fe15058141765cff09630c57_HB1_41991.jpg"
							height="170" width="137"></a>
						<div class="con">
							<h3>
								<a href="http://www.189mv.cn/movie/29952/" class="blue"
									title="天才捕手" target="_blank">天才捕手</a>
							</h3>
							<div class="s">
								<span class="star"> <span class="star_now"
									style="width: 80%"></span>
								</span> <em class="score">8.0</em>
							</div>
						</div></li>

				</ul>
			</div>

		</div>


		<input id="filmId" value="29731" type="hidden">
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



	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/common.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/show.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/filmCritics.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jwplayer.js"></script>
	<script type="text/javascript">
	function showYinping() {
		showCritic(1,"z");
	}
		
	var filmId = '29731';
	var filmName = "金刚狼3：殊死一战";
	//片花地址
	filmViewUrl = "";
	function showall(){
		 if(!$("#some_1").is(":hidden")){
			 $("#juqing_1").html("收缩&lt;&lt;");
			 $("#total_1").show();
			 $("#some_1").hide();
		 }else{
			 $("#juqing_1").html("展开&gt;&gt;");
			 $("#total_1").hide();
			 $("#some_1").show();
		 }
			
	}

	$(function (){	
		$("#h_n_col_1").Slide({effect:"scroolLoop",autoPlay:false,speed:"normal",timer:3000,steps:1});
		//剧照左右按钮
		var len=$(".JQ-slide-content li").length;
		var initLen=4;
		if(len>4){
			$(".JQ-slide-nav a").show();
		}
		//剧照大图
		$(".JQ-slide-content li a").click(function(){
		   $(".JQ-slide-content li a").removeClass("curImg");
		   $(this).addClass("curImg");
		   var curImg=$(this).find("img").attr("src");
		   $("#bigImgCon").find("img").attr("src",curImg);
		});
		
		//播放片花
		$("#filmUrl").click(function(){
			if(filmViewUrl) {
				$("#playVideo").empty();
				jwplayer("playVideo").setup({
					autostart: true,
		  			flashplayer: "http://www.189mv.cn/web/images/pl.swf",
		  			file:filmViewUrl,
		  			image:"http://www.189mv.cn/web/images/film_img.jpg",
		  			height: 216,
		  			width:352
		  		});
			}
		});
		
		 $.ajax({
		    url: root + "qryFilmGrade.htm",
		    dataType :"json",
		    cache: false,
		    type:"POST",
		    data : {"mids" : filmId},
		    success: function(json) {
		    	if("00" === json.result) {
		    		var grades = json.grades;
		    		if(grades && grades.length) {
		    			$("#xiangkan em").html(grades[0].total);
		    			$("#kanguo em").html(grades[0].seeCnt);
		    		}
		    	}
		   	},
		   	error : function(json) {
		   	}
		});
		 
		$("#filmgrade a").click(function(){
			var id = $(this).attr("id");
			var ckeValue = getCookie("film");
		   	if(ckeValue) {
		   		 if(ckeValue.indexOf(filmId) <= -1) {
		   			ckeValue += "_" + filmId;
		   			setCookie("film",ckeValue,30);
		   		 } else {
		   			 return;
		   		 }
		   	 } else {
		   		 setCookie("film", filmId,30);
		   	 }
				
		   	var type = "1";
		   	if(id == "kanguo") {
		   		type = "2";
		   	}
		   	
			 $.ajax({
			    url: root + "updateFilmGrade.htm",
			    dataType :"json",
			    cache: false,
			    type:"POST",
			    data : {"mid" : filmId , "filmName" : filmName , "type" : type},
			    success: function(json) {
			    	if("00" === json.result) {
			    		var total = 998;
			    		try {
			    			total = parseInt($.trim($("#" + id + " em").html()));
			    		}catch(e) {
			    		}
			    		$("#"+id + " em").html(total+1);
			    	}
			   	},
			   	error : function(json) {}
			});
		});
	});

	$(document).ready(function() {
		var viewId = $.trim($("#filmViewId").val());
		if(viewId) {
			$.ajax({
		        url: root + "qryFilmView.htm",
		        dataType :"json",
		        cache: false,
		        type:"POST",
		        data:{
		          	"vid":viewId
		        },
		        success: function(json) {
		        	var code = json.result;
		        	if("00" == code) {
		        		filmViewUrl = json.reason;
		        	}
		       },
		       error : function(json) {}
		   	});
		}
	});

	function chgTab(dom,tab) {
		var clz = $.trim($(dom).attr("class"));
		if(clz.indexOf("cur") > -1) {
			return;
		}
		$("#fixtabul a").removeClass("cur");
		$("#lia_" + tab).addClass("cur");
		
		
		$("#movie_tab1").hide();
		$("#movie_tab2").hide();
		$("#movie_tab3").hide();
		$("#movie_" + tab).show();
		
		//显示影评内容
		var flagCritic="z";
		if(tab=="tab3"){
			//showCritic(1,flagCritic);
		}
	}
	</script>
</body>
</html>