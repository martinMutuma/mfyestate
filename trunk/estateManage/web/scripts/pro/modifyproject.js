/**
 * 验证发布大型项目信息
 */
 $(function(){
 	$("#modifyproject td").not($("#filter_ke td")).addClass("info_td1");
	$("#modifyproject tr").find("td:even").not($("#filter_ke td")).addClass("title_info2");
	$("#modifyproject tr").find("td:odd").not($("#filter_ke td")).css("padding-left","5px");
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
	load();
 });
 function selectNeedFlag(value){
	if(value=='1'){
		$("largeProFlag").val('1');
		document.getElementById("moneyFlag").innerHTML="租金";
		document.getElementById("payFlag").innerHTML="元/月";
	}else if(value=='2'){
		$("largeProFlag").val('2');
		document.getElementById("moneyFlag").innerHTML="售价";
		document.getElementById("payFlag").innerHTML="万元";
	}
}
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
function checkpro() {
       var  district=$("#district");
	 if(district.combotree('getValue').trim().length==0){
         alert("请选择所在省区市");
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
		alert("地址名字长度应小于50");
		address.focus();
		return false;
	}
	var price = document.getElementById("price");
	if (checkNull(price)) {
		alert('请填写价格');
		price.focus();
		return false;
	}
     if (checkLength(price,8)) {
		alert("价格长度应小于7");
		price.focus();
		return false;
	}
	if(checkDecimals(price)){
	     if(!checkDecimalsLen(price,2)){
	         alert("价格小数点后面只能是两位");
	         price.focus();
	         return  false;
	     }
	  
	}
	var title = document.getElementById("title");
	if (checkNull(title)) {
		alert('请填写项目名称');
		title.focus();
		return false;
	}
	if (checkLength(title, 50)) {
		alert("项目名称长度应小于50");
		title.focus();
		return false;
	 }
	 if (!KE.util.isEmpty('content')) document.getElementById("content").value=KE.util.getData('content');
	 if(confirm("确认修改项目信息吗?"))return true;
       return false;

}


