/**
 * 验证生意转让信息
 */
 $(function(){
 	$("#sendMessage td").not($("#filter_ke td")).addClass("info_td1");
	$("#sendMessage tr").find("td:even").not($("#filter_ke td")).addClass("title_info2");
	$("#sendMessage tr").find("td:odd").not($("#filter_ke td")).css("padding-left","5px");
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
	
	$("#isMemberS").click(function(){
		$("#isMember_single").show();
		$("#isMember_single input").attr("disabled",false);
	})
	$("#isMemberF").click(function(){
		$("#isMember_single").hide();
		$("#isMember_single input").attr("disabled",true);
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


function checksendMessage() {
     var  district=  document.getElementById("district");
     if(checkNull(district)){
          alert('请选择所属区域');
          $("#districtShow").focus();
          return false;
     }
	var title = document.getElementById("title");
	if (checkNull(title)) {
		alert('请填写信息标题');
		title.focus();
		return false;
	}
	if (checkLength(title, 50)) {
		alert("信息标题长度应小于50");
		title.focus();
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
  
	var area = document.getElementById("area");
	if (checkNull(area)) {
		alert('请填写物业面积');
		area.focus();
		return false;
	}
	if (checkLength(area, 8)) {
		alert("物业面积长度应小于7");
		area.focus();
		return false;
	}
	if(checkDecimals(area)){
	    if(!checkDecimalsLen(area,2)){
	        alert("物业面积小数点后面只能是两位");
	        area.focus();
	        return  false;
	     }
	    }
	var price = document.getElementById("price");
	if (checkNull(price)) {
		alert('请填写转让价格');
		price.focus();
		return false;
	}
	if (checkLength(price, 8)) {
		alert("转让价格长度应小于7");
		price.focus();
		return false;
	}
	if(checkDecimals(price)){
	     if(!checkDecimalsLen(price,2)){
	         alert("转让价格小数点后面只能是两位");
	         price.focus();
	         return  false;
	     }
	  
	}
	var propertyRent=document.getElementById("propertyRent");
	if(propertyRent.value!=""){
	     if (checkLength(propertyRent, 8)) {
		alert("租金长度应小于7");
		 propertyRent.focus();
		return false;
	}
	if(checkDecimals(propertyRent)){
	     if(!checkDecimalsLen(propertyRent,2)){
	         alert("租金小数点后面只能是两位");
	         propertyRent.focus();
	         return  false;
	     }
	  
	}
	}
	var payway=document.getElementById("payway");
	if(payway.value!=""){
	      if (checkLength(payway, 25)) {
		alert("租金付款方式长度应小于25");
		payway.focus();
		return false;
	}
	}
	var rentState=document.getElementById("rentState");
	if(rentState.value!=""){
	      if (checkLength(rentState, 25)) {
		alert("租金递增状况长度应小于25");
		rentState.focus();
		return false;
	}
	}
	
	var companyType = document.getElementById("geTi")
	var capital = document.getElementById("capital")
	if (!companyType.checked && checkNull(capital)) {
		alert('请填写注册资金');
		capital.focus();
		return false;
	}
	
	if ( !checkNull(capital) && checkLength(capital, 8)) {
		alert("注册资金长度应小于7");
		capital.focus();
		return false;
	}
	if(!checkNull(capital) && checkDecimals(capital)){
	     if(!checkDecimalsLen(capital,2)){
	         alert("注册资金小数点后面只能是两位");
	         capital.focus();
	         return  false;
	     }
	  
	}
	var shares = document.getElementById("shares");
	if (!checkNull(shares) && shares > 100) {
		alert("转让股份应小于100");
		shares.focus();
		return false;
	}
	var scope=document.getElementById("scope");
	if(scope.value!=""){
	   if (checkLength(scope, 50)) {
		alert("经营范围长度应小于50");
		scope.focus();
		return false;
	}
	}


	var businessturnover=document.getElementById("businessturnover");
	if(businessturnover.value!=""){
	     if (checkLength(businessturnover, 8)) {
		alert("过去一年营业额长度应小于7");
		businessturnover.focus();
		return false;
	}
	if(checkDecimals(businessturnover)){
	     if(!checkDecimalsLen(businessturnover,2)){
	         alert("过去一年营业额小数点后面只能是两位");
	         businessturnover.focus();
	         return  false;
	     }
	  
	}
	}
	
	var businessprofits=document.getElementById("businessprofits");
	if(businessprofits.value!=""){
	     if (checkLength(businessprofits, 8)) {
		alert("过去一年利润长度应小于7");
		businessprofits.focus();
		return false;
	}
	if(checkDecimals(businessprofits)){
	     if(!checkDecimalsLen(businessprofits,2)){
	         alert("过去一年利润小数点后面只能是两位");
	         businessprofits.focus();
	         return  false;
	     }
	  
	}
	}
	
	var businessTax=document.getElementById("businessTax");
	if(businessTax.value!=""){
	     if (checkLength(businessTax, 8)) {
		alert("过去一年营业税长度应小于7");
		businessTax.focus();
		return false;
	}
	if(checkDecimals(businessTax)){
	     if(!checkDecimalsLen(businessTax,2)){
	         alert("过去一年营业税小数点后面只能是两位");
	         businessTax.focus();
	         return  false;
	     }
	  
	}
	}
	
	 var incomeTax=document.getElementById("incomeTax");
	if(incomeTax.value!=""){
	     if (checkLength(incomeTax, 8)) {
		alert("过去一年所得税长度应小于7");
		incomeTax.focus();
		return false;
	}
	if(checkDecimals(incomeTax)){
	     if(!checkDecimalsLen(incomeTax,2)){
	         alert("过去一年所得税小数点后面只能是两位");
	         incomeTax.focus();
	         return  false;
	     }
	  
	}
	}
	if (!KE.util.isEmpty('content')) {
	 var content= document.getElementById("content")
	  content.value=KE.util.getData('content');
	  if(content.value.length>1000){
	     alert("案源描述长度应小于1000");
		content.focus();
		return false;
	  }
	};
	var imgName1 = document.getElementById("imgName1");
	var img1 = document.getElementById("img1");
	if (!checkNull(imgName1)) {
		if (checkLength(imgName1, 40)) {
			alert("第一行图片名字长度应小于40");
			imgName1.focus();
			return false;
		}
		if (checkNull(img1)) {
			alert("请上传第一行图片");
			img1.focus();
			return false;
		}
		if (!checkImage(img1)) {
			alert('第一行图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
			img1.focus();
			return false;
		}
	}
	var imgName2 = document.getElementById("imgName2");
	var img2 = document.getElementById("img2");
	if (!checkNull(imgName2)) {
		  if(checkNull(img1)){
       	    alert("请先上传第一行图片");
           return false;
         }
		if (checkLength(imgName2, 40)) {
			alert("第二行图片名字长度应小于40");
			imgName2.focus();
			return false;
		}
		if (checkNull(img2)) {
			alert("请上传第二行图片");
			img2.focus();
			return false;
		}
		if (!checkImage(img2)) {
			alert('第二行图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
			img2.focus();
			return false;
		}
	}
	var imgName3 = document.getElementById("imgName3");
	var img3 = document.getElementById("img3");
	if (!checkNull(imgName3)) {
		 if(checkNull(img1)){
       	    alert("请先上传第一行图片");
           return false;
         }
          if(checkNull(img2)){
       	    alert("请先上传第二行图片");
           return false;
         }
		if (checkLength(imgName3, 40)) {
			alert("第三行图片名字长度应小于40");
			imgName3.focus();
			return false;
		}
		if (checkNull(img3)) {
			alert("请上传第三行图片");
			img3.focus();
			return false;
		}
		if (!checkImage(img3)) {
			alert('第三行图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
			img3.focus();
			return false;
		}
	}
	var imgName4 = document.getElementById("imgName4");
	var img4 = document.getElementById("img4");
	if (!checkNull(imgName4)) {
		  if(checkNull(img1)){
       	    alert("请先上传第一行图片");
           return false;
         }
          if(checkNull(img2)){
       	    alert("请先上传第二行图片");
           return false;
         }
          if(checkNull(img3)){
       	    alert("请先上传第三行图片");
           return false;
         }
		if (checkLength(imgName4, 40)) {
			alert("第四行图片名字长度应小于40");
			imgName4.focus();
			return false;
		}
		if (checkNull(img4)) {
			alert("请上传第四行图片");
			img4.focus();
			return false;
		}
		if (!checkImage(img4)) {
			alert('第四行图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
			img4.focus();
			return false;
		}
	}
	var imgName5 = document.getElementById("imgName5");
	var img5 = document.getElementById("img5");
	if (!checkNull(imgName5)) {
		   if(checkNull(img1)){
       	    alert("请先上传第一行图片");
           return false;
         }
          if(checkNull(img2)){
       	    alert("请先上传第二行图片");
           return false;
         }
          if(checkNull(img3)){
       	    alert("请先上传第三行图片");
           return false;
         }
          if(checkNull(img4)){
       	    alert("请先上传第四行图片");
           return false;
         }
		if (checkLength(imgName5, 40)) {
			alert("第五行图片名字长度应小于40");
			imgName5.focus();
			return false;
		}
		if (checkNull(img5)) {
			alert("请上传第五行图片");
			img5.focus();
			return false;
		}
		if (!checkImage(img5)) {
			alert('第五行图片上传格式不正确，应为 gif、png、jpg、jpeg、ico格式');
			img5.focus();
			return false;
		}
	}
	if (confirm("确认发布生意转让信息吗?"))
		return true;
	return false;

}
