function checkImage(obj) {
	if (/(.gif)|(.png)|(.jpg)|(.jpeg)|(.ico)$/.exec(obj.value))
		return true;
	else
		return false;
}
 String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
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
// 判断是否是非正浮动数
function isFloat(obj) {
	var reg = /^((-\d+(\.\d+)?)|(0+(\.0+)?))$/
	if (reg.test(obj.value)) {
		return true;
	} else {
		return false;
	}
}
$(function () {
//init district tree combobox
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
	
//richer editor init
KE.show({
	id : 'introduction',
	loadStyleMode : false,
	resizeMode : 0,
	allowUpload:true, //允许上传图片 
	imageUploadJson:'../comutil/upload.shtml',
	shadowMode: true,autoSetDataMode: true,allowPreviewEmoticons: true, 
	items : [
	'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
	'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
	'insertunorderedlist', '|','image']
});

//init button
$("#submit").linkbutton({
	disabled:false,
	plain:false,
	text:'保存并退出',
	iconCls:'icon-add'
})
$("#submit4Image").linkbutton({
	disabled:false,
	plain:false,
	text:'保存并进行下一步',
	iconCls:'icon-save'
})
});

var nowYear = (new Date()).getFullYear();
function changeBuildYear(type){
	var year = $("#createTime");
	var age = $("#age");
	var yearValue = year.val();
	var ageValue = age.val();
	if(type==1&&yearValue!=""){
		if(yearValue.length!=4||parseInt(yearValue,10)>parseInt(nowYear,10)){
			alert('建筑年代填写错误！');
			return;
		}
		age.val((parseInt(nowYear,10)-parseInt(year.val(),10))+"");
	}
	else if(type==2&&ageValue!=""){
		if(parseInt(ageValue,10)<0){
			alert('房龄！');
			return;
		}
		year.val(parseInt(nowYear,10)-parseInt(ageValue,10));
	}
}
function  checkSave(){
      var  district=$("#districtShow");
	 if(district.combotree('getValue')==""){
	    alert('请选择所在区域！');
	     district.focus();
         return false;
      }
     var  title=$("#title");
     if($.trim(title.val()).length==0){
         alert('请填写标题！');
         title.focus();
         return false;
       }
     if($.trim(title.val()).length>25){
         alert('标题长度大于25！');
         title.focus();
         return false;
     }
     var   name=$('#name');
     if($.trim(name.val()).length==0){
         alert('请填写住宅名称！');
         name.focus();
         return false;
     }
     if($.trim(name.val()).length>25){
         alert('住宅名称长度大于25！');
         name.focus();
         return false;
     }
    var  pic=document.getElementById("compressUrl");
     var a= $("#modifyPic").html();
	   if(a!=''){
    if(pic.value.length==0){
        alert('请上传缩略图！');
        pic.focus();
        return false;
    }
    if (!checkImage(pic)) {
			alert('图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
			pic.focus(); 
			return false;
		}
		}
   var address=$("#address");
    if($.trim(address.val()).length==0){
         alert('请填写详细地址！');
         address.focus();
         return false;
     }
     if($.trim(address.val()).length>25){
         alert('详细地址长度大于25！');
         address.focus();
         return false;
     }
    var  phone=document.getElementById("phone");
    if(phone.value.trim().length==0){
          alert('请填写咨询电话');
          phone.focus();
          return  false;
    }
   if((!phone.value.isMobile())  &&  (!phone.value.isTel())){
          alert('请填写合法的咨询电话');
          phone.focus();
          return  false;
    }
    
    var  respDistrict=$("#respDistrict");
    if($.trim(respDistrict.val()).length==0){
           alert('请填小区名称');
           respDistrict.focus();
           return  false;
    }
    if($.trim(respDistrict.val()).length>25){
           alert('小区名称长度大于25');
           respDistrict.focus();
           return  false;
    }
     var floor=$("#floor");
     if($.trim(floor.val()).length==0){
            alert('请填写第几层');
            floor.focus();
            return  false;
    }
    var floorCount=$("#floorCount");
     if($.trim(floorCount.val()).length==0){
            alert('请填写共多少层');
            floorCount.focus();
            return  false;
    }
     var  consArea=$("#consArea");
     if($.trim(consArea.val()).length==0){
            alert('请填写筑面积');
            consArea.focus();
           return  false;
    }
     var  userArea=$("#userArea");
     if($.trim(userArea.val()).length==0){
            alert('请填写使用面积');
            userArea.focus();
            return  false;
    }
    var  price=$("#price");
     if($.trim(price.val()).length==0){
            alert('请填写租金');
            price.focus();
            return  false;
    }
    
      if (!KE.util.isEmpty('introduction')) document.getElementById("introduction").value=KE.util.getData('introduction');
    var introduction=document.getElementById('introduction');
    if(introduction.value.trim().length>5000){
         alert('房源介绍长度大于5000');
           introduction.focus();
           return  false;
    }
    return true;
}
function formSubmit(submitFlag){
     if(!checkSave()){ return;}
	document.infoForm.action = '../secondBd/saveSB.shtml?submitFlag='+submitFlag;
	document.infoForm.submit();
}
$(function(){
	    $("#buildingrent td").not($("#filter_ke td")).addClass("info_td1");
		$("#buildingrent tr").find("td:even").not($("#filter_ke td")).addClass("title_info2");
		$("#buildingrent tr").find("td:odd").not($("#filter_ke td")).css("padding-left","5px");
	});
//验证输入是否为手机号码
String.prototype.isMobile = function() {   
	var myreg = /^(((13[0-9]{1})|15[0-9]{1}|189)+\d{8})$/;  
	//return (/^(?:13\d|15[89])-?\d{5}(\d{3}|\*{3})/.test(this.trim()));   
	//return (/^13\d{9}$/g.test(value)||(/^15[0-35-9]\d{8}$/g.test(value))||(/^18[05-9]\d{8}$/g.test(this.trim());
	/*if( myreg.test(this.trim())){
		alert("true");
	}else{
	   alert("false")
	}*/
	return myreg.test(this.trim());
} 
//验证输入是否为电话
String.prototype.isTel = function(){   
//"兼容格式: 国家代码(2到3位)-区号(2到3位)-电话号码(7到8位)-分机号(3位)"   
//return (/^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?/.test(this.trim()));   
	return (/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?/.test(this.trim()));   
}
   function  modifyPic(obj){
       $("#modifyPic").html('<input type="file" name="tpsImage" id="compressUrl"/>&nbsp;&nbsp;&nbsp;<input type="button" value="取消" onclick="movePic()"/>');
     
   }
   function  movePic(){
      var picbtn=document.getElementById("picbtn");
      $("#modifyPic").html('');
   }