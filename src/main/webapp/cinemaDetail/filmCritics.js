var sourceChannel="web";
var filmCriticsLength=parseInt($("#textCount-300").text());
function checkNull(o){
		if(o==undefined||o==null||o=="")
			return false;
		else
			return true;
	}
    var pageRoot=0;
    var pageRoot1=0;
    var cur=-1; 
	//分页模块处理
    function showPageBtn(pageCount,flagSort){
    if(pageCount == 0){
     return ;
    }
   var html = "";
   if(pageRoot>1){
     html += "<a href=\"#fixtabul\" onclick=\"javascript:callPage("+(pageRoot-1)+",'"+flagSort+"'"+")\">上一页</a>";
   }   
   if((pageRoot-2)>1){
     html += "<a href=\"#fixtabul\" onclick=\"javascript:callPage(1"+",'"+flagSort+"'"+")\">1</a>";
     html += "...";
   }
   for(var p=1;p<=pageCount;p++){
     if((pageRoot-p)>=-2 && (pageRoot-p)<=2){
       if(pageRoot==p){
         html += "<a href=\"#fixtabul\" onclick=\"javascript:callPage("+p+",'"+flagSort+"'"+")\"><font color='#F76300'>"+p+"</font></a>";
       }else {
         html += "<a href=\"#fixtabul\" onclick=\"javascript:callPage("+p+",'"+flagSort+"'"+")\">"+p+"</a>";
       }
     }
   }
   if((pageRoot+2)<pageCount){
     html += "...";
     html += "<a href=\"#fixtabul\" onclick=\"javascript:callPage("+pageCount+",'"+flagSort+"'"+")\">"+pageCount+"</a>";
   }

   if(pageRoot<pageCount){
     html += "<a href=\"#fixtabul\" onclick=\"javascript:callPage("+(pageRoot+1)+",'"+flagSort+"'"+")\">下一页</a>";
   }

   $(".pagecontrolre").empty();
   $(".pagecontrolre").html(html);
 }
 function callPage(num,flagSort){
	 showCritic(num,flagSort);
	// window.scroll(0, 430);
 }
 
 //影评展示
 function filmCriticsList(list){

	 if(checkNull(list)){
		 var listNum=list.length;		 
		 for(var i=0;i<listNum;i++){
			 //头像
		     var headPic=$("<span class='ico_face'></span>");
		     var img="";
		     if(list[i].headPic!=""){
		    	 img+="<img src='"+list[i].headPic+"' width='52' height='52' />";
 	    	}else{
 	    		img+="<img src='"+root+"web/images/ele_07.jpg' width='52' height='52' />";
 	    	 }
		     var headPicDiv=headPic.append(img);
		    
		     //用户名
		     var usernameP=$("<p class='cmt_hd'></p>");
		     var username="";
		     if(list[i].userName){
		    	 username=list[i].userName;
           	}else{
           		username=list[i].tel;
           	}
		     username="<span class='t'>"+username+"</span>";
		     var usernameDiv=usernameP.append(username);
		     //评论内容
		     var contentDiv=$("<div class='cmt_bd'><p style='word-break:break-all;word-wrap:break-word'>"+list[i].content+"</p></div>");
		     //评分
		     var score=parseInt(list[i].score);
		     var scoreouter=$("<div class='art_score fl'></div>");
		     var scoreTitle=$("<em class='score_t fl'>评分：</em>");
		     var scoreSpan=$("<span class='hitscore'></span>");
		     var scoreImg="";
		     if(score>0&&score<11){
           		scoreImg=$("<span class='scorew' style='width:"+score+"0%;'></span>");
           	 }
		     var scoreStar=scoreSpan.append(scoreImg);
		     
		     var scoreDiv=scoreouter.append(scoreTitle).append(scoreStar);
		   
		     //创建时间
		     var timeDiv=$("<div class='art_times fl'>"+list[i].createTime+"</div>");
		     //赞、踩、回复
		     var praise=$("<span class='cmt_agree' onclick='praiseOrTrod(this)' id='praise_"+list[i].id+"'>赞(<span class='praise_num' style='padding:0px;'>"+list[i].praiseNum+"</span>)</span>|");
		     var trod=$("<span class='cmt_disagree' onclick='praiseOrTrod(this)' id='trod_"+list[i].id+"'>踩(<span class='trod_num' style='padding:0px;'>"+list[i].trodNum+"</span>)</span>|");
		     var reply=$("<span class='cmt_feedback'  onclick='toggle(this)' id='reply_"+list[i].id+"'>回复("+list[i].replyNum+")</span>");
		     var numouter=$("<div class='art_stu fr'></div>");
		     var numDiv=numouter.append(praise).append(trod).append(reply);
		     var scoreCon=$("<div class='cmt_fd fix'></div>");
		     //评分区域
		     var scoreConDiv=scoreCon.append(scoreDiv).append(timeDiv).append(numDiv);
		     //用户信息
		     var userDiv=$("<div class='cmt_cont'></div>");
		    //回复列表 start
		     var clear=$("<div class='clear'></div>");
		     var replyDiv=$("<div id='slide_"+list[i].id+"' style='display:none;'></div>");
		     var topReply=$("<div class='top-reply'><img src='"+root+"web/images/ts_j.jpg' width='24' height='11'/></div>");
		     var hF=$("<div class='huiFu'></div>")
		     var inputText=$("<input name='textfield' type='text' class='textfield replyRemainNumInput' onkeyup=\"onlyIntegerKeyUp(this,event)\"  onclick='toLogin()'>");
		     var inputBtn=$("<input name='button1' type='button' class='btnReply' onclick='submitHuifu(this)' id='button_"+list[i].id+"'><div class='clear'></div>");
		     var numCon=$("<table width='100%' border='0' cellspacing='0' cellpadding='0' style='font-size:12px;'><tbody><tr><td height='26'>共<span id='totalReply_"+list[i].id+"'>0</span>条</td><td align='right'>还可以输入 <span class='replyRemainNum'>140</span> 字</td><td width='100'>&nbsp;</td></tr></tbody></table>");
		     var outerReply=$("<div></div>").append(inputText).append(inputBtn).append(numCon);
		     var listCon=$("<div id='replyTab_"+list[i].id+"'></div>");
		     var hFDiv=hF.append(outerReply).append(listCon);
		     var mainInput=replyDiv.append(topReply).append(hFDiv);
		   //回复列表 end	     
		     var userCon=userDiv.append(usernameDiv).append(contentDiv).append(scoreConDiv).append(clear).append(mainInput);
		     var oneDiv=$("<div style='width:100%;'></div>");
		     var filmIco=$("<div class='cmt_acont fix'></div>"); 
		     var filmCriticSec=oneDiv.append(headPicDiv).append(userCon);   
		     var twoDiv=filmIco.append(filmCriticSec);
		     $("#filmcritics").append(twoDiv);
		 }
	 }else{
		 var noFilm=$("<div class='no_film_critics'>未找到相关影评</div>");
		 $("#filmcritics").append(noFilm);
	 }
 }
//影评列表
 function showCritic(num,flagSort){
   pageRoot=num;
   var sort=0;
   if(flagSort=="r"){
	   sort=2;
   }else{
	   sort=1;  
   }
   $.ajax({
  	      url: root+"filmcritics/criticsList.action",
  	      dataType :"json",
  	      cache: false,
  	      type:"POST",
  	      data:{
  	    	movieId:filmId,sort:sort,pageNo:pageRoot,sourceChannel:sourceChannel,time:new Date().getMilliseconds()
  	      },
  	      success: function(json) {
  	    	if(json.code=="200"){
  	    		$("#filmcritics").empty();
  	    		var totalpage=parseInt(json.pageSum);
  	    		var totalnum=parseInt(json.sum);
  	    		var list = json.criticsList;
  	    		filmCriticsList(list);
  	    		 if(json.pageSum>1){
  	  	        	  $(".pagecontrolre").empty();
  	    	       	  showPageBtn(totalpage,flagSort);  
  	  	          }else{
  	  	        	 $(".pagecontrolre").empty();  
  	  	          }  
  	    		$("#totalbar").text("");
  	    		$("#totalbar").text(totalnum);
  	    	}else if(json.code=="400"){
  	    		 $("#filmcritics").empty();
  	    		 var noNum=$("<div style='line-height:40px;text-align:center;'>未找到相关影评</div>");
  	    		 $("#filmcritics").append(noNum);
  	    		$("#totalbar").text("");
  	    		$("#totalbar").text("0");
  	    	}
  	    	else{
  	    		//showTips(json.msg);
  	    	}
  	      },
  	      error : function(json) {
  	  		//showTips("系统错误，请稍后再试！！！");
  	      }
  	 	});
 }
 //赞或踩
 function praiseOrTrod(obj){
     var arr=obj.id.split("_");
     var commentId=arr[1];
     if(arr[0]=="praise"){
    	 $.ajax({
    	      url: root+"filmcritics/addPraise.action",
    	      dataType :"json",
    	      cache: false,
    	      type:"POST",
    	      data:{
    	    	 commentId:commentId,sourceChannel:sourceChannel,time:new Date().getMilliseconds()
    	      },
    	      success: function(json) {
    	    	if(json.code=="200"){
    	    		$("#"+obj.id).find(".praise_num").text(json.sum);
    	    	}else{
    	    		showTips(json.msg);
    	    	}
    	      },
    	      error : function(json) {
    	  		//showTips("系统错误，请稍后再试！！！");
    	      }
    	 	}); 
     }
     if(arr[0]=="trod"){
    	 $.ajax({
    	      url:  root+"filmcritics/addTrod.action",
    	      dataType :"json",
    	      cache: false,
    	      type:"POST",
    	      data:{
    	    	 commentId:commentId,sourceChannel:sourceChannel,time:new Date().getMilliseconds()
    	      },
    	      success: function(json) {
    	    	if(json.code=="200"){
    	    		$("#"+obj.id).find(".trod_num").text(json.sum);
    	    	}else{
    	    		showTips(json.msg);
    	    	}
    	      },
    	      error : function(json) {
    	  		//showTips("系统错误，请稍后再试！！！");
    	      }
    	 	}); 
     }
	
 }
 //获取最近一次评分
 function getOldScore(){
 	$.ajax({
	      url: root+"filmcritics/selectUserScore.action",
	      dataType :"json",
	      cache: false,
	      type:"POST",
	      data:{
	    	movieId:filmId,sourceChannel:sourceChannel,time:new Date().getMilliseconds()
	      },
	      success: function(json) {
	    	if(json.code=="200"){
	    			var scoreuser=json.score;
	    			if(scoreuser>0&&scoreuser<11){
			    		    $("#msgTime").empty();
			    			$("#msgTime").text("温馨提示：您上次的评分是"+scoreuser+"分");
			  	    		cur=scoreuser-1;
			  	    		$("#hitscore a").children().attr("src",root+"web/images/ele_12.jpg");
			  	  	    	for(var i=0;i<=cur;i++){
			  	  	    	  		$("#hitscore a").eq(i).children().attr("src",root+"web/images/ele_11.jpg");
			  	  	    	} 
	    			}
	    	}else{
	    		//showTips(json.msg);
	    	}
	      },
	      error : function(json) {
	  		//showTips("系统错误，请稍后再试！！！");
	      }
	 	}); 
 }
 //登录处理
 function toLogin(obj){
	  var flag=false;
	 $.ajax({
	        url: root + "isLogin.htm",
	        dataType :"json",
	        cache: false,
	        type:"POST",
	        data:{
  	    	  time:new Date().getMilliseconds()
  	      },
	        success: function(json) {
	        	var code = json.result;
			   	if(code == "00"){
			   		if(json.isLogin == "true") {
			   			   flag=true;
			   			   try{
			   				 if(checkNull(obj.id)){
				   				  //评分操作
			   					 getOldScore();  
				   			 }
			   			   } catch(e) {
			   			   }
			   		} else {
			   				$("#loginpop").show();
			   				showCoverAll();
			   		}
			    }
	       },
	       error : function(json) {
	       }
		});
	 return flag;
 }
//弹出框showTips(msg,type,fnt)，用以取代showTips
//参数说明，msg：提示内容，
//       type：1（成功提示）、0或其他（错误提示） 区别在于提示文字颜色不同
//       fnt: 回调函数（点击弹框确定按钮后执行的函数）
function showTips(msg,type,fnt,page,flag) {
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
				fnt(page,flag);
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
		//$("#warntips").css({top: objTop + 'px'});
		$("#warntips").show();
	}
}
//提交影评判断
 function submitCritics(){
			    var content=$("#discuss-300").val();
				var score=cur+1;
				if(score>10){
					score=10;
				}
				 if(score<1){
						showTips("请为电影进行打分！");
						return;
					}
				 if($("#discuss-300").val()==""){
						showTips("评论内容不能为空");
						return;
					}
				$.ajax({
		    	      url: root+"filmcritics/addCritics.action",
		    	      dataType :"json",
		    	      cache: false,
		    	      type:"POST",
		    	      data:{
		    	    	  movieId:filmId,movieName:filmName,score:score,content:content,sourceChannel:sourceChannel,time:new Date().getMilliseconds()
		    	      },
		    	      success: function(json) {
		    	    	if(json.code=="200"){
		    	    		$("#discuss-300").val("");
		    	    		$("#msgTime").empty();
		    	    		$("#msgTime").text("温馨提示：您上次的评分是"+json.fcm.score+"分");
		    	    		$("#textCount-300").text(filmCriticsLength);
		    	    		$("#changeTab").find("li").removeClass("cur");
		    	    	    $("#z").addClass("cur");
		    	    	   
		    	    	    showCritic(1,"z");
		    	    	}else if(json.code=="405"){
		    	    		$("#discuss-300").val("");
		    	    		$("#msgTime").empty();
		    	    		$("#textCount-300").text(filmCriticsLength);
		    	    		$("#changeTab").find("li").removeClass("cur");
		    	    	    $("#z").addClass("cur");
		    	    	    $("#hitscore a").children().attr("src",root+"web/images/ele_12.jpg");
		    	    		 showTips(json.msg,0,showCritic,1,"z");
		    	    	}else if(json.code=="-3"){
		    	    		toLogin();
		    	    	}else{
		    	    		showTips(json.msg);
		    	    	}
		    	      },
		    	      error : function(json) {
		    	  		//showTips("系统错误，请稍后再试！！！");
		    	      }
		    	 	}); 	
}

 //回复列表
 function toggle(obj){
	 var commentId=obj.id.split("_")[1];
	$("#slide_"+commentId).toggle();
	postReply(commentId,1);
 }
 function showList(list){
	 
	 if(checkNull(list)){
		 var listNum=list.length;
		 
		 for(var i=0;i<listNum;i++){
			 var replyCon=$("<div class='hf_list'></div>");
			 var table=$("<table width='100%' border='0' cellspacing='0' cellpadding='0'></table>"); 
			 //头像
			 var img="";
		     if(list[i].headPic!=""){
		    	 img="<img src='"+list[i].headPic+"' width='46' height='46' />";
 	    	}else{
 	    		img="<img src='"+root+"web/images/ele_07.jpg' width='46' height='46' />";
 	    	 }
		    var imgTd=$("<td width='58' rowspan='2' valign='top'></td>");
		    var imgDiv=imgTd.append(img);
		    //用户
		    var name="";
		    if(checkNull(list[i].usName)){
				name+=list[i].usName+"：";
			}else if(checkNull(list[i].usTel)){
				name+=list[i].usTel+"：";		
			}else{
				name+=list[i].usId+"：";
			}
		    if(checkNull(list[i].ssId)){
				if(checkNull(list[i].ssName)){
					name+="回复&nbsp;&nbsp;"+list[i].ssName+"&nbsp;&nbsp;";	
				}else if(checkNull(list[i].ssTel)){
					name+="回复&nbsp;&nbsp;"+list[i].ssTel+"&nbsp;&nbsp;";	
				}else{
					name+="回复&nbsp;&nbsp;"+list[i].ssId+"&nbsp;&nbsp;";
				}
			}
		    var username=$("<span class='title_w' style='padding-bottom:10px;'>"+name+"</span>");
		    var conAndTime=$("<span style='word-break:break-all;word-wrap:break-word'>"+list[i].content+"("+list[i].createTime+")"+"</span>");
		    var conTd=$("<td></td>");
		    var conDiv=conTd.append(username).append(conAndTime);
		    var firstTr=$("<tr></tr>").append(imgDiv).append(conDiv);
		    

		   var reply=$("<a href='javascript:void(0);'  class='w1' onclick='replySec(this)' id='replyToOther-"+list[i].id+"-"+list[i].usId+"-"+list[i].commentId+"'>回复</a>");
		   var replyTd=$("<td align='right'></td>").append(reply);
		   var twoTr=$("<tr></tr>").append(replyTd);
		   var conReply=table.append(firstTr).append(twoTr);
		   
		   //回复回复
		   var floorCon=$("<div class='mar-top' id='replyBlock-"+list[i].id+"-"+list[i].usId+"-"+list[i].commentId+"' style='display:none;'></div>");
		   var inputFloor=$("<input name='textfield' type='text' class='inputStyle replyRemainNumInput' onkeyup=\"onlyIntegerKeyUp(this,event)\" onclick='toLogin()'>");
		   var floorBtn=$("<input name='button' type='button' class='btnReply' onclick='replyOtherSub(this)'  id='button-"+list[i].id+"-"+list[i].usId+"-"+list[i].commentId+"'>");
		   var clear=$("<div class='clear'></div>");
		   var numCon=$("<table width='100%' border='0' cellspacing='0' cellpadding='0'><tbody><tr><td height='26'>&nbsp;</td><td align='right' style='font-size:12px;'>还可以输入 <span class='replyRemainNum'>140</span> 字</td><td width='100'>&nbsp;</td></tr></tbody></table>");
		   var floorDiv=floorCon.append(inputFloor).append(floorBtn).append(clear).append(numCon);
		   var allList=replyCon.append(conReply).append(floorDiv);
		   $("#replyTab_"+list[i].commentId).append(allList);
		 }	 
	 }
 }
 //请求回复列表
 function showPageBtn1(pageCount,commentId){
if(pageCount == 0){
 return ;
}
var html = "";

if(pageRoot1>1){
 html += "<a href=\"#reply_"+commentId+"\" onclick=\"javascript:callPage1("+(pageRoot1-1)+","+commentId+")\">上一页</a>";
}

if((pageRoot1-2)>1){
 html += "<a href=\"#reply_"+commentId+"\" onclick=\"javascript:callPage1(1"+","+commentId+")\">1</a>";
 html += "...";
}
for(var p=1;p<=pageCount;p++){
 if((pageRoot1-p)>=-2 && (pageRoot1-p)<=2){
   if(pageRoot1==p){
     html += "<a href=\"#reply_"+commentId+"\" onclick=\"javascript:callPage1("+p+","+commentId+")\"><font color='#F76300'>"+p+"</font></a>";
   }else {
     html += "<a href=\"#reply_"+commentId+"\" onclick=\"javascript:callPage1("+p+","+commentId+")\">"+p+"</a>";
   }
 }
}
if((pageRoot1+2)<pageCount){
 html += "...";
 html += "<a href=\"#reply_"+commentId+"\" onclick=\"javascript:callPage1("+pageCount+","+commentId+")\">"+pageCount+"</a>";
}
if(pageRoot1<pageCount){
 html += "<a href=\"#reply_"+commentId+"\" onclick=\"javascript:callPage1("+(pageRoot1+1)+","+commentId+")\">下一页</a>";
}
return html;
}
function callPage1(num,commentId){
 postReply(commentId,num);
}
 function postReply(commentId,pageNo){
	    pageRoot1=pageNo;
		$.ajax({
		      url: root+"filmcritics/replyList.action",
		      dataType :"json",
		      cache: false,
		      type:"POST",
		      data:{
		    	 commentId:commentId,pageNo:pageNo,sourceChannel:sourceChannel,time:new Date().getMilliseconds()
		      },
		      success: function(json) {	
		    	if(json.code=="200"){
		    		$("#replyTab_"+commentId).empty();
		    		$("#totalReply_"+commentId).text(json.sum);
		    		var list=json.replyList;
		    		showList(list);
		    		if(json.pageSum>1){	    				
    					//显示分页
    				   var pageHtml=showPageBtn1(json.pageSum,commentId);
    			   }
		    		 var pageBtn=$("<div class='pageshow'></div>").append(pageHtml);
		    		 $("#replyTab_"+commentId).append(pageBtn);
		    	}else if(json.code=="400"){
		    		$("#totalReply-"+commentId).text("0");
		    	}else{
		    		showTips(json.msg);
		    	}
		      },
		      error : function(json) {
		  		//showTips("系统错误，请稍后再试！！！");
		      }
		 	});
 }
//添加回复影评
 function submitHuifu(obj){
	     var commentId=obj.id.split("_")[1];
	     var content=$("#button_"+commentId).prev().val();
		 if(content==""){
				showTips("评论内容不能为空");
				return;
		 }
	     ajaxReplyOther(commentId,content,"");
 }
 //回复列表
 function ajaxReplyOther(commentId,content,ssId){
	 $.ajax({
	      url: root+"filmcritics/addReply.action",
	      dataType :"json",
	      cache: false,
	      type:"POST",
	      data:{
	    	  movieName:filmName,commentId:commentId,content:content,sourceChannel:sourceChannel,ssId:ssId,time:new Date().getMilliseconds()
	      },
	      success: function(json) {
	    	if(json.code=="200"){
	    		if(ssId==""){
	    			$("#button_"+commentId).parent().find(".replyRemainNumInput").val("");
	    			$("#button_"+commentId).parent().find(".replyRemainNum").text(filmCriticsLength);
	    		}	
	    		postReply(commentId,1);
	    	}else if(json.code=="405"){
	    		if(ssId==""){
	    			$("#button_"+commentId).parent().find(".replyRemainNumInput").val("");
	    			$("#button_"+commentId).parent().find(".replyRemainNum").text(filmCriticsLength);
	    		}
	    		showTips(json.msg,0,postReply,commentId,1);
	    	}else if(json.code=="-3"){
	    		toLogin();
	    	}else{
	    		showTips(json.msg);
	    	}
	      },
	      error : function(json) {
	      }
	 	});
 }
 //回复回复内容
 function replyOtherSub(obj){
	 var commentId=obj.id.split("-")[3];
     var content=$("#button-"+obj.id.split("-")[1]+"-"+obj.id.split("-")[2]+"-"+commentId).prev().val();
     var ssId=obj.id.split("-")[2];
     if(content==""){
			showTips("评论内容不能为空");
			return;
	 }
     ajaxReplyOther(commentId,content,ssId);
 }
 //点击回复列表回复添加输入框
 function replySec(obj){
	 var arr=obj.id.split("-");
	 $("#replyBlock-"+arr[1]+"-"+arr[2]+"-"+arr[3]).toggle();
 }
//切换标签
 function calltagPage(obj){
 	var flag=obj.id;
     $("#changeTab").find("li").removeClass("cur");
     $("#"+flag).addClass("cur");
     showCritic(1,flag);
 }
 $(document).ready(function(){
	 $("#discuss-300").keyup(function(){
		  var curLength=$(this).val().length;	
		  if(curLength>filmCriticsLength){
			var num=$(this).val().substr(0,filmCriticsLength);
			$(this).val(num);
			$("#textCount-300").text(0);
			}
			else{
				$("#textCount-300").text(filmCriticsLength-$(this).val().length);
			} 		    
		});
	//点击评分
 	$("#hitscore a").click(function(){ 
 		cur=$(this).index();
 		$("#hitscore a").children().attr("src",root+"web/images/ele_12.jpg");
 		for(var i=0;i<=cur;i++){
 	  		$("#hitscore a").eq(i).children().attr("src",root+"web/images/ele_11.jpg");
 		}
 	});
 	 //字数限制200字
	/* $(".replyRemainNumInput").on("keyup",function(){
		 var curLength=$(this).val().length;	
		  if(curLength>filmCriticsLength){
			var num=$(this).val().substr(0,filmCriticsLength);
			$(this).val(num);
			$(this).parent().find(".replyRemainNum").text(0);
			}
			else{
				$(this).parent().find(".replyRemainNum").text(filmCriticsLength-$(this).val().length);
			}     
	  });*/
 });
 
 function onlyIntegerKeyUp(self,e) {
	 var curLength=$(self).val().length;	
	  if(curLength>filmCriticsLength){
		var num=$(self).val().substr(0,filmCriticsLength);
		$(self).val(num);
		$(self).parent().find(".replyRemainNum").text(0);
		}
		else{
			$(self).parent().find(".replyRemainNum").text(filmCriticsLength-$(self).val().length);
		}  
 }
 
