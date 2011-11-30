// 发布工业地产出租脚本

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
function checksale() {
    var  district=$("#district");
	 if(district.combotree('getValue').trim().length==0){
         alert("请选择所在省区县");
        district.focus();
         return false;
      }
	var address = document.getElementById("address");
	
	if (checkNull(address)) {
		alert('请填写地址');
		address.focus();
		return false;
	}
	if (checkLength(address, 50)) {
		alert("地址长度应小于50");
		address.focus();
		return false;
	}
	var constructionArea = document.getElementById("constructionArea");
	if (checkNull(constructionArea)) {
		alert('请填写建筑面积');
		constructionArea.focus();
		return false;
	}
	if (checkLength(constructionArea, 9)) {
		alert("建筑面积长度应小于8");
		constructionArea.focus();
		return false;
	}
	if(checkDecimals(constructionArea)){
	     if(!checkDecimalsLen(constructionArea,2)){
	         alert("建筑面积小数点后面只能是两位");
	         constructionArea.focus();
	         return  false;
	     }
	  
	}
	var bursary = document.getElementById("bursary");
	if (checkNull(bursary)) {
		alert('请填写售价');
		bursary.focus();
		return false;
	}
	if (checkLength(bursary, 8)) {
		alert("售价长度应小于7");
		bursary.focus();
		return false;
	}
	if(checkDecimals(bursary)){
	     if(!checkDecimalsLen(bursary,2)){
	         alert("售价小数点后面只能是两位");
	         bursary.focus();
	         return  false;
	     }
	  
	}
	var title = document.getElementById("title");
	if (checkNull(title)) {
		alert('请填写案源标题');
		title.focus();
		return false;
	}
	if (checkLength(title, 50)) {
		alert("案源标题长度应小于50");
		title.focus();
		return false;
	}
	var area=document.getElementById("area");
	if(area.value!=""){
          if (checkLength(area, 9)) {
		alert("占地面积长度应小于8");
		area.focus();
		return false;
	}
	if(checkDecimals(area)){
	     if(!checkDecimalsLen(area,2)){
	         alert("占地面积小数点后面只能是两位");
	         area.focus();
	         return  false;
	     }
	  
	}      
	}
	var spaceArea=document.getElementById("spaceArea");
	if(spaceArea.value!=""){
          if (checkLength(spaceArea, 9)) {
		alert("空地面积长度应小于8");
		spaceArea.focus();
		return false;
	}
	if(checkDecimals(spaceArea)){
	     if(!checkDecimalsLen(spaceArea,2)){
	         alert("空地面积小数点后面只能是两位");
	         spaceArea.focus();
	         return  false;
	     }
	  
	}      
	}
		var far=document.getElementById("far");
	if(far.value!=""){
          if (checkLength(far, 7)) {
		alert("容积率长度应小于7");
		far.focus();
		return false;
	}
	if(checkDecimals(far)){
	     if(!checkDecimalsLen(far,2)){
	         alert("容积率小数点后面只能是两位");
	         far.focus();
	         return  false;
	     }
	  
	}      
	}
	var greenRate=document.getElementById("greenRate");
	if(greenRate.value!=""){
          if (checkLength(greenRate, 7)) {
		alert("绿化率长度应小于7");
		greenRate.focus();
		return false;
	}
	if(checkDecimals(greenRate)){
	     if(!checkDecimalsLen(greenRate,2)){
	         alert("绿化率小数点后面只能是两位");
	         greenRate.focus();
	         return  false;
	     }
	  
	}      
	}
	var floorHeight=document.getElementById("floorHeight");
	if(floorHeight.value!=""){
	      if (checkLength(floorHeight, 10)) {
		alert("层高长度应小于10");
		floorHeight.focus();
		return false;
	}
	}
	var car=document.getElementById("car");
	if(car.value!=""){
	      if (checkLength(car, 10)) {
		alert("行车长度应小于10");
		car.focus();
		return false;
	}
	}
	var structure=document.getElementById("structure");
	if(structure.value!=""){
	      if (checkLength(structure, 10)) {
		alert("结构长度应小于10");
		structure.focus();
		return false;
	}
	}
	var bear=document.getElementById("bear");
	if(bear.value!=""){
	      if (checkLength(bear, 10)) {
		alert("承重长度应小于10");
		bear.focus();
		return false;
	}
	}
	var power=document.getElementById("power");
	if(power.value!=""){
	    if (checkLength(power, 8)) {
		alert("配电功率长度应小于7");
		power.focus();
		return false;
	}
	    if(checkDecimals(power)){
	     if(!checkDecimalsLen(power,2)){
	         alert("绿化率小数点后面只能是两位");
	         power.focus();
	         return  false;
	     }
	  
	}      
	}
	var water=document.getElementById("water");
	if(water.value!=""){
	    if (checkLength(water, 8)) {
		alert("水长度应小于7");
		water.focus();
		return false;
	}
	    if(checkDecimals(water)){
	     if(!checkDecimalsLen(water,2)){
	         alert("水小数点后面只能是两位");
	         water.focus();
	         return  false;
	     }
	  
	}      
	}
	var communicate=document.getElementById("communicate");
	if(communicate.value!=""){
	      if (checkLength(communicate, 10)) {
		alert("通讯情况长度应小于10");
		communicate.focus();
		return false;
	}
	}
	var facilities=document.getElementById("facilities");
	if(facilities.value!=""){
	      if (checkLength(facilities, 50)) {
		alert("配套设施说明长度应小于50");
		facilities.focus();
		return false;
	}
	}
	var propertyManagement=document.getElementById("propertyManagement");
	if ( !checkNull(propertyManagement) &&  checkLength(propertyManagement, 8)) {
		alert("物业管理费长度应小于7");
		propertyManagement.focus();
		return false;
	}
	if(checkDecimals(propertyManagement)){
	     if(!checkDecimalsLen(propertyManagement,2)){
	         alert("物业管理费小数点后面只能是两位");
	         propertyManagement.focus();
	         return  false;
	     }
	  
	}

	
	 if (!KE.util.isEmpty('content')) document.getElementById("content").value=KE.util.getData('content');
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
		   if(checkNull(img1)){
       	    alert("请先上传第一行图片");
           return false;
         }
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
		    if(checkNull(img1)){
       	    alert("请先上传第一行图片");
           return false;
         }
          if(checkNull(img2)){
       	    alert("请先上传第二行图片");
           return false;
         }
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
			   if(checkNull(img1)){
       	    alert("请先上传第一行图片");
           return false;
         }
          if(checkNull(img2)){
       	    alert("请先上传第二行图片");
           return false;
         }
          if(checkNull(img3)){
       	    alert("请先上传第三行图片");
           return false;
         }
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
			 if(checkNull(img1)){
       	    alert("请先上传第一行图片");
           return false;
         }
          if(checkNull(img2)){
       	    alert("请先上传第二行图片");
           return false;
         }
          if(checkNull(img3)){
       	    alert("请先上传第三行图片");
           return false;
         }
          if(checkNull(img4)){
       	    alert("请先上传第四行图片");
           return false;
         }
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
	if (confirm("确认发布工业地产出售信息吗?"))
		return true;
	return false;
};
$(function (){
  load();
});
