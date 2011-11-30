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
$(function () {
	$("#tel").focus(function () {
		$("#ndErrorTelTip").html("*");
	});
	$("#name").focus(function () {
		$("#ndErrorNameTip").html("*");
	});
	document.forms["form1"].reset();
	$("#name").val("");
	$("#tel").val("");
	$("#otherDemand").val("");
	$("#needCityTips").hide();
	$("#needPreferenceTips").hide();
	$("input[type=checkbox][name=city]").click(function () {
		$("#needCityTips").hide();
		$("#needPreferenceTips").hide();
	});
	$("input[type=checkbox][name=preference]").click(function () {
		$("#needCityTips").hide();
		$("#needPreferenceTips").hide();
	});
});
function getNameValue(name) {
	var data = document.getElementsByName(name);
	var str = "";
	for (var i = 0; i < data.length; i++) {
		if (data[i].checked) {
			str = str + data[i].value + ",";
		}
	}
	return str;
}
function GetRadioValue(RadioName) {
	var obj;
	obj = document.getElementsByName(RadioName);
	if (obj != null) {
		for (var i = 0; i < obj.length; i++) {
			if (obj[i].checked) {
				return obj[i].value;
			}
		}
	}
	return "";
}
function setSave() {
	var cityValue = getNameValue("needObj.city");
	if (cityValue == "") {
		$("#needCityTips").show();
		return;
	}
	var pianhao = getNameValue("needObj.preference");
	if (pianhao == "") {
		$("#needPreferenceTips").show();
		return;
	}
	var mudi = getNameValue("needObj.purpose");
	cityValue = cityValue.substring(0, cityValue.length - 1);
	pianhao = pianhao.substring(0, pianhao.length - 1);
	mudi = mudi.substring(0, mudi.length - 1);
	var radioValue = "";
	var areaValue = $("#needObj.area").val();
	var TotalPriceValue = $("#needObj.totalPrice").val();
	radioValue = GetRadioValue("needObj.needRoom");
	if (userId != "") {
		$("#ndName_0").hide();
		$("#ndName_1").show();
		$("#ndTel_0").hide();
		$("#ndTel_1").show();
		$("#ndSex_0").hide();
		$("#ndSex_1").show();
	} else {
		$("#ndName_0").show();
		$("#ndName_1").hide();
		$("#ndTel_0").show();
		$("#ndTel_1").hide();
		$("#ndSex_0").show();
		$("#ndSex_1").hide();
	}
	$("#ndSecond").show();
	$("#ndFirst").hide();
	// document.form1.submit();
/*	alert("city:" + cityValue + " love:" + pianhao + "  purpose:" + mudi + "  room:" + radioValue + "  area:" + areaValue + "   totalPrice:" + TotalPriceValue);
	var url = basePath + "building/save.shtml";
	$.get(url, {city:cityValue, love:pianhao, purpose:mudi, room:radioValue, area:areaValue, totalPrice:TotalPriceValue}, function (data) {
		if (data != "") {
			if (data != "0") {
				var userArr = new Array();
				userArr = data.split(",");
				$("#name").val(userArr[0]);
				$("#ndName_1").html(userArr[0] + " <a href='javascript:void(0)' onclick=\"$('#ndName_1').hide();$('#ndName_0').show();\">\u4fee\u6539</a>");
				if (userArr[0] == "") {
					$("#ndName_0").show();
					$("#ndName_1").hide();
				}
				$("#tel").val(userArr[1]);
				$("#ndTel_1").html(userArr[1] + " <a href='javascript:void(0)' onclick=\"$('#ndTel_1').hide();$('#ndTel_0').show();\">\u4fee\u6539</a>");
				var isex = parseInt(userArr[2]);
				$("input[type=radio][name=sex][value=" + isex + "]").attr("checked", "checked");
				userId = userArr[3];
			}
		}
	});
	*/
}

//关闭按钮
function ndCloseDiv(id) {
	$("#ndFirst").show();
	$("#" + id).hide();
	//document.forms['form1'].reset();
	$("#name").val("");
	$("#tel").val("");
	$("#otherDemand").val("");
}
function addUserDiv(id) {
	$("#ndSecond").show();
	$("#" + id).hide();
}
function addUserInfo(name, tel, otherDemand) {
	//document.form1.submit();
	var sex = GetRadioValue("sex");
	if(null==userId){
		if (name == "") {
			$("#needNameTips").show();
			return;
		}
		 if (tel == "") {
			$("#needPhoneTips").show();
			return;
		}else {
			var reg = /^13[0-9]{1}[0-9]{8}$|15[0189]{1}[0-9]{8}$|18[0-9]{1}[0-9]{8}|152[0-9]{8}$/;
			if (tel == "") {
				$("#ndErrorTelTip").html("\u5982\u4f55\u8054\u7cfb\u60a8\u5462\uff1f");
				return;
			}
			if (!reg.test(tel)) {
				$("#ndErrorTelTip").html("\u60a8\u7684\u624b\u673a\u53f7\u7801\u4e0d\u5bf9\u54e6\uff1f");
				return;
			}
			if (!AjaxCheckTel(tel)) {
				return;
			}
			if ($("#name").val() == "") {
				$("#ndErrorNameTip").html("\u60a8\u600e\u4e48\u79f0\u547c\u5462\uff1f");
				return;
			}
		}
	}
/*	var url = "/index.php?m=Buildinginfo&a=addUserInfo";
	$.post(url, {name:name, tel:tel, otherDemand:otherDemand, sex:sex}, function (data) {
		var arr = new Array();
		arr = data.split(",");
		switch (arr[0]) {
		  case "0":
			alert("\u4fe1\u606f\u63d0\u4ea4\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u5728\u8bd5\uff01");
			break;
		  case "1":
			$("#ndSecond").hide();
			if (arr[1] != 1) {
				$("#fsub_psw").html(arr[1]);
				$("#ndFour").show();
			} else {
				$("#ndThreed").show();
			}
			break;
		}
	});
	*/
	$("#ndSecond").hide();
	$("#ndThreed").show();
	document.form1.target="test";
	document.form1.submit();
}
function AjaxCheckTel(temp) {
	if (temp != "") {
		var reg = /^13[0-9]{1}[0-9]{8}$|15[0189]{1}[0-9]{8}$|18[0-9]{1}[0-9]{8}|152[0-9]{8}$/;
		if (!reg.test(temp)) {
			$("#ndErrorTelTip").html("\u60a8\u7684\u624b\u673a\u53f7\u7801\u4e0d\u5bf9\u54e6\uff01");
			return;
		}
	} else {
		return;
	}
	var reVal = true;
	var url = "/index.php?m=Buildinginfo&a=AjaxCheckUser";
	$.get(url, {temp:temp}, function (data) {
		switch (data) {
		  case "0":
			break;
		  case "1":
			$("#ndErrorTelTip").html("\u8be5\u624b\u673a\u53f7\u5df2\u88ab\u4f7f\u7528\uff0c\u60a8\u65e0\u6cd5\u4f7f\u7528\u3002");
			$("#tel").val("");
			reVal = false;
			break;
		  case "2":
			$("#ndErrorTelTip").html("\u60a8\u5c1a\u672a\u767b\u5f55\uff0c\u8be5\u624b\u673a\u53f7\u5df2\u88ab\u4f7f\u7528\uff0c\u60a8\u65e0\u6cd5\u4f7f\u7528");
			$("#tel").val("");
			reVal = false;
			break;
		}
	});
	return reVal;
}
//留言
function  checkMessage(){
     var data;
     var message=document.getElementById("content");
     if(checkNull(message)){
     $.messager.alert('警告','留言内容为空','info',function(){   
                    message.focus();   
                   	})
			 return;		
					}
	if(checkLength(message,600)){
	        $.messager.alert('警告','留言内容最大长度为600','info',function(){   
                    message.focus();   
                   
					})
		 return;
	 }
	 data="content="+message.value;
	if(userId==""){
	      var  loginname=document.getElementById("loginname");
	      if(checkNull(loginname)){
            $.messager.alert('警告','账号为空','info',function(){   
                    loginname.focus();   
                   })
					 return;	}
		   if(checkLength(loginname,15)){
            $.messager.alert('警告','账号长度为15','info',function(){   
                    loginname.focus();   
                   })
					 return;} 
		    var loginpass=document.getElementById('loginpass'); 
            if(checkNull(loginpass)){
            $.messager.alert('警告','密码为空','info',function(){   
                    loginpass.focus();   
                   })
					 return;	}
		   if(checkLength(loginpass,15)){
            $.messager.alert('警告','账号长度为16','info',function(){   
                    loginPass.focus();   
                   })
					 return;}
		     data+="&username="+loginname.value+"&password="+loginpass.value;  
        }else{
             data+="&username="+username ;
        }
        var  yan=document.getElementById("verify");
        if(checkNull(yan)){
           $.messager.alert('警告','验证码为空','info',function(){   
                     yan.focus();   
                   })
					 return;	
          }
            data+="&rand="+yan.value;
          var checkboxNm=document.getElementById("checkboxNm");
            if(!checkboxNm.checked)checkboxNm.value=0;
             data+="&checkboxNum="+checkboxNm.value;
            $.ajax({
              url:basePath+"tpMessage/addMessage.shtml",
              data:encodeURI(encodeURI(data)),
              method:"post",
              dataType:'text',
              cache:false,
              success:function (msg){
                     if(msg==1){
                          $.messager.alert('警告','用户名或密码错误','info',function(){   
                         })
					 return;	
                      }
                     if(msg==2){
                               $.messager.alert('警告','验证码错误','info',function(){   
                           })
					      return;
                      }
                       if(msg==3){
                               $.messager.alert('警告','留言成功','info',function(){
                                     if(userId==""){   
                                      loginname.value="";
                                      loginpass.value="";}
                                      message.value="";
                                      yan.value="";
                             })
					      return;
                      }
                         if(msg==4){
                               $.messager.alert('警告','留言失败','info',function(){   
                           })
					      return;
                      }
                   }
              });          
	 		
}