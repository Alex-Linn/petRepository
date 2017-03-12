<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="application-name" content="院线通">
<meta name="title" content="院线通">
<title>电影比价平台-首页</title>
<meta name="keywords"
	content="">
<meta name="description"
	content="">
<link rel="dns-prefetch" href="http://www.189mv.cn/">
<link rel="dns-prefetch" href="http://image.189mv.cn/">
<link
	href="<%=request.getContextPath() %>/css/public.css"
	type="text/css" rel="stylesheet">
<link
	href="<%=request.getContextPath() %>/css/index.css"
	type="text/css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/js/hm.js"></script>
<script type="text/javascript">
	//热门影片
</script>
</head>
<body>
	<div class="body_w">
		<div class="header">
			<div class="logo">
				<a href="http://www.189mv.cn/">院线通</a>
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
				<a href="javascript:void(0);">18166036620</a> | <a
					href="http://www.189mv.cn/home/" class="blue">我的院线通</a> | <a
					href="javascript:logout();">退出</a> | <a
					href="http://www.189mv.cn/help/" target="_blank">帮助</a>
			</div>
		</div>
	</div>

	<div class="b_blue">
		<div class="main_nav">
			<ul class="m_nav_list fix">
				<li class="home"><a href="http://www.189mv.cn/">首页</a></li>
				<li><a href="http://www.189mv.cn/movie/">电影</a></li>
				<li><a href="http://www.189mv.cn/cinema/">影院</a></li>
				<li><a href="http://www.189mv.cn/news/">电影资讯</a></li>
				<li><a href="http://www.189mv.cn/phone/">手机订票</a></li>
				<li><a href="http://www.189mv.cn/activity/">活动</a></li>

				<li><a href="http://www.189mv.cn/groupon/">商企优选</a></li>



				<li><a href="http://www.189mv.cn/voucher/"
					style="padding: 0px 20px;">兑换券购买</a></li>

				<!--<li><a href="javascript:void(0);" >会员专区</a></li>  -->
			</ul>
		</div>
	</div>
	<!--end 导航-->

	<div class="banner_bg">
		<div id="i-hot" class="i-hot">
			<div class="JQ-slide">
				<ul class="JQ-slide-content" id="rollimglist">

					<li style="opacity: 0; z-index: 0;"><a
						href="http://www.189mv.cn/banner?type=3&amp;title=http://www.189mv.cn/movie/29952"
						target="_blank"><i></i><img
							src="<%=request.getContextPath() %>/images/630a9a60-a962-4234-b4f6-3c3abd4513c9.jpg"
							height="400" width="1002"><span style=""
							class="banner_scroll">天才捕手</span><span
							class="banner_scroll descri" style="">群星飙戏！天才故事折射现实</span></a></li>

					<li style="opacity: 0; z-index: 0;"><a
						href="http://www.189mv.cn/banner?type=3&amp;title=http://www.189mv.cn/movie/29670/"
						target="_blank"><i></i><img
							src="<%=request.getContextPath() %>/images/f3dbea18-9282-4381-b992-9ee9f43b9f3d.jpg"
							height="400" width="1002"><span style=""
							class="banner_scroll">最终幻想15：王者之剑</span><span
							class="banner_scroll descri" style="">经典游戏系列改编电影！</span></a></li>

					<li style="opacity: 0; z-index: 0;"><a
						href="http://www.189mv.cn/banner?type=3&amp;title=http://www.189mv.cn/movie/29732/"
						target="_blank"><i></i><img
							src="<%=request.getContextPath() %>/images/16d056ac-f52f-4bb3-884b-0a53c70ceda6.jpg"
							height="400" width="1002"><span style=""
							class="banner_scroll">乐高蝙蝠侠大电影</span><span
							class="banner_scroll descri" style="">酷萌蝙蝠侠人人爱</span></a></li>

					<li style="opacity: 1; z-index: 1;"><a
						href="http://www.189mv.cn/banner?type=3&amp;title=http://www.189mv.cn/movie/29731/"
						target="_blank"><i></i><img
							src="<%=request.getContextPath() %>/images/d353792d-f05b-41ca-9287-e89c4379b4d3.jpg"
							height="400" width="1002"><span style=""
							class="banner_scroll">金刚狼3：殊死一战</span><span
							class="banner_scroll descri" style="">泪别狼叔，血战谢幕！</span></a></li>

					<li style="opacity: 0; z-index: 0;"><a
						href="http://www.189mv.cn/banner?type=3&amp;title=http://www.189mv.cn/movie/29650"
						target="_blank"><i></i><img
							src="<%=request.getContextPath() %>/images/de79ece4-5236-4d62-b539-7eae7c8385c8.jpg"
							height="400" width="1002"><span style=""
							class="banner_scroll">生化危机：终章</span><span
							class="banner_scroll descri" style="">十五年终章精彩升级燃爆热血</span></a></li>

				</ul>
				<ul class="JQ-slide-nav">

					<li class=""><img
						src="<%=request.getContextPath() %>/images/630a9a60-a962-4234-b4f6-3c3abd4513c9.jpg"
						height="48" width="100"></li>

					<li class=""><img
						src="<%=request.getContextPath() %>/images/f3dbea18-9282-4381-b992-9ee9f43b9f3d.jpg"
						height="48" width="100"></li>

					<li class=""><img
						src="<%=request.getContextPath() %>/images/16d056ac-f52f-4bb3-884b-0a53c70ceda6.jpg"
						height="48" width="100"></li>

					<li class="on"><img
						src="<%=request.getContextPath() %>/images/d353792d-f05b-41ca-9287-e89c4379b4d3.jpg"
						height="48" width="100"></li>

					<li class=""><img
						src="<%=request.getContextPath() %>/images/de79ece4-5236-4d62-b539-7eae7c8385c8.jpg"
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

				<a href="http://www.189mv.cn/movie/" class="m" target="_blank">共12部电影，查看全部&gt;&gt;</a>

			</div>

			<div class="tx_film fl">
				<div class="pic">
					<input id="hotfilmid" value="29790" type="hidden"> <a
						href="http://www.189mv.cn/movie/29790/" target="_blank"
						id="firsthotfilmimg" class="p"><img
						src="<%=request.getContextPath() %>/images/f014f945658b3d287a7128021c0d82f1_HB2_41676.jpg"
						height="270" width="440"></a>

					<div class="x"></div>
					<div class="c">
						<h3>一条狗的使命</h3>
						<div class="s">
							<span class="star"> <span class="star_now"
								style="width: 82%"></span>
							</span> <em class="score">8.2</em>
						</div>
					</div>
				</div>
				<div class="cont">
					<p>
						<span class="w">导演: 拉斯·霍尔斯道姆</span><span class="w">语言: 英语</span><span
							class="w">片长: 120分钟</span>
					</p>
					<p>主演:布丽特·罗伯森 / 丹尼斯·奎德 / 佩吉·利普顿 / 乔什·加德 ...</p>
				</div>
				<div class="hot_cine">
					<div class="txt">
						<h3 class="blue">热门影院</h3>
					</div>
					<div class="c_list">
						<ul class="fix" id="hotcinemas">
							<li><a href="http://www.189mv.cn/cinema/sp019CMT36012801/">星美国际影城-南昌红谷新城店</a></li>
							<li><a href="http://www.189mv.cn/cinema/sp019DD36014301/">南昌越幕影院莲塘路店</a></li>
							<li><a href="http://www.189mv.cn/cinema/sp019CMT36012601/">星美国际影城-南昌梦时代IMAX店</a></li>
							<li><a href="http://www.189mv.cn/cinema/sp0313282/">冷杉欢腾影城上海北路店</a></li>
							<li><a href="http://www.189mv.cn/cinema/sp019VS121113/">南昌金逸影城-红谷滩店</a></li>
							<li><a href="http://www.189mv.cn/cinema/sp019CMT36010601/">星美国际影城-南昌樟树林店</a></li>
						</ul>
					</div>
					<p style="text-align: right">
						<a href="http://www.189mv.cn/movie/29790/" class="orange"
							id="showsinfo">共9家影院，40场次</a>
					</p>
				</div>
			</div>

			<div class="wt fr">
				<ul class="pic_lsit fix">

					<li><a href="http://www.189mv.cn/movie/29731/" class="pic"
						title="金刚狼3：殊死一战" target="_blank"><img
							src="<%=request.getContextPath() %>/images//9850221fec6c4d27a6fb2213e9382203_HB1_42156.jpg"
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

					<li><a href="http://www.189mv.cn/movie/29670/" class="pic"
						title="最终幻想15：王者之剑" target="_blank"><img
							src="<%=request.getContextPath() %>/images/8da8d2857fe10a437361f20db18c085d_HB1_41376.jpg"
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

					<li><a href="http://www.189mv.cn/movie/29952/" class="pic"
						title="天才捕手" target="_blank"><img
							src="<%=request.getContextPath() %>/images/63e220b8fe15058141765cff09630c57_HB1_41991.jpg"
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

					<div class="marb25"></div>

					<li><a href="http://www.189mv.cn/movie/29650/" class="pic"
						title="生化危机：终章" target="_blank"><img
							src="<%=request.getContextPath() %>/images/7499965c0fffafc8424c36b8ba37b0d8_HB1_41836.jpg"
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

					<li><a href="http://www.189mv.cn/movie/27310/" class="pic"
						title="碟仙诡谭2" target="_blank"><img
							src="<%=request.getContextPath() %>/images/fd30e78d3117b50599eb14aa264fcbe5_HB1_33567.jpg"
							height="170" width="137"></a>

						<div class="con">
							<h3>
								<a href="http://www.189mv.cn/movie/27310/" class="blue"
									title="碟仙诡谭2" target="_blank">碟仙诡谭2</a>
							</h3>
							<div class="s">
								<span class="star"> <span class="star_now"
									style="width: 74%"></span>
								</span> <em class="score">7.4</em>
							</div>
						</div></li>

					<li><a href="http://www.189mv.cn/movie/29850/" class="pic"
						title="夜色撩人" target="_blank"><img
							src="<%=request.getContextPath() %>/images/8674bf513a0526e2755f0c08a41f6dd2_HB1_41754.jpg"
							height="170" width="137"></a>

						<div class="con">
							<h3>
								<a href="http://www.189mv.cn/movie/29850/" class="blue"
									title="夜色撩人" target="_blank">夜色撩人</a>
							</h3>
							<div class="s">
								<span class="star"> <span class="star_now"
									style="width: 77%"></span>
								</span> <em class="score">7.7</em>
							</div>
						</div></li>

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
					<a href="http://www.189mv.cn/movie?tab=2" target="_blank"
						class="m total-num">共30部电影，查看全部&gt;&gt;</a>
				</div>
				<div id="go_cont" class="go_cont">
					<div id="h_n_col_11" class="h_n_col" style="display: block;">
						<div class="go_slide_cont">
							<ul class="JQ-slide-content fix">

								<li>
									<div class="hm_box">
										<div class="pic">
											<a href="http://www.189mv.cn/movie/30071/" title="毛丰美"
												target="_blank"><img
												src="<%=request.getContextPath() %>/images/fdc2985666cc2930a740cc6a64017d52_HB1_42379.jpg"
												height="170" width="137"></a>
										</div>
										<div class="cont">
											<h3>
												<a href="http://www.189mv.cn/movie/30071/" class="blue"
													title="毛丰美" target="_blank">毛丰美</a>
											</h3>
											<p>2017年3月15日上映</p>
											<div class="look-new">
												<a
													href="javascript:updateFilmGrade('30071','%E6%AF%9B%E4%B8%B0%E7%BE%8E');"
													class="tlook"><span>想 看</span><em
													id="prefilm_tatal_30071">999</em></a>
											</div>
										</div>
									</div>
								</li>

								<li>
									<div class="hm_box">
										<div class="pic">
											<a href="http://www.189mv.cn/movie/30070/" title="上海王2"
												target="_blank"><img
												src="<%=request.getContextPath() %>/images/b00e2b10e24f31771d1492a4d70296ac_HB1_42375.jpg"
												height="170" width="137"></a>
										</div>
										<div class="cont">
											<h3>
												<a href="http://www.189mv.cn/movie/30070/" class="blue"
													title="上海王2" target="_blank">上海王2</a>
											</h3>
											<p>2017年3月16日上映</p>
											<div class="look-new">
												<a
													href="javascript:updateFilmGrade('30070','%E4%B8%8A%E6%B5%B7%E7%8E%8B2');"
													class="tlook"><span>想 看</span><em
													id="prefilm_tatal_30070">1000</em></a>
											</div>
										</div>
									</div>
								</li>

								<li>
									<div class="hm_box">
										<div class="pic">
											<a href="http://www.189mv.cn/movie/27309/" title="美好的意外"
												target="_blank"><img
												src="<%=request.getContextPath() %>/images/faa64dccc9ae92ecae24bbd52561d7d9_HB1_33527.jpg"
												height="170" width="137"></a>
										</div>
										<div class="cont">
											<h3>
												<a href="http://www.189mv.cn/movie/27309/" class="blue"
													title="美好的意外" target="_blank">美好的意外</a>
											</h3>
											<p>2017年3月17日上映</p>
											<div class="look-new">
												<a
													href="javascript:updateFilmGrade('27309','%E7%BE%8E%E5%A5%BD%E7%9A%84%E6%84%8F%E5%A4%96');"
													class="tlook"><span>想 看</span><em
													id="prefilm_tatal_27309">1079</em></a>
											</div>
										</div>
									</div>
								</li>

							</ul>
							<input id="prefilmids" value="30071_30070_27309_" type="hidden">
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
					<a href="http://www.189mv.cn/news/" target="_blank" class="more"
						id="more">更多&gt;&gt;</a>
				</div>
				<div class="news_cont fix">
					<div class="news_l">


						<div class="pic">
							<a href="http://www.189mv.cn/news/16398/" target="_blank"><img
								src="<%=request.getContextPath() %>/images/news_45208.jpg"
								alt="新闻" height="202" width="344"></a>
						</div>
						<div class="cont">
							<h3 class="blue">
								<a href="http://www.189mv.cn/news/16398/" target="_blank">第89届奥斯卡金像奖颁奖典礼</a>
							</h3>
							<p>
								现场闹乌龙！奥斯卡颁奖现场最佳影片发错了 <span class="more">[<a
									href="http://www.189mv.cn/news/16398/" target="_blank">阅读全文</a>]
								</span>
							</p>

						</div>

					</div>
					<div class="news_r">


						<dl>
							<dt>
								<a href="http://www.189mv.cn/news/16378/" target="_blank">2017年3月内地影市前瞻</a>
							</dt>
							<dd>狼叔"护女"金刚救人 美女野兽经典重现</dd>
						</dl>

						<dl>
							<dt>
								<a href="http://www.189mv.cn/news/16358/" target="_blank">2017年1月内地影市前瞻</a>
							</dt>
							<dd>星爷葛大爷韩寒激战年初一 BJ星战打情怀...</dd>
						</dl>

						<dl>
							<dt>
								<a href="http://www.189mv.cn/news/16338/" target="_blank">2016年12月内地影市前瞻</a>
							</dt>
							<dd>张艺谋率队打怪兽 大片搏杀预热贺岁档</dd>
						</dl>

						<dl>
							<dt>
								<a href="http://www.189mv.cn/news/16318/" target="_blank">2016年11月内地影市前瞻</a>
							</dt>
							<dd>海外片密集上映 “潘金莲”单挑好莱坞</dd>
						</dl>

						<dl>
							<dt>
								<a href="http://www.189mv.cn/news/16299/" target="_blank">2016年10月内地影市前瞻</a>
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

				<dl class="fix">
					<dt class="pic">
						<a title="专访《锦绣缘》黄晓明：我喜欢演霸道总裁" target="_blank"
							href="http://www.189mv.cn/news/13500/"><img
							src="<%=request.getContextPath() %>/images/news_37425.jpg"
							height="90" width="90"></a>
					</dt>
					<dd>
						<h4>
							<a href="http://www.189mv.cn/news/13500/" target="_blank"
								title="专访《锦绣缘》黄晓明：我喜欢演霸道总裁" class="blue">专访《锦绣缘》黄晓明...</a>
						</h4>
						<p>
							这是他首次担任电视剧出品人，发布会上，黄晓明表现的很卖力，他配合着记...<span class="more">[<a
								target="_blank" href="http://www.189mv.cn/news/13500/">阅读全文</a>]
							</span>
						</p>
					</dd>
				</dl>

				<dl class="fix">
					<dt class="pic">
						<a title="独家专访迪士尼《超能陆战队》主创团队" target="_blank"
							href="http://www.189mv.cn/news/13439/"><img
							src="<%=request.getContextPath() %>/images/news_37361.jpg"
							height="90" width="90"></a>
					</dt>
					<dd>
						<h4>
							<a href="http://www.189mv.cn/news/13439/" target="_blank"
								title="独家专访迪士尼《超能陆战队》主创团队" class="blue">独家专访迪士尼《超能...</a>
						</h4>
						<p>
							美国特派记者专赴《超能陆战队》诞生之地——迪士尼动画工作室，与影片中...<span class="more">[<a
								target="_blank" href="http://www.189mv.cn/news/13439/">阅读全文</a>]
							</span>
						</p>
					</dd>
				</dl>

				<dl class="fix">
					<dt class="pic">
						<a title="专访动画电影《花木兰》导演巴里·库克" target="_blank"
							href="http://www.189mv.cn/news/13140/"><img
							src="<%=request.getContextPath() %>/images/news_37003.jpg"
							height="90" width="90"></a>
					</dt>
					<dd>
						<h4>
							<a href="http://www.189mv.cn/news/13140/" target="_blank"
								title="专访动画电影《花木兰》导演巴里·库克" class="blue">专访动画电影《花木兰...</a>
						</h4>
						<p>
							在《花木兰》导演巴里·库克看来，要想让“孙悟空”走向世界，不仅需要大...<span class="more">[<a
								target="_blank" href="http://www.189mv.cn/news/13140/">阅读全文</a>]
							</span>
						</p>
					</dd>
				</dl>

			</div>
		</div>
	</div>

	<div class="wrapper">
		<div class="com_b mart padd_28 fix">
			<div class="c_txt">
				<h2 class="black">关注我们，不止是网站</h2>
			</div>
			<div class="gz_list gz_list_reset">
				<ul class="fix">
					
					<li><a href="http://weibo.com/yuanxiantong" class="k_4"
						target="_blank">
							<h3 class="blue">新浪微博</h3>
							<p>@院线通</p>
							<p>更好的影讯，更多的优惠，</p>
							<p>更新鲜的电影资讯。</p>
					</a></li>
				</ul>
			</div>
		</div>
		<a href="http://www.189mv.cn/phone/?tab=3" target="_blank">
			<div class="weixin_index weixin_index1">
				<div class="img-cen">
					<img
						src="<%=request.getContextPath() %>/images/weixin1.jpg"
						width="140">
				</div>
				<div class="shuoming">
					<p class="weixin_title fl">微信服务号</p>
					<p class="fl">
						移动客服<br>尽在身边
					</p>
					<div class="clear"></div>
				</div>
			</div>
		</a> <a href="http://www.189mv.cn/phone/?tab=3" target="_blank">
			<div class="weixin_index">
				<div class="img-cen">
					<img
						src="<%=request.getContextPath() %>/images/weixin.jpg">
				</div>
				<div class="shuoming">
					<p class="weixin_title fl">微信订阅号</p>
					<p class="fl">
						随时了解<br>更多影讯
					</p>
					<div class="clear"></div>
				</div>
			</div>
		</a> <a href="http://www.189mv.cn/phone/" target="_blank">
			<div class="kehuduan_index">
				<div class="img-cen">
					<img
						src="<%=request.getContextPath() %>/images/kehuduan.png">
				</div>
				<div class="shuoming">
					<p class="weixin_title fl">&nbsp;&nbsp;&nbsp;&nbsp;客户端&nbsp;&nbsp;</p>
					<p class="fl">
						快捷订票<br>更多优惠
					</p>
					<div class="clear"></div>
				</div>
			</div>
		</a>
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
			<li>客服电话：4008610001<br>电影比价平台经营许可证：粤ICP备14020429号<br>Copyright©
				2007—2017电影平台版权所有
			</li>
		</ul>
	</div>



	<script type="text/javascript"
		src="<%=request.getContextPath() %>/js/des.js"></script>
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
							src="<%=request.getContextPath() %>/images/randomCode.jpg"
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
					<img
						src="<%=request.getContextPath() %>/images/loading.gif"
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
		src="<%=request.getContextPath() %>/js/jquery.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath() %>/js/common.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath() %>/js/index.js"></script>
</body>
</html>