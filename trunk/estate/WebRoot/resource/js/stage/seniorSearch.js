$(function() {
	$(".search_column").hover(function() {
		$(this).css({
			border : '1px solid #ECECEC'
		})
	}, function() {
		$(this).css({
			border : '1px solid #FFFFFF'
		})
	})
	
	$("#bulidSearch").click(function(){
		searchKeyWord('9');
	})
	
	checkedPro = $("#searchTable_9");
})

/**
 * type:搜索类型 7:between 特殊处理 minValue:最小值 maxValue:最大值 code:列名 obj:点击的源
 * position:位置 pro:项目序号
 */
function search(type, minValue, maxValue, code, obj, position, pro) {
	if ($(obj).attr("class").indexOf("search_column_selected") != -1)
		return;
	$(obj).addClass("search_column_selected");
	$(obj).parent().children().filter(function() {
		return this != obj
	}).removeClass("search_column_selected");
	if(code == "ZmVhdHVyZXMjMQ=="){
		$("#lptsValue").val(minValue);
		return;
	}
	if ($("#searchPro").val() != "" && pro != $("#searchPro").val()) {
		$("#searchStatus").val("");
		$("#searchQuery").val("");
	}
	$("#searchPro").val(pro);
	if ($("#searchStatus").val() != "") {
		filteQuery(position,
				(code + '~' + type + '~' + minValue + '~' + maxValue));
	} else {
		$("#searchStatus").val(position);
		$("#searchQuery")
				.val((code + '~' + type + '~' + minValue + '~' + maxValue));
	}
	// $("#searchStatus").val($("#searchStatus").val() + "@" + position);
	// $("#searchQuery").val($("#searchQuery").val() + "@"
	// + (code + '~' + type + '~' + minValue + '~' + maxValue));
	window.searchForm.action = 'search.shtml';
	window.searchForm.method = "post";
	// window.searchForm.submit();
	return;
}

// 组装复杂查询
function filteQuery(sv, qv) {
	var tv = "";
	var tqv = "";
	var row = sv.split("_")[0];
	var searchStatus = $("#searchStatus").val();
	var searchQuery = $("#searchQuery").val();
	var staAry = searchStatus.split("@");
	var queryAry = searchQuery.split("@");
	var filterFlag = false;
	for (var i = 0; i < staAry.length; i++) {
		if (tv != "") {
			tv += "@";
			tqv += "@";
		}
		var vv = staAry[i];
		if (vv.split("_")[0] == row) {
			filterFlag = true;
			tv += sv;
			tqv += qv;
		} else {
			tv += vv;
			tqv += queryAry[i];
		}
	}
	if (!filterFlag) {
		if (tv != "") {
			tv += "@";
			tqv += "@";
		}
		tv += sv;
		tqv += qv;
	}
	$("#searchStatus").val(tv);
	$("#searchQuery").val(tqv);
}

function searchKeyWord(id) {
	if ($("#searchPro").val() != "" && id != $("#searchPro").val()) {
		$("#searchStatus").val("");
		$("#searchQuery").val("");
	}
	$("#searchPro").val(id);
	window.searchForm.action = 'search.shtml';
	$("#keywordValue").val($("#keyword_" + id).val());
	if (id != "9") {
		if ($("#zj_" + id).attr("checked") && $("#fzj_" + id).attr("checked"))
			$("#selectedTab").val("0");
		else if ($("#zj_" + id).attr("checked"))
			$("#selectedTab").val("1");
		else
			$("#selectedTab").val("2");
	}
	window.searchForm.method = "post";
	window.searchForm.submit();
	return;
}
var checkedPro;
function choosePro(index,obj){
	$(".checked_title").removeClass("checked_title");
	$(obj).addClass("checked_title");
	checkedPro.hide();
	checkedPro =  $("#searchTable_"+index);
	checkedPro.show();
}
