/**
 * 验证商铺需求信息
 */
 $(function(){
 	$("#shopdemand td").not($("#filter_ke td")).addClass("info_td1");
	$("#shopdemand tr").find("td:even").not($("#filter_ke td")).addClass("title_info2");
	$("#shopdemand tr").find("td:odd").not($("#filter_ke td")).css("padding-left","5px");
	$("#districtShow").combotree({url:"", animate:true, onShowPanel:function () {
		var dataUrl = "../district/bulidDistrictTree.shtml?level=5&districtCode=0000000000&t=" + (new Date()).getTime().toString(36);
		if ($("#districtShow").combotree("options").url == "") {
			$.messager.show({showType:null, showSpeed:1000, width:150, height:70, msg:"\u5730\u533a\u4fe1\u606f\u52a0\u8f7d\u4e2d... ...", title:"\u63d0\u793a", timeout:2000});
			$("#districtShow").combotree("options").url = dataUrl;
			$.get(dataUrl, function (data) {
				var json = "";
				try {
					json = eval("(" + data + ")");
				}
				catch (e) {
					json = data;
				}
				$("#districtShow").combotree("loadData", json);
			});
		}
	}, onLoadSuccess:function () {
		if ($("#districtShow").combotree("options").url != "") {
			$.messager.show({showType:"slide", showSpeed:1000, width:150, height:70, msg:"\u5730\u533a\u4fe1\u606f\u52a0\u8f7d\u5b8c\u6210", title:"\u63d0\u793a", timeout:3000});
		}
	}, onClick:function (node) {
		$("#district").val(node.id);
		$("#disname").val(node.text);
	}});
 });
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
    var title=document.getElementById("title");
    if(!checkNull(title)){
       alert('请填写标题');
       title.focus();
       return false;
    }
     var  district=  document.getElementById("district");
     if(!checkNull(district)){
          alert('请选择所属区域');
          $("#districtShow").focus();
          return false;
     }
      
    var address=document.getElementById("address");
    if(!checkNull(address)){
       alert('请填写房源座落');
       address.focus();
       return  false;
    }
    var address=document.getElementById("address");
    if(!checkNull(address)){
       alert('请填写房源座落');
       address.focus();
       return  false;
    }
    var consYearStart = document.getElementById("consYearStart");
	var consYearEnd = document.getElementById("consYearEnd");
	if (!checkNull(consYearStart)) {
		alert("请填写建筑年份");
		consYearStart.focus();
		return false;
	}
	if (!checkNull(consYearEnd)) {
		alert("请填写建筑年份");
		consYearEnd.focus();
		return false;
	}
	if (parseInt(consYearStart.value,10) >= parseInt(consYearEnd.value,10)){
		alert("建筑年份最小值应小于最大值");
		return false;
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

		if (parseInt(minArea.value,10) >= parseInt(maxArea.value,10)){
			alert("建筑面积最小值应小于最大值");
			minArea.focus();
			return false;
		}
	}
	var minPrice = document.getElementById("minPrice");
	var maxPrice = document.getElementById("maxPrice");
	if ((!checkNull(minPrice)) && (checkNull(maxPrice))) {
		alert("请填写租金最小值");
		minPrice.focus();
		return false;

	}
	if(!checkNull(minPrice)){
	    alert("请填写租金最小值");
		minPrice.focus();
		return false;
	}
	if(!checkNull(maxPrice)){
	    alert("请填写租金最大值");
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
		    alert("租金最大值输入不合法，长度应小于8");
		    maxPrice.focus();
		    return false;
		}
		if(checkDecimals( maxPrice)){
	     if(!checkDecimalsLen( maxPrice,2)){
	         alert("租金最大值小数点后面只能是两位");
	         maxPrice.focus();
	         return  false;
	     }
	}
		if (parseInt(minPrice.value,10) >= parseInt(maxPrice.value,10)) {
			alert("租金最小值应该小于最大值");
			 minPrice.focus();
			return false;
		}
	}
	var userName = document.getElementById("userName");
	if (!checkNull(userName)) {
		alert("请填写联系人");
		userName.focus();
		return false;
	}
	var phone = document.getElementById("phone");
	if (!checkNull(phone)) {
		alert("请填写联系电话");
		phone.focus();
		return false;
	}
	if (!KE.util.isEmpty('content')) document.getElementById("content").value=KE.util.getData('content');
	if (confirm("确认发布商铺需求信息吗?"))
		return true;
	return false;
}

function selectNeedFlag(value){
	if(value=='1'){
		document.getElementById("moneyFlag").innerHTML="租金";
		document.getElementById("payFlag").innerHTML="元/月";
		$("#rentType").show();
		$("#renttype").show();
		$("#rentType").attr("disabled",false);
	}else if(value=='2'){
		document.getElementById("moneyFlag").innerHTML="售价";
		document.getElementById("payFlag").innerHTML="万元";
		$("#rentType").hide();
		$("#renttype").hide();
		$("#rentType").attr("disabled",true);
	}
}