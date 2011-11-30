// 修改工业地产需求验证信息
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
     var  district=$("#district");
	 if(district.combotree('getValue').trim().length==0){
         alert("请选择所在省区市");
        district.focus();
         return false;
      }
      	var minArea = document.getElementById("minArea");
	var maxArea = document.getElementById("maxArea");
	if((!checkNull(maxArea)) && (!checkNull(minArea))){
	    alert('请填写建筑面积');
	    minArea.focus();
	    return  false;
	}
		if (checkNull(maxArea) && (!checkNull(minArea))) {
		alert("请先填写建筑面积最小值");
		minArea.focus();
		return false;
	}
	if (!checkNull(maxArea) && (checkNull(minArea))) {
		alert("请填写建筑面积最大值");
		maxArea.focus();
		return false;
	}
	if (checkNull(minArea) && checkNull(maxArea)) {
	   
	 if(minArea.value.length>8){
		    alert("建筑面积最小值输入不合法，长度应小于8");
		    minArea.focus();
		    return false;
		}
		if(checkDecimals(minArea)){
	     if(!checkDecimalsLen(minArea,2)){
	         alert("建筑面积最小值小数点后面只能是两位");
	         minArea.focus();
	         return  false;
	     }
	}
	  if(maxArea.value.length>8){
		    alert("建筑面积最大值输入不合法，长度应小于8");
		    maxArea.focus();
		    return false;
		}
		if(checkDecimals(maxArea)){
	     if(!checkDecimalsLen(maxArea,2)){
	         alert("建筑面积最大值小数点后面只能是两位");
	         maxArea.focus();
	         return  false;
	     }
	}

		if (minArea.value >= maxArea.value){
			alert("建筑面积最小值应小于最大值");
			minArea.focus();
			return false;
		}
	}
	var minPrice = document.getElementById("minPrice");
	var maxPrice = document.getElementById("maxPrice");
	if ((!checkNull(minPrice)) && (!checkNull(maxPrice))) {
	      alert('请填写年租金');
	      minPrice.focus();
	      return false;
	}
	if ((!checkNull(minPrice)) && (checkNull(maxPrice))) {

		alert("请填写年租金最小值");
		minPrice.focus();
		return false;

	}
	if (!checkNull(maxPrice) && (checkNull(minPrice))) {
		alert("请填写年租金最大值");
		maxPrice.focus();
		return false;
	}
	if (checkNull(minPrice) && checkNull(maxPrice)) {
	     if(minPrice.value.length>8){
		    alert("年租金最小值输入不合法，长度应小于8");
		    minPrice.focus();
		    return false;
		}
		if(checkDecimals(minPrice)){
	     if(!checkDecimalsLen(minPrice,2)){
	         alert("年租金最小值小数点后面只能是两位");
	        minPrice.focus();
	         return  false;
	     }
	}
	  if(maxPrice.value.length>8){
		    alert("年租金最大值输入不合法，长度应小于8");
		    maxPrice.focus();
		    return false;
		}
		if(checkDecimals( maxPrice)){
	     if(!checkDecimalsLen( maxPrice,2)){
	         alert("年租金最大值小数点后面只能是两位");
	         maxPrice.focus();
	         return  false;
	     }
	}
		if (minPrice.value >= maxPrice.value) {
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
		alert("需求标题长度应小于50");
		title.focus();
		return false;
	}
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

	if (!KE.util.isEmpty('content')) document.getElementById("content").value=KE.util.getData('content');
	if (confirm("确认修改工业地产需求信息吗?"))
		return true;
	return false;
}
