// 发布大型项目需求脚本
$(function(){
 	$("#mgprodemand td").not($("#filter_ke td")).addClass("info_td1");
	$("#mgprodemand tr").find("td:even").not($("#filter_ke td")).addClass("title_info2");
	$("#mgprodemand tr").find("td:odd").not($("#filter_ke td")).css("padding-left","5px");
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
      var  district=$("#district");
	 if(district.combotree('getValue').trim().length==0){
         alert("请选择所在省区市");
        district.focus();
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
		alert("需求标题长度应小于40");
		title.focus();
		return false;
	}
    if (!KE.util.isEmpty('content')) document.getElementById("content").value=KE.util.getData('content');
	if (confirm("确认发布项目需求信息吗?"))
		return true;
	return false;
}

function selectNeedFlag(value){
	if(value=='1'){
		document.getElementById("moneyFlag").innerHTML="租金";
		document.getElementById("payFlag").innerHTML="元/月";
	}else if(value=='2'){
		document.getElementById("moneyFlag").innerHTML="售价";
		document.getElementById("payFlag").innerHTML="万元";
	}
}