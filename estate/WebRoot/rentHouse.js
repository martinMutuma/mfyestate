$(function(){
	var ai = $("#imgAdT .second_ad_img");
	if(null!=ai&&ai.length>0){
		bigImgCount=ai.length;
		initShow();
	}
	var queryObject = $("#unitPriceQuery,#fitQuery,#useTypeQuery") 
	$("#searchPanel").css({height:'150px;'})
	$("#showMoreQuery").click(function(){
		var textMore = '显示更多查询条件';
		var textLess = '隐藏查询条件';
		var value = this.innerHTML;
		if(value == textMore){
			queryObject.show();
			this.innerHTML=textLess;
		}else{
			queryObject.hide();
			this.innerHTML=textMore;
		}
	})
	
	if(document.getElementById("pagenation")){
		pagination({
			totalRecords: $("#totalRecords").val(),
			pageNo: $("#pageNo").val(),
			limit: $("#limit").val(),
			showPages: 8,
			id:'pagenation',
			uri:function(pageno,limit){
				keyWord($("#keyword").val(),$("#proIndex").val(),pageno)
			}
		})
	}
})
var checkEdImgId = 'adBulid_img_0_big';
var checkEdImg = 'adBulid_img_0';
var checkEdTitle = 'adBulid_img_0_title';
var checkEdContent = 'adBulid_img_0_content';
var checkEdItemIndex = 0;
var bigImgCount = 4;
function checkEdImgAd(jqObj){
	var idTemp = 'adBulid_img_';
	var id = jqObj.attr("id");
	var imgBigId = id+"_big";
	var titleId = id+"_title";
	var contentId = id+"_content";
	if(imgBigId!=checkEdImgId){
		jqObj.addClass("second_ad_over");
		$("#"+checkEdImgId).hide();
		$("#"+checkEdTitle).hide();
		$("#"+checkEdContent).hide();
		$("#"+imgBigId).show();
		$("#"+titleId).show();
		$("#"+contentId).show();
		$("#"+checkEdImg).removeClass("second_ad_over");
		checkEdItemIndex = id.split("_")[2];
		checkEdImgId = imgBigId;
		checkEdImg = id;
		checkEdTitle = titleId;
		checkEdContent = contentId;
		
	}
	
}
function initShow(){
	checkEdItemIndex++;
	if(checkEdItemIndex>(bigImgCount-1))
		checkEdItemIndex = 0;
	checkEdImgAd($("#adBulid_img_"+(checkEdItemIndex)));
	setTimeout("initShow()",2000);
}
function showSBuliding(id){
	go('secondBd/showBuliding.shtml?tpsId='+id+'&menuIndex=4')
}