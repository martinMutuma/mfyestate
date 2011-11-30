/**
 * 验证写字楼需求信息
 */
String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
}
// 为true不等于空
function checkNull(obj) {
	if (obj.value.trim().length == 0)
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

function checkneed() {
    var address=document.getElementById("address");
    if(checkNull(address)  && checkLength(address,50)){
       alert('地址长度应小于50');
       return  false;
    }
    var nearAddress=document.getElementById("nearAddress");
    if(checkNull(nearAddress)  && checkLength(nearAddress,50)){
       alert('附近长度应小于50');
       return  false;
    }
	var minArea = document.getElementById("minArea");
	var maxArea = document.getElementById("maxArea");
	if(!checkNull(minArea) || !checkNull(maxArea) ){
	    alert('请填写建筑面积');
	    return false;
	}
	if (checkNull(maxArea) && (!checkNull(minArea))) {
	    minArea.value=0;
	}
	if (checkNull(minArea) && checkNull(maxArea)) {
		if (minArea.value >= maxArea.value) {
			alert("建筑面积格式不正确");
			maxArea.focus();
			return false;
		}
	}
	var minPrice = document.getElementById("minPrice");
	var maxPrice = document.getElementById("maxPrice");
	if(!checkNull( minPrice) || !checkNull(maxPrice) ){
	    alert('请填写年租金');
	    return false;
	}
	if ((!checkNull(minPrice)) && (checkNull(maxPrice))) {
             minPrice.value=0;

	}
	if (checkNull(minPrice) && checkNull(maxPrice)) {
		if (minPrice.value >= maxPrice.value) {
			alert("年租金的格式不正确");
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
	if (confirm("确认发布写字楼需求信息吗?"))
		return true;
	return false;
}
