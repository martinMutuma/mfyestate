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
})

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
	$("#searchStatus").val($("#searchStatus").val() + "@" + position);
	$("#searchQuery").val($("#searchQuery").val() + "@"
			+ (code + '~' + type + '~' + minValue + '~' + maxValue));
	alert($("#searchStatus").val())
	alert($("#searchStatus").val())
	window.searchForm.action = 'search.shtml';
	window.searchForm.method = "post";
	// window.searchForm.submit();
	return;
}
