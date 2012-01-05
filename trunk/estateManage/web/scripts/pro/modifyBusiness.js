/**
 * 验证修改生意转让信息
 */
  $(function(){
 	$("#modifymessage td").not($("#filter_ke td")).addClass("info_td1");
	$("#modifymessage tr").find("td:even").not($("#filter_ke td")).addClass("title_info2");
	$("#modifymessage tr").find("td:odd").not($("#filter_ke td")).css("padding-left","10px");
	$("#isMemberS").click(function(){
		$("#isMember_single").show();
		$("#isMember_single input").attr("disabled",false);
	})
	$("#isMemberF").click(function(){
		$("#isMember_single").hide();
		$("#isMember_single input").attr("disabled",true);
	})
	if(state=='2'){
		$("#rentDate").attr("disabled",true);
		$("#payWay").attr("disabled",true);
		$("#propertyRent").attr("disabled",true);
	}
	load();
 });
 function clickradio(val){
 	if(val=='2'){
		$("#rentDate").attr("disabled",true);
		$("#payWay").attr("disabled",true);
		$("#propertyRent").attr("disabled",true);
	}else{
		$("#rentDate").attr("disabled",false);
		$("#payWay").attr("disabled",false);
		$("#propertyRent").attr("disabled",false);
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
 
function checksendMessage() {
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
function auditingFailed(){
	alert("审核失败");
	window.location.href = basePath+'images/baseinfo_toManageBusiness.shtml';
}

function notLogged(){
   alert("没有登录");
   parent.window.location.href = basePath;
}

function auditingSuccess(){
	alert("审核成功");
	window.location.href = basePath+'images/baseinfo_toManageBusiness.shtml';
}