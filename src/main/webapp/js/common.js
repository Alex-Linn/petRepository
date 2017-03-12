(function($){
	$.fn.Slide=function(options){
		var opts = $.extend({},$.fn.Slide.deflunt,options);
		var index=1;
		var targetLi = $("." + opts.claNav + " li", $(this));// 鐩爣瀵硅薄
		var clickNext = $("." + opts.claNav + " .next", $(this));// 鐐瑰嚮涓嬩竴涓寜閽�
		var clickPrev = $("." + opts.claNav + " .prev", $(this));// 鐐瑰嚮涓婁竴涓寜閽�
		var ContentBox = $("." + opts.claCon , $(this));// 婊氬姩鐨勫璞�
		var ContentBoxNum=ContentBox.children().size();// 婊氬姩瀵硅薄鐨勫瓙鍏冪礌涓暟
		var slideH=ContentBox.children().first().height();// 婊氬姩瀵硅薄鐨勫瓙鍏冪礌涓暟楂樺害锛岀浉褰撲簬婊氬姩鐨勯珮搴�
		var slideW=ContentBox.children().first().width();// 婊氬姩瀵硅薄鐨勫瓙鍏冪礌瀹藉害锛岀浉褰撲簬婊氬姩鐨勫搴�
		var autoPlay;
		var slideWH;
		if(opts.effect=="scroolY"||opts.effect=="scroolTxt"){
			slideWH=slideH;
		}else if(opts.effect=="scroolX"||opts.effect=="scroolLoop"){
			ContentBox.css("width",ContentBoxNum*slideW);
			slideWH=slideW;
		}else if(opts.effect=="fade"){
			ContentBox.children().first().find("."+opts.spanTxt).show();
			ContentBox.children().first().css("z-index","1");
		}
		
		return this.each(function() {
			var $this=$(this);
			// 婊氬姩鍑芥暟
			var doPlay=function(){
				$.fn.Slide.effect[opts.effect](ContentBox, targetLi, index, slideWH, opts);
				index++;
				if (index*opts.steps >= ContentBoxNum) {
					index = 0;
				}
			};
			clickNext.click(function(event){
				$.fn.Slide.effectLoop.scroolLeft(ContentBox, targetLi, index, slideWH, opts,function(){
					for(var i=0;i<opts.steps;i++){
	                    ContentBox.find("li:first",$this).appendTo(ContentBox);
	                }
	                ContentBox.css({"left":"0"});
				});
				event.preventDefault();
			});
			clickPrev.click(function(event){
				for(var i=0;i<opts.steps;i++){
	                ContentBox.find("li:last").prependTo(ContentBox);
	            }
	          	ContentBox.css({"left":-index*opts.steps*slideW});
				$.fn.Slide.effectLoop.scroolRight(ContentBox, targetLi, index, slideWH, opts);
				event.preventDefault();
			});
			// 鑷姩鎾斁
			if (opts.autoPlay) {
				autoPlay = setInterval(doPlay, opts.timer);
				ContentBox.hover(function(){
					if(autoPlay){
						clearInterval(autoPlay);
					}
				},function(){
					if(autoPlay){
						clearInterval(autoPlay);
					}
					autoPlay=setInterval(doPlay, opts.timer);
				});
			}
			
			// 鐩爣浜嬩欢
			targetLi.hover(function(){
				if(autoPlay){
					clearInterval(autoPlay);
				}
				index=targetLi.index(this);
				window.setTimeout(function(){$.fn.Slide.effect[opts.effect](ContentBox, targetLi, index, slideWH, opts);},200);
				
			},function(){
				if(autoPlay){
					clearInterval(autoPlay);
				}
				autoPlay = setInterval(doPlay, opts.timer);
			});
    	});
	};
	$.fn.Slide.deflunt={
		effect : "scroolY",
		autoPlay:true,
		speed : "normal",
		timer : 1000,
		defIndex : 0,
		claNav:"JQ-slide-nav",
		claCon:"JQ-slide-content",
		steps:1
	};
	$.fn.Slide.effectLoop={
		scroolLeft:function(contentObj,navObj,i,slideW,opts,callback){
			contentObj.animate({"left":-i*opts.steps*slideW},opts.speed,callback);
			if (navObj) {
				navObj.eq(i).addClass("on").siblings().removeClass("on");
			}
		},
		
		scroolRight:function(contentObj,navObj,i,slideW,opts,callback){
			contentObj.stop().animate({"left":0},opts.speed,callback);
			
		}
	}
	$.fn.Slide.effect={
		fade:function(contentObj,navObj,i,slideW,opts){
			contentObj.children().eq(i).stop().animate({opacity:1},opts.speed).css({"z-index": "1"}).siblings().animate({opacity: 0},opts.speed).css({"z-index":"0"});
			navObj.eq(i).addClass("on").siblings().removeClass("on");
			contentObj.children().eq(i).find("."+opts.spanTxt).show();
		},
		scroolTxt:function(contentObj,undefined,i,slideH,opts){
			// showTips(i*opts.steps*slideH);
			contentObj.animate({"margin-top":-opts.steps*slideH},opts.speed,function(){
                for( var j=0;j<opts.steps;j++){
                	contentObj.find("li:first").appendTo(contentObj);
                }
                contentObj.css({"margin-top":"0"});
            });
		},
		scroolX:function(contentObj,navObj,i,slideW,opts,callback){
			contentObj.stop().animate({"left":-i*opts.steps*slideW},opts.speed,callback);
			if (navObj) {
				navObj.eq(i).addClass("on").siblings().removeClass("on");
			}
		},
		scroolY:function(contentObj,navObj,i,slideH,opts){
			contentObj.stop().animate({"top":-i*opts.steps*slideH},opts.speed);
			if (navObj) {
				navObj.eq(i).addClass("on").siblings().removeClass("on");
			}
		}
	};
})(jQuery);

function tab1(o1,o2,c,e) {
	o1.each(function(i){
		$(this).bind(e,function(){
			o2.hide().eq(i).show();
			o1.removeClass(c);
			$(this).addClass(c);
		})
		if ($(this).hasClass(c)) {
			$(this).addClass(c);
			o2.hide().eq(i).show();
		}
	})
}

function showCoverAll() {
	var h = $("body").height();
	var screenHeight = $(document).height(); 
	if(h < screenHeight) {
		h = screenHeight;
	}
	$("#coverall").css("width",$(window).width());
	$("#coverall").css({"height":h + "px"});
	$("#coverall").show();
}

function hideCoverAll() {
	$("#coverall").hide();
}

// 弹出框showTips(msg,type,fnt)，用以取代showTips
// 参数说明，msg：提示内容，
// type：1（成功提示）、0或其他（错误提示） 区别在于提示文字颜色不同
// fnt: 回调函数（点击弹框确定按钮后执行的函数）
function showTips(msg,type,fnt) {
	if(msg) {
		showCoverAll();
		if(type == 1) {
			$("#tipsmsg").attr("class","vgreen");
		} else {
			$("#tipsmsg").attr("class","vred");
		}
		$("#tipsmsg").html(msg);
		$("#tipsbotton").addClass("c_tips_btn_sure");
		$("#tipsbotton").children("a").remove();
		var tsDom = $("<a href=\"javascript:void(0);\">确 定</a>");
		tsDom.click(function() {
			$(".c_tips").hide();
			hideCoverAll();
			if(fnt && typeof(fnt) == "function") {
				fnt();
			}
		});
		$("#tipsbotton").append(tsDom);
		
		var screenHeight = $(window).height(); 
		var domHght = $("body").height();
		if(domHght < screenHeight) {
			screenHeight = domHght;
		}
		var scrolltop = $(document).scrollTop(); 
		var objTop = (screenHeight - $("#warntips").height())/2 + scrolltop - 20;
		// $("#warntips").css({top: objTop + 'px'});
		$("#warntips").show();
	}
}

// 确认框showConfrmTips(msg,type,fnt)，用以取代confirm
// 参数说明，msg：提示内容，
// type：1（成功提示）、0或其他（错误提示） 区别在于提示文字颜色不同
// fnt: 回调函数（点击弹框确定按钮后执行的函数）
function showCfmTips(msg,type,fnt) {
	if(msg) {
		showCoverAll();
		if(type == 1) {
			$("#tipsmsg").attr("class","vgreen");
		} else {
			$("#tipsmsg").attr("class","vred");
		}
		$("#tipsmsg").html(msg);
		$("#tipsbotton").children("a").remove();
		var tsDom = $("<a href=\"javascript:void(0);\">确 定</a>");
		var tsDomC = $("<a href=\"javascript:void(0);\" class=\"gary_btn\">取 消</a>");
		tsDom.click(function() {
			$(".c_tips").hide();
			hideCoverAll();
			if(fnt && typeof(fnt) == "function") {
				fnt();
			}
		});
		tsDomC.click(function() {
			$(".c_tips").hide();
			hideCoverAll();
		});
		$("#tipsbotton").append(tsDom);
		$("#tipsbotton").append(tsDomC);
		
		var screenHeight = $(window).height(); 
		var domHght = $("body").height();
		if(domHght < screenHeight) {
			screenHeight = domHght;
		}
		var scrolltop = $(document).scrollTop(); 
		var objTop = (screenHeight - $("#warntips").height())/2  - 20;
		$("#warntips").css({top: objTop + 'px'});
		$("#warntips").show();
	}
}

window.root = $("#basepath").val();
window.CIPHER_KEY = $("#CIPHERKEY").val();
// 登录回调函数
function loginCallback(json) {}
// 退出之后的回调函数
function logoutCallback(json) {}
// 取消登陆回调
function logCancelCallback() {}

var hasQryCity = false;
$(document).ready(function() {
	var user_name = "";
	if (document.cookie.length>0) {
		 var c_name = "YXT_USER_LOGIN_NAME";
　　　　　　c_start = document.cookie.indexOf(c_name + "=");
　　　　　　if (c_start != -1){ 
　　　　　　　　c_start=c_start + c_name.length+1;
　　　　　　　　c_end=document.cookie.indexOf(";",c_start);
　　　　　　　　if (c_end==-1) c_end=document.cookie.length;　　
　　　　　　　　user_name = decodeURI(document.cookie.substring(c_start,c_end));
　　　　　　} 
　　}
	
	if(user_name) {
		user_name = user_name.replace("\"","").replace("\"","");
		$("#userstatediv").html("<a href=\"javascript:void(0);\">" + user_name + "</a> | <a href=\""+ root +"home/\" class=\"blue\">我的院线通</a> | <a href=\"javascript:logout();\">退出</a> | <a href=\""+ root +"help/\" target=\"_blank\">帮助</a>");
	} else {
		$.ajax({
	        url: root + "isLogin.htm",
	        dataType :"json",
	        cache: false,
	        type:"POST",
	        success: function(json) {
	        	var code = json.result;
			   	if(code == "00"){
			   		if(json.isLogin == "true") {
			   			$("#userstatediv").html("<a href=\"javascript:void(0);\">" + json.name + "</a> | <a href=\""+ root +"home/\" class=\"blue\">我的院线通</a> | <a href=\"javascript:logout();\">退出</a> | <a href=\""+ root +"help/\" target=\"_blank\">帮助</a>");
			   		} else {
			   			$("#userstatediv").html("<a href=\"javascript:register();\">注册</a> | <a href=\"javascript:login();\" id=\"loginbtn\">登录</a> | <a href=\""+ root +"help/\" target=\"_blank\">帮助</a>");
			   		}
			    }
	       },
	       error : function(json) {
	       }
		});
	}
	
	$(".c_close").click(function() {
	
		$(".c_tips").hide();
		$("#loginpop").hide();
		hideCoverAll();
		logCancelCallback();
	});
	
	$("#logincancel").click(function() {
	
		$("#loginpop").hide();
		hideCoverAll();
		logCancelCallback();
	});
	
	$("#dologin").click(function() {
		$("#accountmsg").html("");
		$("#passwordmsg").html("");
		$("#logimgmsg").html("");
		var account =  $.trim($("#loginaccount").val());
		var password =  $.trim($("#loginpassword").val());
		var isNeed = $.trim($("#needVerifyCode").val());
		var logImgCode = "";
		var remember = "";
		if($("#remember").prop("checked")) {
			remember = "on";
		}
		
		if(account == "手机号") {
			account = "";
		}
		if(account == "") {
			$("#accountmsg").html("账号不能为空");
			return;
		}
		var isIeger = false;
		var isMail = false;
		// 手机号校验
		if(/^1[3-9]\d{9}$/.test(account)) {
			isIeger = true;
		}
		// 邮箱校验
		var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		if(pattern.test(account)) {
			isMail = true;
		}
		
		if(isMail) {
			$("#accountmsg").html("该业务已限制邮箱账号登陆，如有疑问请<br>咨询客服电话 4008610001，谢谢！");
			$("#accountmsg").css({'height':'40px'});
			return;
		}
		
		if(!isIeger) {
			$("#accountmsg").html("账号只能为手机号码");
			return;
		}
		
		if(password == "") {
			$("#passwordmsg").html("密码不能为空");
			return;
		}
		
		if(isNeed == "true") {
			logImgCode = $.trim($("#loginimgcode").val());
			
			if(logImgCode == "") {
	  			$("#logimgmsg").html("请输入验证码");
	  			return;
	  		}
	  		
	  		if(!/^\d{4}$/.test(logImgCode)) {
	  			$("#logimgmsg").html("验证码错误");
	  			return;
	  		}
		}
		
		$("#loginpannel").hide();
		$("#loginloading").show();
		password = Encrypt(CIPHER_KEY, password);
		$.ajax({
	        url: root + "login.htm",
	        dataType :"json",
	        cache: false,
	        type:"POST",
	        data:{
	          	"account":account,"password":password,"remember":remember,"imgcode":logImgCode
	        },
	        success: function(json) {
	        	var code = json.result;
	        	$("#loginpannel").show();
		   		$("#loginloading").hide();
			   	if(code === "00"){
			   		$("#userstatediv").html("<a href=\"javascript:void(0);\">" + json.name + "</a> | <a href=\""+ root +"home/\" class=\"blue\">我的院线通</a> | <a href=\"javascript:logout();\">退出</a> | <a href=\""+ root +"help/\" target=\"_blank\">帮助</a>");
			   		$("#loginpop").hide();
			   		hideCoverAll();
			   		loginCallback(json);
			   	} else {
			   		if(code == "51") {
			   			// logImgRefresh();
			   			$("#logimgmsg").html(json.reason);
			   		} else if(code == "01") {
			   			$("#accountmsg").html(json.reason);
			   		} else if(code == "02") {
			   			$("#passwordmsg").html(json.reason);
			   		} else if(code == "03") {
			   			$("#logimgmsg").html(json.reason);
			   		} else if(code == "101") {
			   			// logImgRefresh();
			   			$("#accountmsg").html(json.reason);
			   		} else if(code == "504") {
			   			$("#loginpop").hide();
			   			hideCoverAll();
			   			showCfmTips(json.reason,0,function() {
			   				window.location.href = root + "forget";
			   			});
			   		}
			   		var codeFlag = json.flag;
			   		if(codeFlag == "true") {
			   			logImgRefresh();
			   			$("#loginImgCode").show();
			   			$("#needVerifyCode").val(codeFlag);
			   		}
			   	}
	       },
	       error : function(json) {
	    	   $("#accountmsg").html("亲，服务出现了点小问题… 请重新尝试");
	    	   $("#loginpannel").show();
	   		   $("#loginloading").hide();
	       }
	   	});
	});
	var loginUserInit=$.trim($("#loginaccount").val());
	$("#loginaccount").focus(function() {
		var nowUserInit=$.trim($(this).val());
		$("#accountmsg").html("");
		$("#accountmsg").css({'height':'20px'});
		if(nowUserInit==loginUserInit){
			$(this).val("");
			$(this).css("color","#000");
		}
	});
	$("#loginaccount").blur(function() {
		var nowUserInit=$.trim($(this).val());
		if(nowUserInit==""){
			$(this).val(loginUserInit);
			$(this).css("color","#939392");
		}
	});
	$("#loginpassword").focus(function() {
		$("#passwordmsg").html("");
	});
	$("#loginimgcode").focus(function() {
		$("#logimgmsg").html("");
	});
	
$("span.t_c_box").click(function() {
	
	if ($('#select_city_sub_menu').css('display')=='none') {
		if(!hasQryCity) {
			$("#loadingCity").show();
			hasQryCity = true;
			$.ajax({
			    url: root + "qryCitys.htm",
			    dataType :"html",
			    cache: false,
			    type:"POST",
			    success: function(html) {
			    	// $("#loadingCity").hide();
			    	$("#select_city_sub_menu").html(html);
			   	},
			   	error : function(json) {
				  // XXX
			   	}
			});
		}
		$('#select_city_sub_menu').show();
		$(this).find("i").addClass("cur");
	}
	else {
		$('#select_city_sub_menu').hide();
		$(this).find("i").removeClass("cur");
	}
});

$(window).mousedown(function (e) {
	var val = $(e.target).attr('data-val');
	if(!val || val != "city") {
		$('#select_city_sub_menu').hide();
	}
});

$(".cin_tabs .pq").hover(function(){
		$(".cin_tabs .u_more_list").show();
	},function(){
		$(".cin_tabs .u_more_list").hide();
	});
});

var isSupportReturnUrl = true;
function login() {
	$("#loginpannel").show();
	$("#loginloading").hide();
	// 登录
	$("#loginpop").show();
	showCoverAll();
}

function register() {
	var returnUrl = root + "goto.htm?opt=reg";
	if(isSupportReturnUrl) {
		returnUrl += "&return_url=" + window.location.href;
	}
	window.location.href = returnUrl;
}

function logout() {
	$.ajax({
        url: root + "logout.htm",
        dataType :"json",
        cache: false,
        type:"POST",
        success: function(json) {
        	var code = json.result;
		   	if(code === "00") {
		   		logoutCallback(json);
	   			$("#userstatediv").html("<a href=\"javascript:register();\">注册</a> | <a href=\"javascript:login();\" id=\"loginbtn\">登录</a> | <a href=\""+ root +"help/\" target=\"_blank\">帮助</a>");
		   	} else {
		    	showTips(json.reason);
		   	}
       },
       error : function(json) {
    	   showTips("亲，服务出现了点小问题… 请重新尝试");
       }
   	});
}

function getLoginUrl() {
	var returnUrl = root + "goto.htm?opt=log";
	if(isSupportReturnUrl) {
		returnUrl += "&return_url=" + window.location.href;
	}
	return returnUrl;
}

function getReloginUrl(){
	
	var returnUrl = root + "goto.htm?opt=relogin";
	if(isSupportReturnUrl) {
		returnUrl += "&return_url=" + window.location.href;
	}
	return returnUrl;
}

function logImgRefresh() {
	document.getElementById("logincodeimg").src = root + "randomCode.jpg?now="+new Date().getTime();
	$("#loginimgcode").val("");
	return false;
}

function loading() {
	showCoverAll();
	$("#waitingPop").show();
}

function hideLoading() {
	hideCoverAll();
	$("#waitingPop").hide();
}

function changeCity(cityid) {
	/*
	 * var returnUrl = root + "chgCity.htm?cityid="+ cityid + "&returnUrl=" +
	 * root; window.location.href = returnUrl;
	 */
	 $.ajax({
        url: root + "xhgCity.htm",
        dataType :"json",
        cache: false,
        type:"POST",
        data:{
          	"cityid":cityid
        },
        success: function(json) {
        	var code = json.result;
		   	if(code === "00") {
		   		location.reload();
		   	}
       },
       error : function(json) {}
   	});
}

function getCookie(c_name){
　　　　if (document.cookie.length>0) {
　　　　　　c_start = document.cookie.indexOf(c_name + "=");
　　　　　　if (c_start != -1){ 
　　　　　　　　c_start=c_start + c_name.length+1;
　　　　　　　　c_end=document.cookie.indexOf(";",c_start);
　　　　　　　　if (c_end==-1) c_end=document.cookie.length;　　
　　　　　　　　return unescape(document.cookie.substring(c_start,c_end));
　　　　　　} 
　　　　}
　　　　return "";
}　　

function setCookie(name,value,day) 
{
    var day = day;
    var date  = new Date(); 
    date.setTime(date.getTime() + day * 24 * 60 * 60 * 1000);
    document.cookie = name + "="+ escape(value) + ";expires=" + date.toGMTString() + ";path=/";
}

function isChinese(str){  // 鍒ゆ柇鏄笉鏄腑鏂�
	var reCh=/[u00-uff]/;
	return !reCh.test(str);
}
function getString(s,len){
	if (s == null) {
		return s;
	}
	var sl = s.length;
	if (sl <= len) {
		return s;
	}
	// 鐣欏嚭涓�釜浣嶇疆鐢ㄤ簬鈥�
	len -= 1;
	var maxCount = len * 2;
	var count = 0;
	var i = 0;
	while (count < maxCount && i < sl) {
		if (isChinese(s.charAt(i))==true) {
			count += 2;
		} else {			
			count++;
		}
		i++;
	}
	if (count > maxCount) {
		i--;
	}
	return s.substring(0, i) + "...";
}

function chkstrlen(str)
{
　　var strlen = 0;
　　for(var i = 0;i < str.length; i++)
　　{
　　　　if(str.charCodeAt(i) > 255)
　　　　　　strlen += 2;
　　　　else  
　　　　　　strlen++;
　　}
　　return strlen;
}