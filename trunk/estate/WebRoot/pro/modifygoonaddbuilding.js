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
      var lifeSupport=document.getElementById("lifeSupport");
	 if(!checkNull(lifeSupport)){
           alert('请填写生活配套');
           lifeSupport.focus();
           return false;
     }
     if (checkLength(lifeSupport, 100)) {
		alert("生活配套长度应小于100");
		lifeSupport.focus();
		return false;
	}
    var neighborhoods=document.getElementById("neighborhoods");
	if(!checkNull(neighborhoods)){
           alert('请填写小区配套');
           neighborhoods.focus();
           return false;
     }
      if (checkLength(neighborhoods, 100)) {
		alert("小区配套长度应小于100");
		neighborhoods.focus();
		return false;
	}
    var traffic=document.getElementById("traffic");
	if(!checkNull(traffic)){
           alert('请填写交通状况');
           traffic.focus();
           return false;
     }
      if (checkLength(traffic, 100)) {
		alert("交通状况长度应小于100");
		traffic.focus();
		return false;
	}
	var other=document.getElementById("other");
    if (checkNull(other) && checkLength(other, 100)) {
		alert("其他长度应小于100");
		other.focus();
		return false;
	}
    if (confirm("确认修改楼盘信息吗?"))
		return true;
	return false;
}
function subForm(subflag,id){
    if(checkSave()){
       document.form.action=basePath+"building/modifyAllPics.shtml?subflag="+subflag+"&id="+id;
       document.form.submit();
     }
}
function  addPic(){

   $("#picdiv").html($("#picdiv").html()+'<br>图片名称:<input type="text" name="tpImage.imgName" id="imgName" /><select name="tpImage.category"><option value="0">效果图</option><option value="1">实景图</option><option value="2">周边配套</option><option value="3">样板间</option><option value="4">户型</option><option value="5">其他</option></select> <select name="tpImage.imgType"><option value="0">一居</option><option value="1">二居</option><option value="2">三居</option></select> <input type="file"  name="img" />');
   
   
}
   $(function(){
	    $("#buildingrent td").not($("#filter_ke td")).addClass("info_td1");
		$("#buildingrent tr").find("td:even").not($("#filter_ke td")).addClass("title_info2");
		$("#buildingrent tr").find("td:odd").not($("#filter_ke td")).css("padding-left","5px");
		 load();
	}); 