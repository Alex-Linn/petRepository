$(function (){	
	//混动图片效果
	$("#i-hot  .JQ-slide-nav li").eq(0).addClass("on");
	//$("#rollimglist li").eq(0).find(".banner_scroll").show();
	$("#i-hot .JQ-slide").Slide({effect:"fade",speed:"normal",timer:4000,spanTxt:"banner_scroll"});
	$("#h_n_col_1").Slide({effect:"scroolLoop",autoPlay:false,speed:"normal",timer:3000,steps:3});
	$("#h_n_col_2").Slide({effect:"scroolLoop",autoPlay:false,speed:"normal",timer:3000,steps:3});
	$("#h_n_col_3").Slide({effect:"scroolLoop",autoPlay:false,speed:"normal",timer:3000,steps:3});
	tab1($("#go_tabs > li"),$("#go_cont > .h_n_col"),"cur","mouseover"); 
	
});

$(function (){
	var filmId = $("#hotfilmid").val();
	$.ajax({
	    url: root + "qryFilm.htm",
	    dataType :"json",
	    cache: false,
	    type:"POST",
	    data : {"mid" : filmId},
	    success: function(json) {
	    	if("00" === json.result) {
	    		var htFilm = json.films[0];
	    		var stripeImgUrl = htFilm.stripeImgUrl;
	    		if(!stripeImgUrl) {
	    			var filmPics = htFilm.filmPics;
	    			if(filmPics && filmPics.length > 0) {
	    				stripeImgUrl = filmPics[0].picUrl;
	    			}
	    		}
	    		if(!stripeImgUrl) {
	    			stripeImgUrl = root + "web/images/nopic.png";
	    		}
	    		$("#firsthotfilmimg").append("<img src=\""+ stripeImgUrl +"?w=440&quality=100\" width=\"440\" height=\"270\">");
	    	}
	   	},
	   	error : function(json) {
		  //XXX
	   	}
	});
});

var qckCid,qckFId;
$(document).ready(function() {
	/*-------------------快速购票开始start--------------------*/
	showpop = "";
	qckCinemas = null;
	var hotFilmCnt = 0;
	//生成快速购票正在热映影片
	if(hotFilms && hotFilms.length > 0) {
		hotFilmCnt = hotFilms.length;
		for(var i = 0; i < hotFilms.length; i++) {
			var aDom =  $("<a  href=\"javascript:void(0);\" id=\""+ hotFilms[i].filmId +"\">"+ hotFilms[i].filmName +"</a>");
			
			aDom.click(function() {
				qckFId = $(this).attr("id");
				qckFilmName = $.trim($(this).html());
				$("#afilm").html(qckFilmName);
				$("#acinema").html("请选择影院");
				$("#dvfilm").hide();
				$("#qckcinemares").hide();
				$("#qckcinemapre").show();
				$("#dvcinema").show();
				showpop = "acinema";
				$.ajax({
				    url: root + "qryCinemssByFilm.htm",
				    dataType :"json",
				    cache: false,
				    type:"POST",
				    data : {"mid" : qckFId},
				    success: function(json) {
				    	$("#qckcinemapre").hide();
			    		$("#qckcinemares").show();
				    	if("00" === json.result) {
				    		qckCinemas = json.cinemas;
				    		areas = json.areas;
				    		$("#arealist li").remove();
				    		$("#cinemalist").html("");
				    		$("#qrycinemacnt").text(qckCinemas.length);
				    		//默认显示全部影院
				    		var faDom = $("<a  href=\"javascript:void(0);\">全部</a>");
				    		var fliDom = $("<li></li>");
				    		fliDom.append(faDom);
				    		fliDom.click(function() {
					    		$("#cinemalist li").remove();
				    			//显示全部市辖区影院
				    			for(var j = 0; j < qckCinemas.length; j++) {
				    				showCinemsPop(qckCinemas[j]);
					    		}
				    		});
				    		$("#arealist").append(fliDom);
				    		//显示所有市辖区
				    		for(var j = 0; j < areas.length; j++) {
				    			var areaADom = $("<a  href=\"javascript:void(0);\" id=\""+areas[j].areaCode+"\">"+ areas[j].areaName +"</a>");
				    			areaADom.click(function() {
						    		$("#cinemalist li").remove();
					    			var areaid = $(this).attr("id");
					    			for(var k = 0; k < qckCinemas.length; k++) {
					    				//显示所选择的市辖区影院
					    				if(areaid == qckCinemas[k].countyCode) {
					    					showCinemsPop(qckCinemas[k]);
					    				}
						    		}
					    		});
					    		var areaLiDom = $("<li></li>");
					    		areaLiDom.append(areaADom);
					    		$("#arealist").append(areaLiDom);
				    		}
				    		//默认全部影院
				    		for(var j = 0; j < qckCinemas.length; j++) {
				    			showCinemsPop(qckCinemas[j]);
				    		}
				    	} else {
				    		//查无影院
				    		$("#cinemalist").html("<p style=\"margin-bottom:10px;\">暂无影院信息</p>");
				    	}
				   	},
				   	error : function(json) {
				   		showTips("亲，服务出现了点小问题… 请重新尝试");
				   	}
				});
			});
			 
			var liDom = $("<li></li> ");
			liDom.append(aDom);
			$("#hotfilmspop").append(liDom);
		}
	}
	$("#hotFilmCnt").html("<strong>正在上映电影</strong> 共"+ hotFilmCnt +"部");
	
 	function showCinemsPop(cinema) {
 		var cinemaADom = $("<a  href=\"javascript:void(0);\" title=\""+cinema.cinemaName+"\" id=\""+ cinema.cinemaId +"\">"+getString(cinema.cinemaName,15) +"</a>");
 		cinemaADom.click(function() {
 			qckCid = $(this).attr("id");
 			qckCinemaName = $.trim($(this).html());
			$("#acinema").html(getString(qckCinemaName,13));
			$("#acinema").attr("title",$(this).attr("title"));
			$("#dvcinema").hide();
			$("#qckshowres").hide();
			$("#qckshowpre").show();
			$("#dvtime").show();
			showpop = "atime";
			
			$.ajax({
			    url: root + "qryShows.htm",
			    dataType :"json",
			    cache: false,
			    type:"POST",
			    data : {"mid" : qckFId , "cid" : qckCid},
			    success: function(json) {
					$("#qckshowpre").hide();
					$("#qckshowres").show();
			    	showTimePop(json);
			   	},
			   	error : function(json) {
				  //XXX
			   	}
			});
		});
 		
		var cinemaLiDom = $("<li style=\"width:198px;\"></li>");
		cinemaLiDom.append(cinemaADom);
		$("#cinemalist").append(cinemaLiDom);
 	}
 	
 	function showTimePop(json) {
 		if("00" === json.result) {
    		var currDate = json.currDate;
    		var showDates = json.showDate;
    		var shows = json.shows;
    		$("#showtimes li").remove();
    		$("#showtimelist li").remove();
    		
    		if(showDates && showDates.length > 0) {
    			//排期日期列表
        		for(var i = 0; i < showDates.length; i++) {
        			var date = showDates[i];
        			var stLiDom;
        			if(currDate == date.date) {
        				//当前所选日期
        				stLiDom = $("<li class=\"orange\">"+ date.desc +"</li>");
        			} else {
        				var stADom = $("<a  href=\"javascript:void(0);\" id=\""+ date.date +"\">"+ date.desc +"</a>");
        				stADom.click(function() {
    			    		var selDate = $(this).attr("id");
    			    		$("#showtimelist li").remove();
    			    		$.ajax({
    			    		    url: root + "qryShows.htm",
    			    		    dataType :"json",
    			    		    cache: false,
    			    		    type:"POST",
    			    		    data : {"mid" : qckFId , "cid" : qckCid , "d": selDate},
    			    		    success: function(json) {
    			    		    	showTimePop(json);
    			    		   	},
    			    		   	error : function(json) {
    			    		   		//XXX
    			    		   	}
    			    		});
    		    		});
        				
        				stLiDom = $("<li></li>");
        				stLiDom.append(stADom);
        			}
        			$("#showtimes").append(stLiDom);
        		}
        		//显示排期时间列表
        		showTimeListPop(shows);
    		}
    	}
 	}
 	//显示快速购票中排期时间显示POP
 	function showTimeListPop(shows) {
 		if(shows && shows.length > 0) {
 			for(var i = 0; i < shows.length; i++) {
 				var show = shows[i];
 				var fmtShowTime = show.showTime.substring(0, 2) + ":" + show.showTime.substring(2, 4);
 				var stADom2 = $("<a  href=\""+ root + "seat/"+ qckCid + "/" + show.showCode +"/\">"+ fmtShowTime +"</a>");
 				stADom2.click(function() {
 					showpop = "";
 					$("#dvtime").hide();
 				});
 				var liDom2 = $("<li></li>");
 				liDom2.append(stADom2);
 				$("#showtimelist").append(liDom2);
 			}
 		} else {
 			var liDom2 = $("<li style=\"width:410px;text-align:center;\">暂无场次信息</li>");
			liDom2.append(stADom2);
			$("#showtimelist").append(liDom2);
 		}
 	}
 	
   $("a.s_b_a").click(function() {
		var aid = $(this).attr("id");
		if(showpop && aid == showpop) {
			$(".s_b_pos1").hide();
			showpop = "";
			return;
		}
		$(".s_b_pos1").hide();
		
		if("afilm" === aid) {
			showpop = "afilm";
			//选择影片
			$("#dvfilm").show();
		} else if("acinema" === aid) {
			if(!qckFId) {
				showpop = "afilm";
				//选择影片
				$("#dvfilm").show();
			} else {
				showpop = "acinema";
				$("#dvcinema").show();
			}
		} else if("atime" === aid) {
			if(!qckFId) {
				showpop = "afilm";
				//选择影片
				$("#dvfilm").show();
				return;
			}
			if(!qckCid) {
				showpop = "acinema";
				$("#dvcinema").show();
				return;
			} 
			showpop = "atime";
			$("#dvtime").show();
		}
	});
   /*-------------------快速购票结束end--------------------*/
   
   /*-------------------热门推荐开始start-------------------*/
   if(hotFilms && hotFilms.length > 0) {
		for(var i = 0; i < 3 && i < hotFilms.length; i++) {
			var hotADom = $("<a href=\""+ root + "movie/"+ hotFilms[i].filmId +"/" +"\" fid=\""+ hotFilms[i].filmId +"\">" + hotFilms[i].filmName + "&nbsp;&nbsp;&nbsp;</a>");
			$("#hottuijian").append(hotADom);
		}
   }
   /*-------------------热门推荐结束始end--------------------*/
   
   /*-------------------优惠快讯开始start-------------------*/
   if(huoDongs && huoDongs.length > 0) {
	   var hd1 = huoDongs[0];
	   var hd1Img = $("<img src=\""+ hd1.imgUrl +"\">");
	   var url = hd1.link_url;
	   if(url == ''){
		   var url = root + "activity/" + hd1.id + "/";
	   }
	   $("#huodong01img").append(hd1Img);
	   $("#huodong01img").attr("href",url);
	   $("#huodong01img").attr("target","_blank");
	   $("#hd1title").html(hd1.title);
	   $("#hd1title").attr("href",url);
	   $("#hd1title").attr("target","_blank");
	   $("#hd1summary").html(hd1.summary);
	   
	   for(var i = 1; i < huoDongs.length; i++) {
		   url = huoDongs[i].link_url;
		   if(url == ''){
			   var url = root + "activity/" + huoDongs[i].id + "/";
		   }
		   $("#otherhd").append($("<li><a target=\"_blank\" href=\""+ url +"\">"+ huoDongs[i].title +"</a></li>"));
		}
   }
   /*-------------------优惠快讯结束end--------------------*/
   
   var prefilmids = $("#prefilmids").val();
   $.ajax({
	    url: root + "qryFilmGrade.htm",
	    dataType :"json",
	    cache: false,
	    type:"POST",
	    data : {"mids" : prefilmids},
	    success: function(json) {
	    	if("00" === json.result) {
	    		var grades = json.grades;
	    		for(var i = 0; i < grades.length; i++) {
	    			$("#prefilm_tatal_" + grades[i].filmId).html(grades[i].total);
	    		}
	    	}
	   	},
	   	error : function(json) {
	   	}
	});
   
   var hotFilmId = $("#hotfilmid").val();
   $.ajax({
	    url: root + "qryHotCinemss.htm",
	    dataType :"json",
	    cache: false,
	    type:"POST",
	    data : {"mid" : hotFilmId},
	    success: function(json) {
	    	if("00" === json.result) {
	    		var cinemas = json.cinemas;
	    		for(var i = 0; i < 6 && i < cinemas.length; i++) {
	    			var cTab = $("<li><a href=\""+ root +"cinema/"+ cinemas[i].cinemaId +"/\">" + cinemas[i].cinemaName + "</a></li>");
	    			$("#hotcinemas").append(cTab);
	    		}
	    		var cinemaDesc = "共" + json.cinemaCnt + "家影院，" + json.showCnt + "场次";
	    		$("#showsinfo").html(cinemaDesc);
	    	}
	   	},
	   	error : function(json) {
	   	}
	});
});

function updateFilmGrade(id,name) {
	if(id && name) {
		var ckeValue = getCookie("film");
	   	 if(ckeValue) {
	   		 if(ckeValue.indexOf(id) <= -1) {
	   			ckeValue += "_" + id;
	   			setCookie("film",ckeValue,30);
	   		 } else {
	   			 return;
	   		 }
	   	 } else {
	   		 setCookie("film", id,30);
	   	 }
		
		$.ajax({
		    url: root + "updateFilmGrade.htm",
		    dataType :"json",
		    cache: false,
		    type:"POST",
		    data : {"mid" : id , "filmName" : name},
		    success: function(json) {
		    	if("00" === json.result) {
		    		var grades = json.grades;
		    		var total = 998;
		    		try{
		    			total = parseInt($.trim($("#prefilm_tatal_" + id).html()));
		    		}catch(e) {
		    		}
		    		$("#prefilm_tatal_" + id).html(total+1);
		    	}
		   	},
		   	error : function(json) {}
		});
	}
}