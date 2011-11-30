//修改大型项目 新增的图片
String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
}
function checkNull(obj) {
	if (obj.value.trim().length == 0)
		return true;
	else
		return false;
}

function checkLength(obj, len) {
	if (obj.value.length > len)
		return true;
	else
		return false;
}
// 判断是否是正实数
function isUnsignedNumeric(obj) {
	var reg = /^\d+(\.\d+)?$/
	if (reg.test(obj.value)) {
		return true;
	} else {
		return false;
	}
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
function checkImage(obj) {
	if (/(.gif)|(.png)|(.jpg)|(.jpeg)|(.ico)$/.exec(obj.value))
		return true;
	else
		return false;
}
function isUnsignedInteger(obj) {
	var reg = /^\d+$/
	if (reg.test(obj.value)) {
		return true;
	} else {
		return false;
	}
}
function checkAddImg() {
	var imgName1 = document.getElementById("imgName1");
	var imgName2 = document.getElementById("imgName2");
	var imgName3 = document.getElementById("imgName3");
	var imgName4 = document.getElementById("imgName4");
    var imgName5 = document.getElementById("imgName5");
    if(checkNull(imgName1) && checkNull(imgName2)  && checkNull(imgName3) && checkNull(imgName4) && checkNull(imgName5))
    {
           alert("请至少上传一张图片");
			
			return false;
    }
	var img1 = document.getElementById("img1");
	if (!checkNull(imgName1)) {
		if (checkLength(imgName1, 40)) {
			alert("第一行图片名字长度应小于40");
			imgName1.focus();
			return false;
		}
		if (checkNull(img1)) {
			alert("请上传第一行图片");
			img1.focus();
			return false;
		}
		if (!checkImage(img1)) {
			alert('第一行图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
			img1.focus();
			return false;
		}
	}

	var img2 = document.getElementById("img2");
	if (!checkNull(imgName2)) {
		if (checkLength(imgName2, 40)) {
			alert("第二行图片名字长度应小于40");
			imgName2.focus();
			return false;
		}
		if (checkNull(img2)) {
			alert("请上传第二行图片");
			img2.focus();
			return false;
		}
		if (!checkImage(img2)) {
			alert('第二行图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
			img2.focus();
			return false;
		}
	}

	var img3 = document.getElementById("img3");
	if (!checkNull(imgName3)) {
		if (checkLength(imgName3, 40)) {
			alert("第三行图片名字长度应小于40");
			imgName3.focus();
			return false;
		}
		if (checkNull(img3)) {
			alert("请上传第三行图片");
			img3.focus();
			return false;
		}
		if (!checkImage(img3)) {
			alert('第三行图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
			img3.focus();
			return false;
		}
	}
	
	var img4 = document.getElementById("img4");
	if (!checkNull(imgName4)) {
		if (checkLength(imgName4, 40)) {
			alert("第四行图片名字长度应小于40");
			imgName4.focus();
			return false;
		}
		if (checkNull(img4)) {
			alert("请上传第四行图片");
			img4.focus();
			return false;
		}
		if (!checkImage(img4)) {
			alert('第四行图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
			img4.focus();
			return false;
		}
	}

	var img5 = document.getElementById("img5");
	if (!checkNull(imgName5)) {
		if (checkLength(imgName5, 40)) {
			alert("第五行图片名字长度应小于40");
			imgName5.focus();
			return false;
		}
		if (checkNull(img5)) {
			alert("请上传第五行图片");
			img5.focus();
			return false;
		}
		if (!checkImage(img5)) {
			alert('第五行图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
			img5.focus();
			return false;
		}
	}
	if (confirm("确认增加图片吗?"))
		return true;
	return false;
}
