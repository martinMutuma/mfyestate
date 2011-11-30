/**
 * 验证写字楼修改需求信息
 */
String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
}
// 为true不等于空
function checkNull(obj) {
	if (obj.value.trim().length == 0 || obj.value == 0.0)
		return false;
	else
		return true;
}

function checkLength(obj, len) {
	if (obj.value.length > len)
		return true;
	else
		return false;
}

// 判断是否是非正浮动数
function isFloat(obj) {
	var reg = /^((-\d+(\.\d+)?)|(0+(\.0+)?))$/
	if (reg.test(obj.value)) {
		return true;
	} else {
		return false;
	}
}
// 判断是正实数 不是则用空字符串代替
function isNum(obj) {
	if (isNaN(obj.value)) {
		obj.value = "";
	}
	if (isFloat(obj)) {
		obj.value = "";
	}

}

function checkmodify() {

	var minArea = document.getElementById("minArea");
	var maxArea = document.getElementById("maxArea");
	if (minArea.value== 0.0)
		minArea.value = ""
	if (maxArea.value == 0.0)
		maxArea.value = ""
	if (checkNull(maxArea) && (!checkNull(minArea))) {

		alert("请先填写建筑面积前面框");
		minArea.focus();
		return false;

	}
	if (checkNull(minArea) && checkNull(maxArea)) {
		if (minArea.value >= maxArea.value) {
			alert("建筑面积后面框的值 应大于前面框的值");
			maxArea.focus();
			return false;
		}
	}
	var minPrice = document.getElementById("minPrice");
	var maxPrice = document.getElementById("maxPrice");
	if (minPrice.value == 0.0)
		minPrice.value = "";
	if (maxPrice.value == 0.0)
		maxPrice.value = "";
	if ((!checkNull(minPrice)) && (checkNull(maxPrice))) {

		alert("请先填写年租金前面框");
		minPrice.focus();
		return false;

	}
	if (checkNull(minPrice) && checkNull(maxPrice)) {
		if (minPrice.value >= maxPrice.value) {
			alert("年租金后面框的值 应大于前面框的值");
			maxPrice.focus();
			return false;
		}

	}
	var title = document.getElementById("title");
	if (!checkNull(title)) {
		alert("请填写需求标题");
		title.focus();
		return false;
	}
	if (checkLength(title, 50)) {
		alert("需求标题长度应小于40");
		title.focus();
		return false;
	}
    if (!KE.util.isEmpty('content')) document.getElementById("content").value=KE.util.getData('content');
	if (confirm("确认修改写字楼需求信息吗?"))
		return true;
	return false;
}