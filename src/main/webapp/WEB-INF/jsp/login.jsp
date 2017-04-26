<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%
	String contextPath = request.getContextPath();
%>
<html>
  <head>
    <title>My JSP 'login.jsp' starting page</title>
    <script type="text/javascript">
    	function validate(){
    		var r = new RegExp("^[\\u4e00-\\u9fa5]{0,}$");
    		var user = document.getElementById("username").value;
    		var pass = document.getElementById("password").value;
    		if(user.trim()=="" || pass.trim()==""){
    			alert("用户名或密码不能为空！");
    			return false;
    		} 
    		if(!r.test(user)){
	    		alert("用户名必须是中文！");
	    		return false;
		    	}
	    	if(pass.length<6){
	    		alert("密码长度必须大于6位！");
	    		return false;
	    	}
	    	document.form.submit();
    	}
    	
    	function register(url) {
			window.location = url;
		}
    </script>
    <style>
	form{
		display:block;
		width:70%;
		height:20vh;
		padding-left:0vw;
		margin:10vh 15%;
		color:white;
		padding-left:45vw;
		padding-top:6vw;
	}
	form>input[type='text']{
			width:15vw;
			height:4vh;
			border-radius:0.5vw;
			border:none;
			text-indent:5px;
		}
		form>input[type='password']{
			width:15vw;
			height:4vh;
			border-radius:0.5vw;
			border:none;
			text-indent:5px;
		}
		form>input[type='button']{
			display:inline-block;
			width:6.5vw;
			height:4.5vh;
			margin:4vh 2vw;
			border-radius:0.5vw;
			border:none;
			background:#fff;
			cursor:pointer;
		}
		form>input[type='button']:hover{
			background:#3E8FEB;
			color:#fff;
		}
	</style>
  </head>
  <body style="width:100%;height:100%;">
	<%-- <div style="display:block;position:fixed;float:right;margin-top: 10px;right:160px;">
		 <h2 style="color:#fff;">${msg}</h2><br>
 	</div> --%>
 	<style>
 	  body{
 	      background:url('../images/1.jpg') top left;
 	      background-size:100%;
          overflow:hidden;
 	  }
 	</style>
      <form method="post" action="<%=contextPath %>/user/loginCheck" name="form">
      			<input type="hidden" name="method" value="logincheck">
        	用 户 名  : <input type="text" name="username" id="username"/><br><br>
         	密 &nbsp;&nbsp;&nbsp;&nbsp;码 : <input type="password" name="password" id="password"/><br>
        	<input type="button" value="登录" onClick="validate()"/>
        	<!-- <input type="button" value="注册" onClick="register('register.jsp')"/> -->
			<a href="<%=contextPath%>/pet/toRegister">
        		<font size="3" color="white">立即注册</font>
        	</a>
      </form>
  </body>
</html>