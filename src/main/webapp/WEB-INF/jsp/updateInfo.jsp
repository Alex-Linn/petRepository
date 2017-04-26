<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
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
<script type="text/javascript">
    	function validate(){
    		var r = new RegExp("^[\\u4e00-\\u9fa5]{0,}$");
    		var pass = document.getElementById("password").value;
    		var age = document.getElementById("age").value;
    		var telephone = document.getElementById("telephone").value;
    		var sex = document.getElementById("sex").value.trim();
    		if(pass.trim()==""){
    			alert("密码不能为空！");
    			return false;
    		} 
    		if(pass.length<6){
	    		alert("密码长度必须大于6位！");
	    		return false;
	    	}
    		if(age<0 || age>150){
    			alert("年龄数错误！");
    			return false;
    		}
    		if(telephone.length<6 || telephone.length>11){
    			alert("号码长度在6到11位之间!");
    			return false;
    		}
    		/* if(sex != "男" || sex != "女"){
    			alert("请输入性别为男或女,人妖请联系管理员！");
    			return false;
    		} */
	    	document.form.submit();
    	}
    	
    	function register(url) {
			window.location = url;
		}
</script>
<style>
	form{
		font-size:20px;
		display:block;
		width:70%;
		height:20vh;
		padding-left:0vw;
		margin:10vh 15%;
		color:black;
		padding-left:5vw;
		padding-top:0vw;
	}
	form>input[type='text']{
			width:15vw;
			height:4vh;
			border-radius:0.5vw;	
			border:1px solid #3E8FEB;
			text-indent:5px;
		}
		/* form>input[type='password']{
			width:15vw;
			height:4vh;
			border-radius:0.5vw;
			border:1px solid #3E8FEB;
			text-indent:5px;
		} */
		form>input[type='button']{
			display:inline-block;
			width:6.5vw;
			height:4.5vh;
			margin:4vh 2vw;
			border-radius:0.5vw;
			border:2px solid #3E8FEB;
			background:#fff;
			cursor:pointer;
		}
		form>input[type='button']:hover{
			background:#3E8FEB;
			color:#fff;
		}
	</style>
</head>
<body>
<jsp:include page="head.jsp" />
<!-- end 顶部导航栏 -->
<div class="main">
	<!-- left -->
	<jsp:include page="leftMain.jsp" />
	<!-- right -->
	<div class="maright">
		<div class="ritit">
			个人信息
		</div>
		<div class="right">
		  <form action="<%=contextPath %>/user/updateInfo" name="form" method="post">
		  	用 户 名  : <input type="text" name="ownerUsername" id="username" disabled="disabled"
		  						value="${currentUser.ownerUsername }"/><br/><br/>
         	密  &nbsp;&nbsp;&nbsp;&nbsp;码 : <input type="text" name="ownerPassword" id="password" 
         						value="${currentUser.ownerPassword }"/><br><br/>
         	年  &nbsp;&nbsp;&nbsp;&nbsp;龄 : <input type="text" name="ownerAge" id="age" 
         						value="${currentUser.ownerAge }"/><br><br/>
         	性  &nbsp;&nbsp;&nbsp;&nbsp;别 : <input type="text" name="ownerSex" id="sex" disabled="disabled"
         						value="${currentUser.ownerSex }"/><br><br/>
         	邮  &nbsp;&nbsp;&nbsp;&nbsp;箱 : <input type="text" name="ownerEmail" id="email"
         						value="${currentUser.ownerEmail }"/><br><br/>
         	地  &nbsp;&nbsp;&nbsp;&nbsp;址 : <input type="text" name="address" id="address"
         						value="${currentUser.address }"/><br><br/>
         	电  &nbsp;&nbsp;&nbsp;&nbsp;话 : <input type="text" name="telephone" id="telephone"
         						value="${currentUser.telephone }"/><br><br/>
         	职  &nbsp;&nbsp;&nbsp;&nbsp;业 : <input type="text" name="occupation" id="occupation"
         						value="${currentUser.occupation }"/><br>
         						
         	<input type="hidden" value="${currentUser.id}" name="id" />
        	<input type="button" value="确认修改" onClick="validate()"/>
        	
		  </form>
		</div>
	</div>
</div>

<!-- foot -->
	<jsp:include page="foot.jsp" />

</body>
</html>
