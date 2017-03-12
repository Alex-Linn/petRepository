var showMap = [];
currDate = "";
firstCinemaId = "";
var bs=0;
$(function (){
	var filmId = $("#filmId").val();
	$.ajax({
	    url: root + "qryShowsByFilm.htm",
	    dataType :"html",
	    cache: false,
	    type:"POST",
	    data : {"mid" : filmId},
	    success: function(html) {
	    	$("#movie_tab1").html(html);
	    	showYinping();
	    	showSix();
	    	showCinema(firstCinemaId);
	   	},
	   	error : function(json) {
	   	}
	});
});

function showSix(){
	$("#cinemalistul li:lt(6)").show();
}
function changeCinamaList(){
	var hasSelected=$("#showAll").hasClass("cur");
	if(hasSelected){
		$("#showAll").removeClass("cur");
		$("#showAll").text("全部展开");
	}else{
		$("#showAll").addClass("cur");
		$("#showAll").text("收起");
	}
}
function showAllCinema(){
	$("#cinemalistul li:gt(5)").toggle();
	changeCinamaList();
}

showZone = true;
function chgShowDate(dom,date) {
	var clz = $.trim($(dom).attr("class"));
	if(clz == "cur") {
		return;
	}
	$(dom).attr("class","cur");
	var filmId = $("#filmId").val();
	
	$.ajax({
	    url: root + "qryShowsByFilm.htm",
	    dataType :"html",
	    cache: false,
	    type:"POST",
	    data : {"mid" : filmId, "d" : date},
	    success: function(html) {
	    	$("#movie_tab1").html(html);
	    	showSix();
	    	showCinema(firstCinemaId);
	   	},
	   	error : function(json) {}
	});
}

function showAreaCinema(aid) {
	$("#arealistul a").removeClass("cur");
	$("#" + aid).addClass("cur");
	
	var type = "";
	if(aid === "allcinema") {
		//所有影院
		aid = "";
	} else if(aid === "hotcinema") {
		aid = "";
		type = "1";
	}
	var key = $.trim($("#keyword").val());
	var cinemes = searchCinema(aid,key,type);
	showSearchResult(cinemes);
	if($("#cinemalistul").find("li").length > 6){
		$("#showAll").removeClass("cur");
		$("#showAll").text("全部展开");
		$("#showAllCinema").show();
	}else{
		$("#showAllCinema").hide();
	}
}

function searchByKey() {
	var aid = $.trim($("#arealistul").find(".cur").attr("id"));
	var key = $.trim($("#keyword").val());
	var type = "";
	if(aid === "allcinema") {
		//所有影院
		aid = "";
	}else if(aid === "hotcinema") {
		//所有影院
		aid = "";
		type = "1";
	}
	var cinemes = searchCinema(aid,key,type);
	showSearchResult(cinemes);
}

var loadingShow = false;
var currCinemaId = "";
function showCinema(cid) {
	var cinemaObj = showMap[currDate + "_" + cid];
	if(cinemaObj) {
		currCinemaId = cid;
		showPaiQi(cinemaObj);
	} else {
		if(loadingShow) {
			return;
		}
		loadingShow = true;
		qryShowWaitting();
		//查询排期
		$.ajax({
		    url: root + "qrySingleShows.htm",
		    dataType :"json",
		    cache: false,
		    type:"POST",
		    data : {"mid" : filmId,"cid" : cid, "d" : currDate},
		    success: function(json) {
		    	loadingShow = false;
		    	hideQryShowWaitting();
		    	if(json.result == "00") {
		    		var cinemas = json.cinemas;
		    		var cinema = cinemas[0];
		    		currCinemaId = cid;
		    		showMap[currDate + "_" + cinema.cinemaId] = cinema;
		    		showPaiQi(cinema);
		    	} else {
		    		noDataTips("暂无排期");
		    	}
		   	},
		   	error : function(json) {
		   		loadingShow = false;
		   		hideQryShowWaitting();
		   		noDataTips("暂无排期");
		   	}
		});
	}
}

function qryShowWaitting() {
	$("#nodata").hide();
	$("#mart_div").hide();
	$("#qryshowloading").show();
}

function hideQryShowWaitting() {
	$("#qryshowloading").hide();
}

function CinemaDom(c) {
	var div = $("<div class=\"hs_mtxt fix\"></div>");
	var span1 = $("<span class=\"reset-828\"><a href=\""+ root +"cinema/"+ c.cinemaId +"/\">"+ c.cinemaName +"</a></span>");
	var span2 = $("<span class=\"adress-828\">"+ c.address +"</span>");
	div.append(span1);
	div.append(span2);
	if(c.contactTel) {
		var span3 = $("<span class=\"tel\">电话:"+ c.contactTel +"</span>");
		div.append(span3);
	}
	return div;
}

function ShowAttrDom(attr,cid) {
	var orgArr = attr.split("#");
	var div = $("<div class=\"fw_show\" id=\"cfilmype_"+ cid +"\"></div>");
	if(orgArr && orgArr.length > 0) {
		var attrArr = [];
		for(var i = 0; i < orgArr.length; i++) {
			if($.trim(orgArr[i]) == "") {
				continue;
			}
			attrArr.push(orgArr[i]);
		}
		if(attrArr.length > 1) {
			var a1 = $("<a id=\"cfilmype_"+ cid +"_all\" href=\"javascript:chgFilmAttr('"+ cid +"','all');\" class=\"cur\">全部</a>");
			div.append(a1);
		}
		for(var i = 0; i < attrArr.length; i++) {
			var clzName = "";
			if(i == 0 && attrArr.length <= 1) {
				clzName = "cur";
			}
			var ahref = $("<a id=\"cfilmype_"+ cid +"_"+ attrArr[i] +"\" href=\"javascript:chgFilmAttr('"+ cid +"','"+ attrArr[i] +"');\" class=\""+ clzName +"\">"+ attrArr[i] +"</a>");
			div.append(ahref);
		}
	}
	return div;
}

function ShowDom(show,c,idx) {
	var showTime = show.showTime;
	var stPrice = show.standPrice;
	if(stPrice) {
		if(stPrice.indexOf("-") == -1) {
			stPrice += "元";
       	}
	} else {
		stPrice = "--";
	}
	var div1 = $("<div class=\"md_mtime\">"+ showTime.substring(0,2) + ":" + showTime.substring(2) +"</div>");
	var div2 = $("<div class=\"md_mt md_mt_715\"  title=\""+ show.hallName +"\">"+ show.hallName +"</div>");
	var div3 = $("<div class=\"md_com md_com_1\"><span class=\"cdcare\">钻/金卡价</span><span class=\"price\">"+ show.vipPrice +"元</span></div>");
	var div4 = $("<div class=\"md_com md_com_2\"><span class=\"cdcare\">银卡价</span><span class=\"price\">"+ show.price +"元</span></div>");
	var div5 = $("<div class=\"md_com md_com_3\"><span class=\"cdcare\">影院价</span><span class=\"price price_1\">"+ stPrice +"</span></div>");
	var div = $("<div class=\"md_times\" id=\"cshow_"+ c.cinemaId +"_"+ show.filmAttr +"_"+ idx 
			+"\" onclick=\"qrySeats('"+ c.cinemaId +"','"+ show.showCode +"','"+ c.noticeContent +"');\"  style=\"margin-right:10px;\">");
	div.append(div1);
	div.append(div2);
	div.append(div3);
	div.append(div4);
	div.append(div5);
	return div;
}

function showPaiQi(c) {
	$("#nodata").hide();
	$("#show_div").html("");
	var shows = c.films[0].shows;
	var filmAttr = c.films[0].filmAttr;
	
	var chDom = new CinemaDom(c);
	var arDom = new ShowAttrDom(filmAttr,c.cinemaId);
	$("#show_div").append(chDom);
	$("#show_div").append(arDom);
	var div21 = $("<div class=\"mdcont_l fix\"  style=\"width:688px;\"></div>");
	for(var i = 0; i < shows.length; i++) {
		var shwDom = new ShowDom(shows[i],c,i);
		div21.append(shwDom);
	}
	var div211 = $("<div class=\"clea\"></div>");
	div21.append(div211);
	var div01 = $("<div class=\"mdcont fix\"></div>");
	div01.append(div21);
	$("#show_div").append(div01);
	$("#mart_div").show();
}

function chgFilmAttr(cid,attr) {
	$("#cfilmype_" + cid + " a").removeClass("cur");
	$("#cfilmype_" + cid + "_" + attr).addClass("cur");
	if(attr == "all") {
		$("div[id^='cshow_"+ cid +"']").show();
	} else {
		$("div[id^='cshow_"+ cid +"']").hide();
		$("div[id^='cshow_"+ cid + "_" + attr + "']").show();
	}
}

//搜索影院
function searchCinema(aid,key,type) {
	var searchCinemas = [];
	showZone = true;
	for(var i = 0; i < cinemaList.length; i++) {
		var cinema = cinemaList[i];
		if(aid) {
			showZone = false;
			if(cinema.countyCode != aid) {
				continue;
			}
		}
		if(key) {
			showZone = false;
			if(cinema.cinemaName.toLowerCase().indexOf(key.toLowerCase()) == -1) {
				continue;
			}
		}
		
		if(type == "1" && cinema.type != "1") {
			continue;
		}
		searchCinemas.push(cinema);
	}
	return searchCinemas;
}

function showSearchResult(cinemes) {
	$("#nodata").hide();
	if(cinemes && cinemes.length > 0) {
		//显示影院列表导航框
		var cid = cinemes[0].cinemaId;
		showCinema(cid);
		showCinemaNav(cinemes);
	} else {
		$("#mart_div").hide();
		noDataTips("没有符合条件的影院");
	}
}

function noDataTips(msg) {
	$("#mart_div").hide();
	$("#nodata").html(msg);
	$("#nodata").show();
}

function showCinemaNav(cinemes) {
	$("#cinemalistul li").remove();
	for(var i = 0; i < cinemes.length; i++) {
		var cinema = cinemes[i];
		var cLiDom = $("<li style='display:none' title=\""+  cinema.cinemaName +"\"><a href=\"javascript:showCinema('"+ cinema.cinemaId +"');\">"+ cinema.cinemaName +"</a></li>");
		$("#cinemalistul").append(cLiDom);
	}
	showSix();
	var cinemaLen=$("#cinemalistul li").length;
	if(cinemaLen>6){
		$("#showAllCinema").show();
	}else{
		$("#showAllCinema").hide();
	}
}

function qrySeats(cid,showid,prompt) {
	if(prompt) {
	   	 var cke = getCookie("yynotice");
	   	 if(cke) {
	   		 if(cke.indexOf(cid) <= -1) {
	   			 cke += "_" + cid;
	   			 setCookie("yynotice",cke,1);
	 	   	 	 showTips(prompt,1,function() {
	 	   	 		 window.location.href = root + "seat/" + cid + "/" + showid + "/";
		 	   	 })
	   		 } else {
	   			window.location.href = root + "seat/" + cid + "/" + showid + "/";
	   		 }
	   	 } else {
	   		 setCookie("yynotice", cid,1);
	   		 showTips(prompt,1,function() {
 	   	 		 window.location.href = root + "seat/" + cid + "/" + showid + "/";
	 	   	 })
	   	 }
    } else {
    	window.location.href = root + "seat/" + cid + "/" + showid + "/";
    }
}