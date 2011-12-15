$(function() {
	var sc = $(".search_column");
	for (var i = 0; i < sc.length; i++) {
		$(sc[i]).html("<label><input type='checkbox' onclick='srClick(this)'>"
				+ sc[i].innerHTML + "</label>")
	}
	sc.hover(function() {
		$(this).css({
			border : '1px solid #ECECEC'
		})
	}, function() {
		$(this).css({
			border : '1px solid #FFFFFF'
		})
	});
	$(".search_column_selected").find("input").attr("checked", true);
	$("#bulidSearch").click(function() {
		searchKeyWord('9');
	})
})

function srClick(obj) {
	if (obj.checked == false)
		obj.checked = true;
	var sc = $(obj).parent().parent();
	var scsArea = sc.parent();
	var firstSc = scsArea.children();
	if (firstSc[0].id == sc.attr("id")) {
		$(firstSc[0]).addClass("search_column_selected");
		for (var i = 1; i < firstSc.length; i++) {
			$(firstSc[i]).removeClass("search_column_selected").find("input")
					.attr("checked", false);
		}
	} else {
		$(firstSc[0]).removeClass("search_column_selected").find("input").attr(
				"checked", false);
		if (obj.checked)
			sc.addClass("search_column_selected");
		else
			sc.removeClass("search_column_selected");
	}

}

function search(type, minValue, maxValue, code, obj, position, pro) {
	if ($(obj).attr("class").indexOf("search_column_selected") != -1)
		return;
	if (code == "ZmVhdHVyZXMjMQ==") {
		if (position.split("_")[1] == "0") {
			$("#lptsValue").val("");
		}else{
			var lptsV = $("#lptsValue").val();
			if(("@"+lptsV+"@").indexOf(minValue)==-1){
				if(lptsV != "")
					lptsV += "@";
				lptsV += minValue;
				$("#lptsValue").val(lptsV);
			}
		}
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
	// alert($("#searchStatus").val());
	// alert($("#searchQuery").val());
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
	var nolimit = sv.split("_")[1];
	if (nolimit == "0") {
		var searchStatus = $("#searchStatus").val();
		var searchQuery = $("#searchQuery").val();
		var staAry = searchStatus.split("@");
		var queryAry = searchQuery.split("@");
		for (var i = 0; i < staAry.length; i++) {
			if (tv != "") {
				tv += "@";
				tqv += "@";
			}
			var vv = staAry[i];
			if (vv.split("_")[0] == row) {
				continue;
			} else {
				tv += vv;
				tqv += queryAry[i];
			}
		}
		$("#searchStatus").val(tv);
		$("#searchQuery").val(tqv);
	} else {
		var searchStatus = $("#searchStatus").val();
		var searchQuery = $("#searchQuery").val();
		if (("@" + searchStatus + "@").indexOf("@" + sv + "@") == -1) {
			$("#searchStatus").val(searchStatus + "@" + sv);
			$("#searchQuery").val(searchQuery + "@" + qv);
		}
	}
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