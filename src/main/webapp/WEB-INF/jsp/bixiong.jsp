<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
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
	<!-- left -->
<jsp:include page="leftMain.jsp" />
<!-- right -->
<div class="maright">
	<div class="maright">
		<ul class="prolist">
			<li><a href="" target="_blank"><img
					src="../images/bixiong/1833_n2.jpg" width="245" height="245" /><span>比熊</span></a></li>
			<li><a href="" target="_blank"><img
					src="../images/bixiong/1837_n2.jpg" width="245" height="245" /><span>比熊</span></a></li>
			<li><a href="" target="_blank"><img
					src="../images/bixiong/1839_n2.jpg" width="245" height="245" /><span>比熊</span></a></li>
			<li><a href="" target="_blank"><img
					src="../images/bixiong/1841_n2.jpg" width="245" height="245" /><span>比熊</span></a></li>
			<li><a href="" target="_blank"><img
					src="../images/bixiong/1842_n2.jpg" width="245" height="245" /><span>比熊</span></a></li>
			<li><a href="" target="_blank"><img
					src="../images/bixiong/1843_n2.jpg" width="245" height="245" /><span>比熊</span></a></li>
			<li><a href="" target="_blank"><img
					src="../images/bixiong/1844_n2.jpg" width="245" height="245" /><span>比熊</span></a></li>
			<li><a href="" target="_blank"><img
					src="../images/bixiong/1845_n2.jpg" width="245" height="245" /><span>比熊</span></a></li>
			<li><a href="" target="_blank"><img
					src="../images/bixiong/1859_n2.jpg" width="245" height="245" /><span>比熊</span></a></li>
		</ul>
	</div>
</div>
</div>
<!-- foot -->
<jsp:include page="foot.jsp" />
</body>
</html>
