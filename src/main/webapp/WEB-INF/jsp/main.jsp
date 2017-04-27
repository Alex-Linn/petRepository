<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	String contextPath = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>主页</title>
	<link href="../webCss/style.css" rel="stylesheet" />
</head>

<body>
<jsp:include page="head.jsp" />
<!-- end 顶部导航栏 -->
<div class="main">
	<div class="tit">
	  	<a href="">宠物展示</a>/<span>PRODUCT SHOW</span>
	</div>
	<div class="type"></div>
	<ul class="list">
	  <li>
	  	<a href="">
	  	<img src="../webImages/2127_shouye.jpg" alt="罗威纳" width="260" height="260"  /><span>罗威纳</span></a>
	  </li>
	  <li>
	    <a href="">
	    <img src="../webImages/2146_shouye.jpg" alt="萨摩耶" width="260" height="260"  /><span>萨摩耶</span></a>
	  </li>
	  <li>
	    <a href="">
	    <img src="../webImages/2133_shouye.jpg" alt="秋田犬" width="260" height="260"  /><span>秋田犬</span></a>
	  </li>
	  <li>
	    <a href="">
	    <img src="../webImages/2093_shouye.jpg" alt="卡斯罗" width="260" height="260"  /><span>卡斯罗</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/2083_shouye.jpg" alt="古牧" width="260" height="260"  /><span>古牧</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/2045_shouye.jpg" alt="阿拉斯加" width="260" height="260"  /><span>阿拉斯加</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/2058_shouye.jpg" alt="杜宾" width="260" height="260"  /><span>杜宾</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/2015_shouye.jpg" alt="雪纳瑞" width="260" height="260"  /><span>雪纳瑞</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/1998_shouye.jpg" alt="松狮" width="260" height="260"  /><span>松狮</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/1959_shouye.jpg" alt="拉布拉多" width="260" height="260"  /><span>拉布拉多</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/1935_shouye.jpg" alt="金毛" width="260" height="260"  /><span>金毛</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/1905_shouye.jpg" alt="哈士奇" width="260" height="260"  /><span>哈士奇</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/1890_shouye.jpg" alt="哈士奇" width="260" height="260"  /><span>哈士奇</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/1879_shouye.jpg" alt="英国斗牛犬" width="260" height="260"  /><span>英国斗牛犬</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/1878_shouye.jpg" alt="柴犬" width="260" height="260"  /><span>柴犬</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/1852_shouye.jpg" alt="比熊" width="260" height="260"  /><span>比熊</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/1827_shouye.jpg" alt="博美" width="260" height="260"  /><span>博美</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/1825_shouye.jpg" alt="博美" width="260" height="260"  /><span>博美</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/1811_shouye.jpg" alt="法国斗牛犬" width="260" height="260"  /><span>法国斗牛犬</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/1799_shouye.jpg" alt="法国斗牛犬" width="260" height="260"  /><span>法国斗牛犬</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/1793_shouye.jpg" alt="吉娃娃" width="260" height="260"  /><span>吉娃娃</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/1774_shouye.jpg" alt="柯基犬" width="260" height="260"  /><span>柯基犬</span></a>
	  </li>
	  <li>
	  	<a href="">
	  	<img src="../webImages/1718_shouye.jpg" alt="约克夏" width="260" height="260"  /><span>约克夏</span></a>
	  </li>
	  <li>
		<a href="">
		<img src="../webImages/1761_shouye.jpg" alt="泰迪" width="260" height="260"  /><span>泰迪</span></a>
	  </li>
	</ul>
	<div class="tit">
		<a href="">新闻中心</a>/<span>NEWS CENTER</span>
	</div>
	<div class="news_cont fl">
		<ul class="index_news_list">
		 <li>
		   <a href="/?c=msg&id=2406"><span><b>2017</b><br />01-11</span>
			<div class="index_news_text">
				<p class="n1">致即将购买爱犬朋友的一封信</p>
				<p class="n2">《请用心读完》谢谢！有朋友和我聊，在宠物市场，还有一些不规范犬舍的买狗狗后。回家没多久狗狗就生病，没了，损失了</p>
			</div>
			</a>
		</li>
		<li>
		   <a href="/?c=msg&id=2405"><span><b>2017</b><br />01-11</span>
			 <div class="index_news_text">
				<p class="n1">饲养中遇到的小常识必须看哦</p>
				<p class="n2">喂养小常识刚买到家的小狗,前二十天，以适应环境为主，此时它个体抗体功能极低，其所带病体和新环境病体最容易感</p>
			</div>
			</a>
		</li>
		<li>
		   <a href="/?c=msg&id=2404"><span><b>2017</b><br />01-11</span>
			 <div class="index_news_text">
				 <p class="n1">如何让爱犬和小朋友友好相处</p>
				 <p class="n2">狗是很受欢迎的家庭宠物，有些品种狗很适合家中有小孩的环境，比如拉布拉多犬、金毛寻回犬、德国牧羊犬、圣伯纳</p>
			 </div>
			</a>
		</li>
		<li>
			<a href="/?c=msg&id=2403"><span><b>2017</b><br />01-11</span>
			  <div class="index_news_text">
				  <p class="n1">如何让爱犬到固定地方大小便</p>
				  <p class="n2">养小狗的爱狗人士最头疼的大概莫过于精疲力竭地回到家的时候，迎接你的不仅有小狗的热烈欢迎，还有这里一堆那里</p>
			  </div>
			 </a>
		</li>
		<li>
			<a href="/?c=msg&id=2402"><span><b>2017</b><br />01-11</span>
			  <div class="index_news_text">
				  <p class="n1">哈士奇喂养的小常识</p>
				  <p class="n2">哈士奇幼犬在生长期身体发育比较快，所以在饲喂幼犬时需特别注意:&nbsp;1.幼犬有别于成犬，当刚买进的幼犬到家</p>
			  </div>
			 </a>
		</li>
	  </ul>
	</div>
	<div class="news_cont fr">
		<ul class="index_news_list">
		  <li>
		  	<a href="/?c=msg&id=2406"><span><b>2017</b><br />01-11</span>
			  <div class="index_news_text">
				 <p class="n1">致即将购买爱犬朋友的一封信</p>
				 <p class="n2">《请用心读完》谢谢！有朋友和我聊，在宠物市场，还有一些不规范犬舍的买狗狗后。回家没多久狗狗就生病，没了，损失了</p>
			  </div>
			</a>
		</li>
		<li>
			<a href="/?c=msg&id=2405"><span><b>2017</b><br />01-11</span>
				<div class="index_news_text">
					<p class="n1">饲养中遇到的小常识必须看哦</p>
					<p class="n2">喂养小常识刚买到家的小狗,前二十天，以适应环境为主，此时它个体抗体功能极低，其所带病体和新环境病体最容易感</p>
				</div>
			</a>
		</li>
		<li>
			<a href="/?c=msg&id=2404"><span><b>2017</b><br />01-11</span>
				<div class="index_news_text">
					<p class="n1">如何让爱犬和小朋友友好相处</p>
					<p class="n2">狗是很受欢迎的家庭宠物，有些品种狗很适合家中有小孩的环境，比如拉布拉多犬、金毛寻回犬、德国牧羊犬、圣伯纳</p>
				</div>
			</a>
		</li>
		<li>
			<a href="/?c=msg&id=2403"><span><b>2017</b><br />01-11</span>
				<div class="index_news_text">
					<p class="n1">如何让爱犬到固定地方大小便</p>
					<p class="n2">养小狗的爱狗人士最头疼的大概莫过于精疲力竭地回到家的时候，迎接你的不仅有小狗的热烈欢迎，还有这里一堆那里</p>
				</div>
			</a>
		</li>
		<li>
			<a href="/?c=msg&id=2402"><span><b>2017</b><br />01-11</span>
				<div class="index_news_text">
					<p class="n1">哈士奇喂养的小常识</p>
					<p class="n2">哈士奇幼犬在生长期身体发育比较快，所以在饲喂幼犬时需特别注意:&nbsp;1.幼犬有别于成犬，当刚买进的幼犬到家</p>
					</div>
			</a>
		</li>
	  </ul>
	</div>
</div>
<div class="footw">
	<div class="footr">
	<ul>
	  <li>
	  	Copyright © 2017 宠物爱好者管理平台&nbsp;&nbsp;All Rights Reserved 王淋 版权所有
	  </li>
	</ul>
	</div>
</div>
</body>
</html>
