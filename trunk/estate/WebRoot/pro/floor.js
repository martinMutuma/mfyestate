/**
 * 增加楼盘信息
 */
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
function  checkLength(mess,id,lenth){
  var  obj=document.getElementById(id);
  if(obj.value==""){
     alert('请填写'+mess);
     return;
  }
  if(obj.value.length>lenth){
      alert(mess+"长度应小于"+lenth);
  }
  
}
function checkFloor() {
	var name = document.getElementById("name");
	if (checkNull(name)) {
		alert('请填写楼盘名称');
		name.focus();
		return false;
	}
	if (name.value.length>25) {
		alert("楼盘名字长度应小于25");
		name.focus();
		return false;
	}
	
	var pinyin = document.getElementById("pinyin");
	if (checkNull(pinyin)) {
		alert('请填写楼盘的拼音');
		pinyin.focus();
		return false;
	}
	if (pinyin.value.length>25) {
		alert("楼盘的拼音长度应小于25");
		pinyin.focus();
		return false;
	}
	var address = document.getElementById("address");
	if (checkNull(address)) {
		alert('请填写楼盘的地址');
		address.focus();
		return false;
	}
	if (address.value.length>100) {
		alert("楼盘地址长度应小于100");
		address.focus();
		return false;
	}
	var  discode=$("#discode");
	 if(discode.combotree('getValue').trim().length==0){
         alert("请选择所在区域");
         discode.focus();
         return false;
      }
    var  propertyCompany=document.getElementById("propertyCompany");
    if(propertyCompany.value!=""){
        if(propertyCompany.value.length>25){
               alert("物业公司长度大于25");
               propertyCompany.focus();
               return  false;
        }
       }
     var  propertyDevelopers=document.getElementById("propertyDevelopers");
    if(propertyDevelopers.value!=""){
        if(propertyDevelopers.value.length>25){
               alert("物业开发商长度大于25");
               propertyDevelopers.focus();
               return  false;
        }
       }
	var packingRent = document.getElementById("packingRent");
	if (!checkNull(packingRent)) {
		if (!isUnsignedNumeric(packingRent)) {
			alert('楼盘车位租金应为正实数');
			packingRent.focus();
			return false;
		}
		 if(packingRent.value.length>8){
		    alert("楼盘车位租金输入不合法，长度应小于8");
		    packingRent.focus();
		    return false;
		}
		if(checkDecimals(packingRent)){
	     if(!checkDecimalsLen(packingRent,2)){
	         alert("楼盘车位租金小数点后面只能是两位");
	         packingRent.focus();
	         return  false;
	     }
	}}
    var packingCount = document.getElementById("packingCount");
	if (!checkNull(packingCount)) {
		if (!isUnsignedNumeric(packingCount)) {
			alert('楼盘车位数量应为正实数');
			packingCount.focus();
			return false;
		}
		 if(packingCount.value.length>8){
		    alert("楼盘车位数量输入不合法，长度应小于8");
		    packingCount.focus();
		    return false;
		}
		if(checkDecimals(packingCount)){
	     if(!checkDecimalsLen(packingCount,2)){
	         alert("楼盘车位数量小数点后面只能是两位");
	         packingCount.focus();
	         return  false;
	     }
	}}
	var propertyFees = document.getElementById("propertyFees");
	if (checkNull(propertyFees)) {
		alert('请填写楼盘物业管理费');
		propertyFees.focus();
		return false;
	}
	if(propertyFees.value.length>8){
		    alert("楼盘物业管理费输入不合法，长度应小于8");
		    propertyFees.focus();
		    return false;
		}
		if(checkDecimals(propertyFees)){
	     if(!checkDecimalsLen(propertyFees,2)){
	         alert("楼盘物业管理费小数点后面只能是两位");
	         propertyFees.focus();
	         return  false;
	     }
	     
	     var totalArea = document.getElementById("totalArea");
	if (!checkNull(totalArea)) {
		if (!isUnsignedNumeric(totalArea)) {
			alert('总面积应为正实数');
			totalArea.focus();
			return false;
		}
		 if(totalArea.value.length>18){
		    alert("总面积输入不合法，长度应小于18");
		    totalArea.focus();
		    return false;
		}
		if(checkDecimals(totalArea)){
	     if(!checkDecimalsLen(totalArea,2)){
	         alert("总面积小数点后面只能是两位");
	         totalArea.focus();
	         return  false;
	     }
	}}
	     var standardArea = document.getElementById("standardArea");
	if (!checkNull(standardArea)) {
		if (!isUnsignedNumeric(standardArea)) {
			alert('标准层面积应为正实数');
			standardArea.focus();
			return false;
		}
		 if(standardArea.value.length>18){
		    alert("标准层面积输入不合法，长度应小于18");
		   standardArea.focus();
		    return false;
		}
		if(checkDecimals(standardArea)){
	     if(!checkDecimalsLen(standardArea,2)){
	         alert("标准层面积小数点后面只能是两位");
	         standardArea.focus();
	         return  false;
	     }
	}}
	var  traffic=document.getElementById("traffic");
	if(traffic.value!=""  && traffic.value.length >50){
	         alert("交通状况长度应小于50");
	         traffic.focus();
	         return  false;
	}
	if (!KE.util.isEmpty('content')){ 
	    var content= document.getElementById("content").value;
	      content=KE.util.getData('content');
	    if(content.length>500){
	       alert('物业描述长度应小于500');
	       return false;
	    }
	}
	var imgName1 = document.getElementById("imgName1");
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
	var imgName2 = document.getElementById("imgName2");
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
	var imgName3 = document.getElementById("imgName3");
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
	var imgName4 = document.getElementById("imgName4");
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
	var imgName5 = document.getElementById("imgName5");
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
	   
	if (confirm("确认增加物业信息吗?"))
		return true;
	return false;
}
}
