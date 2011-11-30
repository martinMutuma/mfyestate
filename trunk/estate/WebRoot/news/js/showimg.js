$(function(){
 	var br=navigator.userAgent.toLowerCase();
	var browserVer=(br.match(/.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/) || [0, '0'])[1];
	$("#cnBody li").hover(function(){
		$(this).removeClass("li_out");
		$(this).addClass("li_over");
		var top = $(this).position().top;
		if(isChrome!=-1&&browserVer>534.16){
			top = top-34;
		}
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
	InitSwitchObj();
});


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