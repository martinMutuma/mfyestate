/**
 * 验证商铺出售信息
 */
 $(function(){
	$("#shopsale tr td:first")
		.filter(function(){return $(this).attr("colspan")!=2})
		.css("text-align","right");
	$("#shopsale td").not($("#filter_ke td")).addClass("info_td1");
	$("#shopsale tr").find("td:even").not($("#filter_ke td")).addClass("title_info2");
	$("#shopsale tr").find("td:odd").not($("#filter_ke td")).css("padding-left","5px");
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
	$("#floorCategoryS").click(function(){
		$("#floorType_fs").hide();
		$("#floorType_fs input").attr("disabled",true);
		$("#floorType_single").show();
		$("#floorType_single input").attr("disabled",false);
	})
	$("#floorCategoryF").click(function(){
		$("#floorType_fs").show();
		$("#floorType_fs input").attr("disabled",false);
		$("#floorType_single").hide();
		$("#floorType_single input").attr("disabled",true);
	})
	load();
});
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
function checkshopsale() {
     var auditingState = document.getElementById("auditingState");
     if(checkNull(auditingState)){
          alert('请选择核实状态');
          auditingState.focus();
          return false;
     }
     var auditingRemark = document.getElementById("auditingRemark");
     if(auditingState.value!=0 && auditingState.value!=1 && auditingState.value!=4 && auditingState.value!=5 && checkNull(auditingRemark)){
      	  alert('请填写审核意见');
          auditingState.focus();
          return false;
     }
     return true;
}

// 返回值是true 表面都有被选
function selectAllChkboxs(name) {
	var getChkboxs = document.getElementsByName(name);
	for (var i = getChkboxs.length - 1; i >= 0; i--) {
		if (getChkboxs[i].checked)
			return true;

	}
	return false;
}

function auditingFailed(){
	alert("审核失败");
	window.location.href = basePath+'images/baseinfo_toManageShop.shtml';
}

function notLogged(){
   alert("没有登录");
   parent.window.location.href = basePath;
}

function auditingSuccess(){
	alert("审核成功");
	window.location.href = basePath+'images/baseinfo_toManageShop.shtml';
}