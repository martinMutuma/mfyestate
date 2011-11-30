$(function(){
	var br=navigator.userAgent.toLowerCase();
	var browserVer=(br.match(/.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/) || [0, '0'])[1];
	$("#cnBody li").hover(function(){
		$(this).removeClass("li_out");
		$(this).addClass("li_over");
		var top = $(this).position().top;
		$(this).children("div").css({left:$(this).position().left+230+'px',top:top+'px'}).show();
	},
	function(){
		$(this).removeClass("li_over");
		$(this).addClass("li_out");
		$(this).children("div").hide();
	})
	$("#cnBody li div span").hover(function(){
		$(this).removeClass("cate_out");
		$(this).addClass("cate_over");
		$(this).children("div").show();
	},
	function(){
		$(this).removeClass("cate_over");
		$(this).addClass("cate_out");
		$(this).children("div").hide();
	})
	var abtemp = "atBody_t0";
	$("#atBody li").hover(function(){
		var id = $(this).attr("id");
		if(id.indexOf("atBody_s")==-1){
			$("#"+id.replace("_t","_s")).show();
			$(this).hide();
			$("#"+abtemp.replace("_t","_s")).hide();
			$("#"+abtemp).show();
			abtemp = id;
		}
	},function(){
		
	})
	if(document.getElementById("IMG_UL_LIST_1"))
		InitSwitchObj();
	$("#estate .search_title_tab").hover(function(){
		$(this).addClass("checked_title_tab");
	},function(){
		var value = $(this).html();
		if(value!="写字楼"&&value!="商铺")
			$(this).removeClass("checked_title_tab");
	})
})


function InitSwitchObj() {
	IMGLIST = $("#IMG_UL_LIST_1");
	IMGINDEX = $("#IMG_INDEX_UL_LIST_1");
	MAXINDEX = IMGLIST.find("li").length;
	currIndex = 0;
	currImgIndex = IMGINDEX.find("li:eq(" + currIndex + ")");
	currImgLi = IMGLIST.find("li:eq(" + currIndex + ")");
	currImgLi.show();
	interValTime = 3000;
	fadeInTime = 800;
	fadeOutTime = 1000;
	ImageAutoSwitch();
	ImageManualSwitch();
	ImageStopSwitch();
}
        //執行時間
var interValTime = 0;
        //下一張圖片顯示時間
var fadeInTime = 0;
        //上一張圖片的消失時間
var fadeOutTime = 0;
        //保存當前圖片定時的對象
var imageTimer = null;
        //當前的索引
var currIndex = null;
        //當前圖片的所以
var currImgIndex = null;
        //當前圖片
var currImgLi = null;
        //記錄需要切換的圖片集合
var IMGLIST = null;
        //記錄需要切換的圖片集合的索引。
var IMGINDEX = null;
        //最大圖片個數
var MAXINDEX = null;
        //自動定時切換。
function ImageAutoSwitch() {
	if (imageTimer != null) {
		clearInterval(imageTimer);
	}
	imageTimer = setInterval("IntervalImage()", interValTime);
}
        //手動切換圖片
function ImageManualSwitch() {
	IMGINDEX.find("li").each(function (i) {
		$(this).hover(function () {
			if (imageTimer != null) {
				clearInterval(imageTimer);
			}
			currIndex = i;
			ImageSwitchChange();
		}, function () {
			ImageAutoSwitch();
		});
	});
}
        //鼠標放到圖片上的換，停止切換
function ImageStopSwitch() {
	IMGLIST.find("li").each(function () {
		$(this).hover(function () {
			if (imageTimer != null) {
				clearInterval(imageTimer);
			}
		}, function () {
			ImageAutoSwitch();
		});
	});
}
        //自动切换图片
function IntervalImage() {
	currIndex = parseFloat(currIndex);
	currIndex = currIndex + 1;
            //如果切換到最大數量的時候則從頭開始
	if (currIndex >= MAXINDEX) {
		currIndex = 0;
	}
            //將原來的現實圖片索引的背景透明
	ImageSwitchChange();
}
        //切換圖片的時候，響應的圖片要實現漸變效果
function ImageSwitchChange() {
	if (currImgIndex != null) {
		currImgIndex.css({"background-color":"transparent"});
	}
	currImgIndex = IMGINDEX.find("li:eq(" + currIndex + ")");
	imgLi = IMGLIST.find("li:eq(" + currIndex + ")");
	currImgIndex.css({"background-color":"#999999"});
	if (currImgLi != null) {
		currImgLi.fadeOut(fadeOutTime, function () {
			imgLi.fadeIn(fadeInTime);
		});
	}
	currImgLi = imgLi;
}


function showOffice(id,type){
   go('proShow.shtml?id='+id+'&searchPro='+type);
}
function tosecondBd(id,type){
   go('secondBd/showBuliding.shtml?tpsId='+id+'&menuIndex='+type);
}
function showdcxtx(id,type){
   go('proShow.shtml?id='+id+'&searchPro='+type);
}
function showBulid(id,type){
   go('building/toBuidingInfo.shtml?id='+id);
}




/**
*minvalue:最小值
*maxvalue:最大值
*type:搜索类型：1<= 2>= 3between
*/
function searchByNaviga(text,proType){
	var minValue = '';
	var maxValue = '';
	var type = '';
	var aryStr = bulidValue(minValue,maxValue,text,type);
	var ary = aryStr.split("@");
	minValue = ary[0];
	maxValue = ary[1];
	type = ary[2];
	window.location.href='searchByPrice.shtml?minValue='+minValue+'&maxValue='+maxValue+'&type='+type+'&proType='+proType;
}

function bulidValue(minValue,maxValue,text,type){
	if(text.indexOf('5000元/㎡以下')!=-1){
		minValue = '5000';
		type = '1';
	}
	else if(text.indexOf('5000-8000元/㎡')!=-1){
		minValue = '5000';
		maxValue = '8000';
		type = '3';
	}
	else if(text.indexOf('8000-1万元/㎡')!=-1){
		minValue = '8000';
		maxValue = '10000';
		type = '3';
	}
	else if(text.indexOf('1万-1.2万元/㎡')!=-1){
		minValue = '10000';
		maxValue = '12000';
		type = '3';
	}
	else if(text.indexOf('1.2万-1.5万元/㎡')!=-1){
		minValue = '12000';
		maxValue = '15000';
		type = '3';
	}
	else if(text.indexOf('1.5万-2万元/㎡')!=-1){
		minValue = '15000';
		maxValue = '20000';
		type = '3';
	}
	else if(text.indexOf('2万元/㎡以上')!=-1){
		minValue = '20000';
		type = '2';
	}
	return minValue+'@'+maxValue+'@'+type;
}


function secBoard(n)
{
for(i=0;i<secTable.cells.length;i++)
secTable.cells[i].className="sec1";
secTable.cells[n].className="sec2";
for(i=0;i<mainTable.tBodies.length;i++)
mainTable.tBodies[i].style.display="none";
mainTable.tBodies[n].style.display="block";
}


function tuanshow(){
  $("#tuan").removeClass("active_out");
  $("#te").removeClass("active_over");
  $("#tuan").addClass("active_over");
  $("#te").addClass("active_out");
  $("#tuanmain").removeClass("hid")
   $("#temain").addClass("hid");
  
}
function teshow(){
  $("#tuan").removeClass("active_over");
  $("#te").removeClass("active_out");
  $("#tuan").addClass("active_out");
  $("#te").addClass("active_over");
  $("#tuanmain").addClass("hid")
   $("#temain").removeClass("hid");
}

function officeShow(){
   $("#shopDiv").addClass("hid")
   $("#officeDiv").removeClass("hid"); 
   $("#officeA").addClass("current")
   $("#shopA").removeClass("current"); 
}

function shopShow(){
   $("#officeDiv").addClass("hid")
   $("#shopDiv").removeClass("hid");
   $("#shopA").addClass("current")
   $("#officeA").removeClass("current");
}