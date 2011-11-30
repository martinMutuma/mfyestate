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
     var  name=  document.getElementById("name");
     if( checkNull(name)){
          alert('请填商铺名称');
          name.focus();
          return false;
     }
     var  address=  document.getElementById("address");
     if( checkNull(address)){
          alert('请填商铺地址');
          address.focus();
          return false;
     }
     var  district=  document.getElementById("district");
     if( checkNull(district)){
          alert('请选择所属区域');
          $("#districtShow").focus();
          return false;
     }
     var  area=  document.getElementById("area");
     if( checkNull(area)){
          alert('请填写建筑面积');
          area.focus();
          return false;
     }
     if( !isUnsignedNumeric(area)){
     	   alert('建筑面积应为正实数');
           area.focus();
           return false;
     }
     var  areauseful =  document.getElementById("areauseful");
     if( checkNull(areauseful)){
          alert('请填写使用面积');
          areauseful.focus();
          return false;
     }
     if( !isUnsignedNumeric(areauseful)){
     	   alert('使用面积应为正实数');
           area.focus();
           return false;
     }
     var  bursary=document.getElementById("bursary");
     if( checkNull(bursary)){
          alert('请填写售价');
          bursary.focus();
          return false;
     }
     if( !isUnsignedNumeric(bursary)){
     	   alert('商铺租金单价应为正实数');
           bursary.focus();
           return false;
     }
     var  propertyManagement=document.getElementById("propertyManagement");
     if( checkNull(propertyManagement)){
          alert('请填写物业管理费');
          propertyManagement.focus();
          return false;
     }
     if( !isUnsignedNumeric(propertyManagement)){
     	   alert('物业管理费应为正实数');
           propertyManagement.focus();
           return false;
     }
     var floorCategoryS = document.getElementById("floorCategoryS");
     if(floorCategoryS.checked){
     	var subFloorS = document.getElementById("subFloorS");
     	if( checkNull(subFloorS)){
          alert('请填写具体楼层');
          subFloorS.focus();
          return false;
     	}
     	var totalFloorS = document.getElementById("totalFloorS");
     	if( checkNull(totalFloorS)){
          alert('请填写具体楼层');
          totalFloorS.focus();
          return false;
     	}
     }else{
     	var subFloor_fs = document.getElementById("subFloor_fs");
     	if( checkNull(subFloor_fs)){
          alert('请填写具体楼层');
          subFloor_fs.focus();
          return false;
     	}
     	var floor2_fs = document.getElementById("floor2_fs");
     	if( checkNull(floor2_fs)){
          alert('请填写具体楼层');
          floor2_fs.focus();
          return false;
     	}
     	var totalFloor_fs = document.getElementById("totalFloor_fs");
     	if( checkNull(totalFloor_fs)){
          alert('请填写具体楼层');
          totalFloor_fs.focus();
          return false;
     	}
     }
     var  mright=document.getElementById("mright");
     if( checkNull(mright)){
          alert('请选择权属');
          mright.focus();
          return false;
     }
     var  fitment=document.getElementsByName("shop.fitment");
     var fitmentIndex = 0;
     for(var i = 0; i < fitment.length; i++){
     	if(fitment[i].checked)
     		break;
     	fitmentIndex ++;
     }
     if(fitmentIndex == fitment.length){
     	alert("请选择装修情况");
     	return false;
     }
     var  forward=document.getElementById("forward");
     if( checkNull(forward)){
          alert('请选择朝向');
          forward.focus();
          return false;
     }
     var  cbd=document.getElementById("cbd");
     if(checkNull(cbd)){
     	   alert('请填写所属商圈');
           cbd.focus();
           return false;
     }
     var  title=document.getElementById("title");
     if(checkNull(title)){
     	   alert('请填写商铺案源标题');
           title.focus();
           return false;
     }
     if (!KE.util.isEmpty('content')) document.getElementById("content").value=KE.util.getData('content');
     var content = document.getElementById("content");
     if(content.length>1000){
     	alert("案源描述字数不能超过1000个汉字");
     }
     var  img1=document.getElementById("img1");
     if(!checkNull(img1)&&!checkImage(img1)){
   	  alert('第一行图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
   	  img1.focus();
   	  return false;
     }
     var img2=document.getElementById("img2");
     if(!checkNull(img2)&&!checkImage(img2)){
   	  	alert('第二行图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
   	   	img2.focus();
   	  	return false;
     }
     var img3=document.getElementById("img3");
     if(!checkNull(img3)&&!checkImage(img3)){
   	  	alert('第三行图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
   	   	img3.focus();
   	  	return false;
     }
     var img4=document.getElementById("img4");
     if(!checkNull(img4)&&!checkImage(img4)){
  	   alert('第四行图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
  	   img4.focus();
  	   return false;
     }
     var  img5=document.getElementById("img5");
       if(!checkNull(img5)&&!checkImage(img5)){
     	  alert('第五行图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
     	   img5.focus();
     	  return false;
         }
       if(confirm("确认发布该商铺出售信息吗?"))return true;
       return false;

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
