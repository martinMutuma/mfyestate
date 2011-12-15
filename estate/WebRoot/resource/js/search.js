$(function() {
	searchObj = $("#pro_0");
	searchDiv = $("#searchDiv_0");
	// 初始化项目及其搜索样式
	var proId = $("#searchPro").val();
	if (proId != "") {
		var proObj = $("#pro_" + proId);
		if (null != searchObj)
			searchObj.removeClass("checked_pro");
		proObj.addClass("checked_pro");
		searchObj = proObj;
		var queryObj = $("#searchDiv_" + proId);
		if (null == searchDiv)
			$("#searchDiv_0").hide();
		else
			searchDiv.hide();
		queryObj.show();
		searchDiv = queryObj;
		var searchStatus = $("#searchStatus").val();
		var stausAry = searchStatus.split("@");
		for (var i = 0; i < stausAry.length; i++) {
			var ary = stausAry[i].split("_");
			var rowIndex = ary[0];
			var columnIndex = ary[1];
			if (columnIndex != "0")
				$("#rc_" + proId + "_" + rowIndex + "_0")
						.removeClass("search_column_selected");
			$("#rc_" + proId + "_" + rowIndex + "_" + columnIndex)
					.addClass("search_column_selected");
			// 初始化选择项
		}
		var selectedTab = $("#selectedTab").val();
		if ("1" == selectedTab)
			$("#fzj_" + proId).attr("checked", false);
		else if ("2" == selectedTab)
			$("#zj_" + proId).attr("checked", false);
	} else {
		searchObj.addClass("checked_pro");
	}
	// 复杂搜索自动定位
	$("#searchPanel .search_pro_bg").click(function() {
		if (null != searchObj)
			searchObj.removeClass("checked_pro");
		if (null == searchDiv)
			$("#searchDiv_0").hide();
		else
			searchDiv.hide();
		var thisId = $(this).attr("id");
		var proId = thisId.split("_")[1];
		var id = "searchDiv_" + proId;
		$("#" + id).show();
		searchDiv = $("#" + id);
		$(this).addClass("checked_pro");
		searchObj = $(this);
			// $("#searchPro").val(proId);
		});

	if (document.getElementById("bulidListDiv") != null) {
		$("#bulidListDiv table").not($("#bulidListDiv table table")).hover(
				function() {
					$(this).addClass("table_over");
				}, function() {
					$(this).removeClass("table_over");
				})
	}

	// 楼盘特色
	if (document.getElementById("lptsValue") != null) {
		var lpts = $("#lptsValue").val();
		if (lpts == "") {
			$("#lpts_0").css({
				color : '#FFA028'
			});
		} else {
			if (lpts.indexOf("@") == -1) {
				lpts = parseInt(lpts);
				$("#lpts_" + (lpts + 1)).css({
					color : '#FFA028'
				});
			} else {
				var lpAry = lpts.split("@");
				for (var i = 0; i < lpAry.length; i++) {
					var lptsV = parseInt(lpAry[i]);
					$("#lpts_" + (lptsV + 1)).css({
						color : '#FFA028'
					});
				}
			}
		}
	}
})

var searchObj;
var searchDiv;

/**
 * type:搜索类型 7:between 特殊处理 minValue:最小值 maxValue:最大值 code:列名 obj:点击的源
 * position:位置 pro:项目序号
 */
function search(type, minValue, maxValue, code, obj, position, pro) {
	if ($(obj).attr("class").indexOf("search_column_selected") != -1)
		return;
	$(obj).addClass("search_column_selected");
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
	window.searchForm.action = 'search.shtml';
	window.searchForm.method = "post";
	window.searchForm.submit();
	return;
}
/*
 * function proSearch(pro){
 * if($("#searchPro").val()!=""&&pro!=$("#searchPro").val()){
 * $("#searchStatus").val(""); $("#searchQuery").val(""); }
 * $("#searchPro").val(pro); $("#keywordValue").val($("#keyword_"+pro).val());
 * $("#zjValue").val($("#zj_"+pro).attr("checked")==true?"":"1");
 * $("#fzjwordValue").val($("#fzj_"+pro).attr("checked")==true?"":"1");
 * window.searchForm.action = 'search.shtml'; window.searchForm.method="post";
 * window.searchForm.submit(); return; }
 */
function searchKeyWord(id) {
	if ($("#searchPro").val() != "" && id != $("#searchPro").val()) {
		$("#searchStatus").val("");
		$("#searchQuery").val("");
	}
	$("#searchPro").val(id);
	window.searchForm.action = 'search.shtml';
	$("#keywordValue").val($("#keyword_" + id).val());
	if ($("#zj_" + id).attr("checked") && $("#fzj_" + id).attr("checked"))
		$("#selectedTab").val("0");
	else if ($("#zj_" + id).attr("checked"))
		$("#selectedTab").val("1");
	else
		$("#selectedTab").val("2");
	window.searchForm.method = "post";
	window.searchForm.submit();
	return;
}

function search1(pageno) {
	window.searchForm.action = 'search.shtml?pageNo=' + pageno;
	window.searchForm.method = "post";
	window.searchForm.submit();
	return;
}

function bulid(pageno) {
	window.searchForm.action = 'bulid.shtml?pageNo=' + pageno;
	window.searchForm.method = "post";
	window.searchForm.submit();
	return;
}

function keyWord(keyword, item, pageno) {
	go(project_root_path + 'keyWordSearch.shtml?keyword=' + keyword
			+ '&proIndex=' + item + '&pageNo=' + pageno);
}

function searchZj(type) {
	$("#selectedTab").val(type);
	window.searchForm.method = "post";
	window.searchForm.submit();
	return;
}

function search_home(type, proId) {
	$("#searchStatus").val("0_" + type);
	$("#searchQuery").val('flag#1_5_' + type + '_');
	$("#searchPro").val(proId);
	// window.searchForm.target="_blank";
	window.searchForm.method = "post";
	window.searchForm.submit();
	return;
}

function myTab(titStr, boxStr, num, onnum, Csn, onCsn) {
	for (i = 1; i <= num; i++) {
		document.getElementById((boxStr + i)).style.display = "none";
		document.getElementById((titStr + i)).className = Csn;
	}

	document.getElementById((boxStr + onnum)).style.display = "block";
	document.getElementById((titStr + onnum)).className = onCsn;

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

function lptsSearch(lptsType) {
	$("#lptsValue").val(lptsType);
	$("#searchPro").val("9");
	window.searchForm.action = 'search.shtml';
	window.searchForm.method = "post";
	window.searchForm.submit();
}

// 搜索匹配符
function formatSearchType(type) {
	var data = {
		'1' : '<',
		'2' : '>',
		'3' : '<=',
		'4' : '>=',
		'5' : '=',
		'6' : '!=',
		'7' : 'between',
		'8' : 'like'
	};
	return data[type];
}

// 通过价格查询
function searchByPrice(minValue, maxValue, type, proType, pageno) {
	window.location.href = 'searchByPrice.shtml?minValue=' + minValue
			+ '&maxValue=' + maxValue + '&type=' + type + '&proType=' + proType
			+ '&pageNo=' + pageno;
}
