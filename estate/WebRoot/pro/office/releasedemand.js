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
function  checkDecimalsLen(obj,len){
     var dectext = obj.value.substring(obj.value.indexOf('.')+1, obj.value.length);   
        if(dectext.length > len){   
           
            return false;   
        }else{   
            return true;   
        }  
}
 function checkDecimals(obj){   
        if(obj.value.indexOf('.') == -1)
        return false;
        else  return true;
       
 }    

function checkneed() {
    var  district=$("#showdistrict");
	 if(district.combotree('getValue').trim().length==0){
         alert("请选择所在区域");
         district.focus();
         return false;
      }
    var address=document.getElementById("address");
    if(!checkNull(address)){
       alert('请填写地址');
       address.focus();
       return  false;
    }
    var nearAddress=document.getElementById("nearAddress");
    if(checkNull(nearAddress)  && checkLength(nearAddress,50)){
       alert('附近长度应小于50');
       return  false;
    }
	var minArea = document.getElementById("minArea");
	var maxArea = document.getElementById("maxArea");
	if (checkNull(maxArea) && (!checkNull(minArea))) {
		alert("请先填写建筑面积最小值");
		minArea.focus();
		return false;
	}
	if(!checkNull(minArea)){
	    alert("请填写建筑面积最小值");
		minArea.focus();
		return false;
	}
	if(!checkNull(maxArea)){
	    alert("请填写建筑面积最大值");
		maxArea.focus();
		return false;
	}
	if (checkNull(minArea) && checkNull(maxArea)) {
		if(checkDecimals(minArea)){
	     if(!checkDecimalsLen(minArea,2)){
	         alert("建筑面积最小值小数点后面只能是两位");
	         minArea.focus();
	         return  false;
	     }
	}
		if(checkDecimals(maxArea)){
	     if(!checkDecimalsLen(maxArea,2)){
	         alert("建筑面积最大值小数点后面只能是两位");
	         maxArea.focus();
	         return  false;
	     }
	}

		if (parseInt(minArea.value,10) >= parseInt(maxArea.value,10)){
			alert("建筑面积最小值应小于最大值");
			minArea.focus();
			return false;
		}
	}
	var minPrice = document.getElementById("minPrice");
	var maxPrice = document.getElementById("maxPrice");
	if ((!checkNull(minPrice)) && (checkNull(maxPrice))) {

		alert("请填写年租金最小值");
		minPrice.focus();
		return false;

	}
	if(!checkNull(minPrice)){
	    alert("请填写年租金最小值");
		minPrice.focus();
		return false;
	}
	if(!checkNull(maxPrice)){
	    alert("请填写年租金最大值");
		maxPrice.focus();
		return false;
	}
	if (checkNull(minPrice) && checkNull(maxPrice)) {
		if(checkDecimals(minPrice)){
	     if(!checkDecimalsLen(minPrice,2)){
	         alert("年租金最小值小数点后面只能是两位");
	        minPrice.focus();
	         return  false;
	     }
	}
		if(checkDecimals( maxPrice)){
	     if(!checkDecimalsLen( maxPrice,2)){
	         alert("年租金最大值小数点后面只能是两位");
	         maxPrice.focus();
	         return  false;
	     }
	}
		if (parseInt(minPrice.value,10) >= parseInt(maxPrice.value,10)) {
			alert("年租金最小值应该小于最大值");
			 minPrice.focus();
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
