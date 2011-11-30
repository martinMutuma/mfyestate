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
function   checkSave(){
     var businessDevelopment=document.getElementById("businessDevelopment");
	if(!checkNull(businessDevelopment)){
           alert('请填写开发商地址');
           businessDevelopment.focus();
           return false;
     }
     if (checkLength(businessDevelopment, 25)) {
		alert("开发商地址长度应小于25");
		businessDevelopment.focus();
		return false;
	}
	 var investors=document.getElementById("investors");
     if (checkNull(investors) && checkLength(investors, 25)) {
		alert("投资商地址长度应小于25");
		investors.focus();
		return false;
	}
	var  preLicense=document.getElementById('preLicense');
	if(checkNull(preLicense)){
	   if (checkLength(preLicense, 15)) {
		   alert("预售许可证长度应小于15");
		   preLicense.focus();
		   return false;
	   }
	}
	if (!KE.util.isEmpty('projectIns')) document.getElementById("projectIns").value=KE.util.getData('projectIns');
    if (!KE.util.isEmpty('trends')) document.getElementById("trends").value=KE.util.getData('trends');
    if (confirm("确认新增楼盘信息吗?"))
		return true;
	return false;
}
	$(function(){
	    $("#buildingrent td").not($("#filter_ke td")).not($("#filter_ke1 td")).addClass("info_td1");
		$("#buildingrent tr").find("td:even").not($("#filter_ke td")).not($("#filter_ke1 td")).addClass("title_info2");
		$("#buildingrent tr").find("td:odd").not($("#filter_ke td")).not($("#filter_ke1 td")).css("padding-left","5px");
		
	});
	