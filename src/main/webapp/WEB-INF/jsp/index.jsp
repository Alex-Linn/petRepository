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
<script type="text/javascript">
	//热门影片
</script>
</head>
<body>
	<jsp:include page="head.jsp" />
	<div class="banner_bg">
		<div id="i-hot" class="i-hot">
			<div class="JQ-slide">
				<ul class="JQ-slide-content" id="rollimglist">

					<li style="opacity: 0; z-index: 0;"><a
						href="http://www.189mv.cn/banner?type=3&amp;title=http://www.189mv.cn/movie/29952"
						"><i></i><img
							src="<%=request.getContextPath()%>/images/630a9a60-a962-4234-b4f6-3c3abd4513c9.jpg"
							height="400" width="1002"><span style=""
							class="banner_scroll">天才捕手</span><span
							class="banner_scroll descri" style="">群星飙戏！天才故事折射现实</span></a></li>

					<li style="opacity: 0; z-index: 0;"><a
						href="http://www.189mv.cn/banner?type=3&amp;title=http://www.189mv.cn/movie/29670/"
						"><i></i><img
							src="<%=request.getContextPath()%>/images/f3dbea18-9282-4381-b992-9ee9f43b9f3d.jpg"
							height="400" width="1002"><span style=""
							class="banner_scroll">最终幻想15：王者之剑</span><span
							class="banner_scroll descri" style="">经典游戏系列改编电影！</span></a></li>

					<li style="opacity: 0; z-index: 0;"><a
						href="http://www.189mv.cn/banner?type=3&amp;title=http://www.189mv.cn/movie/29732/"
						"><i></i><img
							src="<%=request.getContextPath()%>/images/16d056ac-f52f-4bb3-884b-0a53c70ceda6.jpg"
							height="400" width="1002"><span style=""
							class="banner_scroll">乐高蝙蝠侠大电影</span><span
							class="banner_scroll descri" style="">酷萌蝙蝠侠人人爱</span></a></li>

					<li style="opacity: 1; z-index: 1;"><a
						href="http://www.189mv.cn/banner?type=3&amp;title=http://www.189mv.cn/movie/29731/"
						"><i></i><img
							src="<%=request.getContextPath()%>/images/d353792d-f05b-41ca-9287-e89c4379b4d3.jpg"
							height="400" width="1002"><span style=""
							class="banner_scroll">金刚狼3：殊死一战</span><span
							class="banner_scroll descri" style="">泪别狼叔，血战谢幕！</span></a></li>

					<li style="opacity: 0; z-index: 0;"><a
						href="http://www.189mv.cn/banner?type=3&amp;title=http://www.189mv.cn/movie/29650"
						"><i></i><img
							src="<%=request.getContextPath()%>/images/de79ece4-5236-4d62-b539-7eae7c8385c8.jpg"
							height="400" width="1002"><span style=""
							class="banner_scroll">生化危机：终章</span><span
							class="banner_scroll descri" style="">十五年终章精彩升级燃爆热血</span></a></li>

				</ul>
				<ul class="JQ-slide-nav">

					<li class=""><img
						src="<%=request.getContextPath()%>/images/630a9a60-a962-4234-b4f6-3c3abd4513c9.jpg"
						height="48" width="100"></li>

					<li class=""><img
						src="<%=request.getContextPath()%>/images/f3dbea18-9282-4381-b992-9ee9f43b9f3d.jpg"
						height="48" width="100"></li>

					<li class=""><img
						src="<%=request.getContextPath()%>/images/16d056ac-f52f-4bb3-884b-0a53c70ceda6.jpg"
						height="48" width="100"></li>

					<li class="on"><img
						src="<%=request.getContextPath()%>/images/d353792d-f05b-41ca-9287-e89c4379b4d3.jpg"
						height="48" width="100"></li>

					<li class=""><img
						src="<%=request.getContextPath()%>/images/de79ece4-5236-4d62-b539-7eae7c8385c8.jpg"
						height="48" width="100"></li>

				</ul>
			</div>
		</div>
	</div>
	<!--end 幻灯-->

	<div class="wrapper">
		<div class="hot_film com_b mart fix">
			<div class="h_txt">
				<h2>正在热映</h2>
				<a href="http://www.189mv.cn/movie/" class="m" ">共12部电影，查看全部&gt;&gt;</a>
			</div>

			<div class="tx_film fl">
				<div class="pic">
					<input id="hotfilmid" value="29790" type="hidden"> <a
						href="http://www.189mv.cn/movie/29790/" "
						id="firsthotfilmimg" class="p"><img
						src="${isShowMovieList.get(0).posterUrl}"
						height="270" width="440"></a>

					<div class="x"></div>
					<div class="c">
						<h3>${isShowMovieList.get(0).movieName}</h3>
						<div class="s">
							<span class="star"> <span class="star_now"
								style="width: 82%"></span>
							</span> <em class="score">${isShowMovieList.get(0).score}</em>
						</div>
					</div>
				</div>
				<div class="cont">
					<p>
						<span class="w">导演:${isShowMovieList.get(0).director} </span>
						<span class="w">语言:${isShowMovieList.get(0).movieLanguage} </span><span
							class="w">片长:${isShowMovieList.get(0).movieTime}</span>
					</p>
					<p>主演:${isShowMovieList.get(0).performer}</p>
					<p>上映时间:${isShowMovieList.get(0).rescheduledTime}</p>
					<p>剧情:${isShowMovieList.get(0).movieStory}</p>
				</div>
			</div>

			<div class="wt fr">
				<ul class="pic_lsit fix">
				<c:forEach items="${isShowMovieList}" var="isShowMovie">
					<li><a href="<%=request.getContextPath()%>/mt/movieDetail?movieId=${isShowMovie.id}" class="pic"
						title="${isShowMovie.movieName}" "><img
							src="${isShowMovie.posterUrl}"
							height="170" width="137"></a>

						<div class="con">
							<h3>
								<a href="<%=request.getContextPath()%>/mt/movieDetail?movieId=${isShowMovie.id}" class="blue"
									title="${isShowMovie.movieName}" ">${isShowMovie.movieName}</a>
							</h3>
							<div class="s">
								<span class="star"> <span class="star_now"
									style="width: 82%"></span>
								</span> <em class="score">${isShowMovie.score}</em>
							</div>
						</div>
					</li>
				</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<!--正在热映end-->
	<div class="wrapper">
		<div class="com_b mart">
			<div class="go_box">
				<div class="go_txt clearfix">
					<h2>即将上映</h2>
					<a href="http://www.189mv.cn/movie?tab=2" "
						class="m total-num">共30部电影，查看全部&gt;&gt;</a>
				</div>
				<div id="go_cont" class="go_cont">
					<div id="h_n_col_11" class="h_n_col" style="display: block;">
						<div class="go_slide_cont">
							<ul class="JQ-slide-content fix">
								<c:forEach items="${noShowMovieList}" var="noShowMovie">
								<li>
									<div class="hm_box">
										<div class="pic">
											<a href="<%=request.getContextPath()%>/mt/movieDetail?movieId=${noShowMovie.id}" title="${noShowMovie.movieName}"
												><img
												src="${noShowMovie.posterUrl}"
												height="170" width="137"></a>
										</div>
										<div class="cont">
											<h3>
												<a href="<%=request.getContextPath()%>/mt/movieDetail?movieId=${noShowMovie.id}" class="blue"
													title="${noShowMovie.movieName}" >${noShowMovie.movieName}</a>
											</h3>
											<p>${noShowMovie.rescheduledTime}上映</p>
											<div class="look-new">
												<p>导演：${noShowMovie.director}</p>
												<p>演员：${noShowMovie.performer}</p>
												<p>电影类型：${noShowMovie.movieType}</p>
												<p>时长：${noShowMovie.movieTime}</p>
											</div>
										</div>
									</div>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

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
							<a href="http://www.189mv.cn/news/16398/" ><img
								src="<%=request.getContextPath()%>/images/news_45208.jpg"
								alt="新闻" height="202" width="344"></a>
						</div>
						<div class="cont">
							<h3 class="blue">
								<a href="http://www.189mv.cn/news/16398/" >第89届奥斯卡金像奖颁奖典礼</a>
							</h3>
							<p>
								现场闹乌龙！奥斯卡颁奖现场最佳影片发错了 <span class="more">[<a
									href="http://www.189mv.cn/news/16398/" >阅读全文</a>]
								</span>
							</p>

						</div>

					</div>
					<div class="news_r">


						<dl>
							<dt>
								<a href="http://www.189mv.cn/news/16378/">2017年3月内地影市前瞻</a>
							</dt>
							<dd>狼叔"护女"金刚救人 美女野兽经典重现</dd>
						</dl>

						<dl>
							<dt>
								<a href="http://www.189mv.cn/news/16358/" >2017年1月内地影市前瞻</a>
							</dt>
							<dd>星爷葛大爷韩寒激战年初一 BJ星战打情怀...</dd>
						</dl>

						<dl>
							<dt>
								<a href="http://www.189mv.cn/news/16338/" >2016年12月内地影市前瞻</a>
							</dt>
							<dd>张艺谋率队打怪兽 大片搏杀预热贺岁档</dd>
						</dl>

						<dl>
							<dt>
								<a href="http://www.189mv.cn/news/16318/" >2016年11月内地影市前瞻</a>
							</dt>
							<dd>海外片密集上映 “潘金莲”单挑好莱坞</dd>
						</dl>

						<dl>
							<dt>
								<a href="http://www.189mv.cn/news/16299/">2016年10月内地影市前瞻</a>
							</dt>
							<dd>国庆档四雄开战 引进大片密集亮相</dd>
						</dl>

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
				<c:forEach items="${noticeList }" var="notice">
				<dl class="fix">
					<center>${notice.context}</center>
				</dl>
				</c:forEach>
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



	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/des.js"></script>
	<input id="basepath" value="http://www.189mv.cn/" type="hidden">
	<input id="contextPath" value="" type="hidden">
	<input id="needVerifyCode" value="false" type="hidden">
	<input id="CIPHERKEY" value="0DA6A575AAE2C39F20191830" type="hidden">
	<div class="zhezhao" id="coverall"></div>
	<div class="login_tips" id="loginpop">
		<div class="c_tips_cont">
			<a href="javascript:void(0);" class="c_close">关闭</a>
			<h3 class="tip_h3">用户登录</h3>
			<div id="loginpannel" style="display: block;">
				<div style="padding-top: 15px;">
					登录账号： <input name="" id="loginaccount" placeholder="账号"
						class="login_ip" style="color: #939392;" type="text">
				</div>
				<div class="remindBlock" id="accountmsg"></div>
				<div>
					登录密码： <input name="" id="loginpassword" value="" placeholder="密码"
						class="login_ip" type="password">
				</div>
				<div class="remindBlock" id="passwordmsg"></div>

				<div style="display: none;" id="loginImgCode">
					<div>
						验&nbsp;证&nbsp;码&nbsp;&nbsp;： <input name="" id="loginimgcode"
							maxlength="4" placeholder="" class="login_ip"
							style="width: 90px;" type="text"> <img id="logincodeimg"
							onclick="logImgRefresh();return false;"
							style="vertical-align: middle;"
							src="<%=request.getContextPath()%>/images/randomCode.jpg"
							height="26" width="80"> <a href="javascript:void(0);"
							onclick="logImgRefresh();return false;">换一张</a>
					</div>
					<div class="remindBlock" id="logimgmsg"></div>
				</div>

				<div class="k_item_1"
					style="padding-left: 74px; padding-bottom: 10px;">
					<span class="rem remUser"> <input id="remember"
						type="checkbox"><label for="">记住账号</label>
					</span> <a href="http://www.189mv.cn/regist/" class="blue"
						style="margin-right: 20px;">我要注册</a><a
						href="http://www.189mv.cn/forget/" class="blue">找回密码</a>
				</div>
				<div class="c_tips_btn confirm_btn">
					<a href="javascript:void(0);" id="dologin" class="">确&nbsp;&nbsp;&nbsp;认</a>
					<a href="javascript:void(0);" id="logincancel" class="">取&nbsp;&nbsp;&nbsp;消</a>
				</div>


			</div>
			<div id="loginloading" style="display: none;">
				<div class="loginloading" style="height: 167px; text-align: center;">
					<img src="<%=request.getContextPath()%>/images/loading.gif"
						style="padding-top: 60px;">
				</div>
			</div>
		</div>
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

	<input name="serialNumber" value="d14d94e37b514df28da0a14c6a351d3e"
		type="hidden">

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/common.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/index.js"></script>
</body>
</html>