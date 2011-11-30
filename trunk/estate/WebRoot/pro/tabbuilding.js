/**
 * 验证住宅楼盘新增
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
function   checkSave(){
    var  typeAarry=document.getElementsByName("tpBulding.buildingType");
      var  flag=false;
     for(var i = 0; i < typeAarry.length; i++)
     {
      if(typeAarry[i].checked)flag=true;
     }
     if(!flag){
        alert('请至少选择一种楼盘类型');
        return false;
     }
     var  name=document.getElementById("name");
     var  namespan= document.getElementById("nameSpan");
     if(namespan.innerHTML!=''){
          alert('名字要唯一');
            name.focus();
           return false;
     }
     if(!checkNull(name)){
           alert('请填写楼盘名称');
           name.focus();
           return false;
     }
     if (checkLength(name, 25)) {
		alert("楼盘名长度应小于25");
		name.focus();
		return false;
	}
	var  nameSpan=document.getElementById("nameSpan");
	if(nameSpan.innerHTML!=""){
	   alert('楼盘名字要唯一');
	   return false;
	}
	var  district=$("#district");
	 if(district.combotree('getValue').trim().length==0){
         alert("请选择所在区域");
         district.focus();
         return false;
      }
	var  featureFlag=false;
	var featureAarry=document.getElementsByName("tpBulding.features");
	for(var j=0;j<featureAarry.length;j++){
	    if(featureAarry[j]) featureFlag=true;
	} 
	if(!featureFlag){
	    alert('请至少选择一种项目特色');
        return false;
	}
	var address=document.getElementById("address");
	if(!checkNull(address)){
           alert('请填写楼盘地址');
           address.focus();
           return false;
     }
     if (checkLength(address, 50)) {
		alert("楼盘地址长度应小于50");
		address.focus();
		return false;
	}
	var mainUnit=document.getElementById("mainUnit");
	if(!checkNull(mainUnit)){
           alert('请填写主力户型');
           mainUnit.focus();
           return false;
     }
     if (checkLength(mainUnit, 15)) {
		alert("主力户型地址长度应小于15");
		mainUnit.focus();
		return false;
	}
	 var buildingCount=document.getElementById("buildingCount");
    if(!checkNull(buildingCount)){
           alert('请填写楼盘总栋数');
           buildingCount.focus();
           return false;
     }
      if (checkLength(buildingCount, 6)) {
		alert("楼盘总栋数长度应小于6");
		buildingCount.focus();
		return false;
	}
	  if(checkDecimals(buildingCount)){
	        alert('楼盘总栋数请输入正整数');
	        buildingCount.focus();
	       return  false;
        }
    var area=document.getElementById("area");
    if(!checkNull(area)){
           alert('请填写楼盘占地面积');
           area.focus();
           return false;
     }
     if (checkLength(area, 8)) {
		alert("楼盘占地面积长度应小于8");
		area.focus();
		return false;
	}
	if(checkDecimals(area)){
	     if(!checkDecimalsLen(area,2)){
	         alert("楼盘占地面积小数点后面只能是两位");
	         area.focus();
	         return  false;
	     }
	  
	   }
	var constructionArea=document.getElementById("constructionArea");
    if(!checkNull(constructionArea)){
           alert('请填写楼盘建筑面积');
           constructionArea.focus();
           return false;
     }
     if (checkLength(constructionArea, 8)) {
		alert("楼盘建筑面积长度应小于8");
		constructionArea.focus();
		return false;
	}
	  	if(checkDecimals(constructionArea)){
	     if(!checkDecimalsLen(constructionArea,2)){
	         alert("楼盘建筑面积小数点后面只能是两位");
	         constructionArea.focus();
	         return  false;
	     }
	  
	   }
	var opendate=document.getElementById("opendate");
	if(!checkNull(opendate)){
           alert('请选择开盘日期');
           opendate.focus();
           return false;
     }
	var  minPrice=document.getElementById("minPrice");
	if(!checkNull(minPrice)){
           alert('请填写楼盘起价');
           minPrice.focus();
           return false;
     }
    
       if(minPrice.value.length>11){
		    alert("楼盘起价输入不合法，长度应小于11");
		    minPrice.focus();
		    return false;
		}
        if(checkDecimals(minPrice)){
           alert('楼盘起价请输入正整数');
             minPrice.focus();
	       return  false;
	  
	    }
	     var averagePrice=document.getElementById("averagePrice");
	      if(!checkNull(averagePrice)){
           alert('请填写楼盘均价');
           averagePrice.focus();
           return false;
       }
      if(checkNull(averagePrice)){
         
	 
          if(averagePrice.value.length>8){
		    alert("楼盘均价输入不合法，长度应小于8");
		    averagePrice.focus();
		    return false;
		}
		  if(checkDecimals(averagePrice)){
	        alert('楼盘均价请输入正整数');
	         averagePrice.focus();
	         return  false;
        }
      }
	      var  archForm=document.getElementsByName("tpBulding.archForms");
      var  flagarchForm=false;
     for(var i = 0; i < archForm.length; i++)
     {
      if(archForm[i].checked)flagarchForm=true;
     }
     if(!flagarchForm){
        alert('请至少选择一种建筑形式');
        return false;
     }
        var  propertyManagement=document.getElementById("propertyManagement");
	if(!checkNull(propertyManagement)){
           alert('请填写楼盘物业费');
           propertyManagement.focus();
           return false;
     }
     if(propertyManagement.value.length>7){
		    alert("楼盘物业管理费输入不合法，长度应小于7");
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
	    var  img=document.getElementById("img");
      	if (!checkNull(img)) {
			alert("请上传楼盘全景图");
			img.focus();
			return false;
		}
      	if (!checkImage(img)) {
			alert('图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
			
			return false;
		}
		var  fitCondition=document.getElementById("fitCondition");
		   if(checkNull(fitCondition)){
	          if(fitCondition.value.length>50){
		    alert("装修状况输入不合法，长度应小于50");
		     fitCondition.focus();
		    return false;
		}
	   
	   }
	   var  buildStatus=document.getElementById("buildStatus");
	   if(checkNull(buildStatus)){
	          if(buildStatus.value.length>200){
		    alert("楼盘状况输入不合法，长度应小于200");
		    buildStatus.focus();
		    return false;
		}
	   
	   }
	   
	 
    
       var maxPrice=document.getElementById("maxPrice");
        if(checkNull(maxPrice)){
           if(maxPrice.value.length>11){
		    alert("楼盘最高价输入不合法，长度应小于11");
		    maxPrice.focus();
		    return false;
		}
		  if(checkDecimals(maxPrice)){
	        alert('楼盘最高价请输入正整数');
	         maxPrice.focus();
	       return  false;
        }
        }
   
     var unitCount=document.getElementById("unitCount");
     if(checkNull(unitCount)){
        if (checkLength(unitCount, 6)) {
		alert("楼盘总套数长度应小于6");
		unitCount.focus();
		return false;
	    }
	    if(checkDecimals(unitCount)){
	        alert('楼盘总套数请输入正整数');
	        unitCount.focus();
	       return  false;
        }
	
     }
      var greenRate=document.getElementById("greenRate");
      	if(checkNull(greenRate)){
           if(greenRate.value.length>7){
		    alert("绿化率输入不合法，长度应小于7");
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
    
	   var capacityRate=document.getElementById("capacityRate");
      	if(checkNull(capacityRate)){
           if(capacityRate.value.length>7){
		    alert("容积率输入不合法，长度应小于7");
		    capacityRate.focus();
		    return false;
		}
		if(checkDecimals(capacityRate)){
	     if(!checkDecimalsLen(capacityRate,2)){
	         alert("容积率小数点后面只能是两位");
	         capacityRate.focus();
	         return  false;
	     }
	    }
     }
      
         var outterWall=document.getElementById("outterWall");
         if(checkNull(outterWall)){
           if(outterWall.value.length>25){
		    alert("外墙输入不合法，长度应小于25");
		    outterWall.focus();
		    return false;
		}
         }
           var structure=document.getElementById("structure");
         if(checkNull(structure)){
           if(structure.value.length>50){
		    alert("结构输入不合法，长度应小于50");
		    structure.focus();
		    return false;
		}
		}
         
           var contractors=document.getElementById("contractors");
         if(checkNull(contractors)){
           if(contractors.value.length>25){
		    alert("承建商输入不合法，长度应小于25");
		    contractors.focus();
		    return false;
		}
		}
       
          var carPat=document.getElementById("carPat");
     if(checkNull(carPat)){
        if (checkLength(carPat, 6)) {
		alert("车位长度应小于6");
		carPat.focus();
		return false;
	    }
	    if(checkDecimals(carPat)){
	        alert('车位请输入正整数');
	        carPat.focus();
	       return  false;
        }
	
     }
       
       
        var propertyCompany=document.getElementById("propertyCompany");
         if(checkNull(propertyCompany)){
           if(propertyCompany.value.length>40){
		    alert("物业公司输入不合法，长度应小于40");
		    propertyCompany.focus();
		    return false;
		}
		}
		
		 var waterSupply=document.getElementById("waterSupply");
         if(checkNull(waterSupply)){
           if(waterSupply.value.length>15){
		    alert("供水输入不合法，长度应小于15");
		    waterSupply.focus();
		    return false;
		}
		}
		
		 var heatingSupply=document.getElementById("heatingSupply");
         if(checkNull(heatingSupply)){
           if(heatingSupply.value.length>25){
		    alert("供暖输入不合法，长度应小于25");
		    heatingSupply.focus();
		    return false;
		}
		}
        if (confirm("确认新增楼盘信息吗?"))
	 	 return true;
	    else  return  false;
	  
	}
	$(function(){
	    $("#buildingrent td").not($("#filter_ke td")).addClass("info_td1");
		$("#buildingrent tr").find("td:even").not($("#filter_ke td")).addClass("title_info2");
		$("#buildingrent tr").find("td:odd").not($("#filter_ke td")).css("padding-left","5px");
	});
	
   

