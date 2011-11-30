// JavaScript Document
	$(function() {   
		$("#KinSlideshow").KinSlideshow();
		// 第一次加载页面后，隐藏“第一名的小区域”，隐藏“除第一名以外其他名的大区域”   
		$(".ph").each(function() {   
			var thisObj = $(this);   
			thisObj.find(".ph0").eq(0).hide();   
			thisObj.find(".ph1:gt(0)").hide();   
		});   

		// 鼠标移到小区域上   
		// 该范围内的所有小区域显示，然后显示当前小区域   
		// 该范围内所有的大区域隐藏，然后显示与该小区域对应的大区域   
		$(".ph0").mouseover(function() {   
			var thisObj = $(this);   
			thisObj.parent(".ph").find(".ph0").show();   
			thisObj.hide();   
			thisObj.parent(".ph").find(".ph1").hide();   
			thisObj.next(".ph1").show();   
		});   
	}); 
