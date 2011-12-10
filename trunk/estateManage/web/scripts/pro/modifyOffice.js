/**
 * 
 * 写字楼出租验证
 */
$(function(){
		$("#buildingrent td").not($("#filter_ke td")).addClass("info_td1");
		$("#buildingrent tr").find("td:even").not($("#filter_ke td")).addClass("title_info2");
		$("#buildingrent tr").find("td:odd").not($("#filter_ke td")).css("padding-left","5px");
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
});
  String.prototype.trim=function(){
             return this.replace(/(^\s*)|(\s*$)/g, "");
            }
function checkNull(obj){
 if(obj.value.trim().length==0)
	 return true;
 else
	 return false;
}

function checkLength(obj,len){
	 if(obj.value.length>len)
		 return true;
	 else
	     return false;
}
//判断是否是正实数
function isUnsignedNumeric(obj) {
	var reg=/^\d+(\.\d+)?$/
	if(reg.test(obj.value)){
		return true;
	}else{
		return false;
	}
}
//判断是否是非正浮动数
function   isFloat(obj){
    var  reg=/^((-\d+(\.\d+)?)|(0+(\.0+)?))$/
    	if(reg.test(obj.value)){
		return true;
	}else{
		return false;
	}
}
//判断是正实数 不是则用空字符串代替
 function  isNum(obj){
    if(isNaN(obj.value)){
    	 obj.value="";
    }
    if(isFloat(obj)){
        obj.value="";
    }
 	
 }
function checkImage(obj){
	if(obj.value == "")
		return true;
	if(/(.gif)|(.png)|(.jpg)|(.jpeg)|(.ico)$/.exec(obj.value))		  
		return true;
	else  
		return  false;
}

function checkrent(){
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
 
function addFloor(){
 	 window.open ('floor.jsp', '新增楼盘', 'height=900, width=1000, top=0, left=0,menubar=no,scrollbars=yes, resizable=no,location=no');
}

function setvalue(data){
    $("#name").val(data.name);
 	$("#add1").val(data.address);
    $("#propertyManagement").val(data.propertyFees);
 	$("#address").text(data.address);
    $("#propertyFees").text(data.propertyFees);
    // $("#discode").text(data.district);
    //  $("#disname").text(data.disname);
   //   alert($("#discode").val());
    //  alert($("#disname").val());
    $("#discode").val(data.district);
    $("#disname").val(data.disname);
}

function auditingFailed(){
	alert("审核失败");
	window.location.href = basePath+'images/baseinfo_toManageRent.shtml';
}

function notLogged(){
   alert("没有登录");
   parent.window.location.href = basePath;
}

function auditingSuccess(){
	alert("审核成功");
	window.location.href = basePath+'images/baseinfo_toManageRent.shtml';
}

 
  