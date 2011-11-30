// JavaScript Document
//验证发送手机
function chk_tel() {
	if($("#userName01").val() == '') {
		$("#msg_01").html('');
		$("#msg_01").html('提示：请输入用户名！');
		$("#userName01").focus();
		return false;
	}
	if($("#tel").val() == '') {
		$("#msg_01").html('');
		$("#msg_01").html('提示：请输入手机号码！');
		$("#tel").focus();
		return false;
	}
	
	userName = loseblur('userName',$("#userName01").val(),'','searchUserName');
	if(userName == 'no') {
		$("#msg_01").html('');
		$("#msg_01").html('提示：该用户名不存在！');
		$("#userName01").focus();
		return false;
	}
	
	other = '&userName='+$("#userName01").val();
	tel = loseblur('tel',$("#tel").val(),other,'searchTel');
	if(tel == 'no') {
		$("#msg_01").html('');
		$("#msg_01").html('提示：该手机号码不存在！');
		$("#tel").focus();
		return false;
	}
	setPass('tel','01');
}

//验证发送邮箱
function chk_email() {
	if($("#userName02").val() == '') {
		$("#msg_02").html('');
		$("#msg_02").html('提示：请输入用户名！');
		$("#userName02").focus();
		return false;
	}
	if($("#email").val() == '') {
		$("#msg_02").html('');
		$("#msg_02").html('提示：请输入电子邮箱地址！');
		$("#email").focus();
		return false;
	}
	
	var url = basePath+"mem/baseinfo_checkUserNameIsExistMember.shtml?username="+$("#userName02").val();
	$.get(url,function(mes){
		if(mes=="1"){
			$("#msg_02").html('');
			$("#msg_02").html('提示：该用户名不存在！');
			$("#userName02").focus();
			return false;
		}else{
			var url = basePath+"mem/baseinfo_checkEmailIsExistMemberAndUseName.shtml?username="+$("#userName02").val()+"&email="+$("#email").val();
			$.get(url,function(mes){
				if(mes=="1"){
					$("#msg_02").html('');
					$("#msg_02").html('提示：该电子邮箱不存在！');
					$("#email").focus();
					return false;
				}else{
					findpass('email','02');
				}
			});
		}
	});
	
	
	/*
	userName = loseblur('userName',$("#userName02").val(),'','searchUserName');
	if(userName == 'no') {
		$("#msg_02").html('');
		$("#msg_02").html('提示：该用户名不存在！');
		$("#userName02").focus();
		return false;
	}
	
	
	
	other = '&userName='+$("#userName02").val();
	email = loseblur('email',$("#email").val(),other,'searchEmail');
	if(email == 'no') {
		$("#msg_02").html('');
		$("#msg_02").html('提示：该电子邮箱不存在！');
		$("#email").focus();
		return false;
	}*/
	
	
}

   function findpass(type,id){
  	 	$("#msg_"+id+"").html('');
		$("#msg_"+id+"").html('提示：发送中请稍后...');
		var username = $("#userName02").val();
		var email = $("#email").val();
		var url = basePath+"mem/baseinfo_getPass.shtml?username="+username+"&email="+email+"&time="+(new Date().getTime().toString(36));
		$.get(url,function(mes){
			if(mes=="1"){
				$.messager.alert('提示','发送成功','info',function(){
					$("#msg_"+id+"").html('');
					$("#msg_"+id+"").html('提示：发送成功');
				});
			}else{
				$.messager.alert('提示','发送失败','error',function(){
					$("#msg_"+id+"").html('');
					$("#msg_"+id+"").html('提示：发送失败');
				});
			}
		})
	}
	
//ajax同步检查数据的可存性
function loseblur(type,val,other,method) {
	$.ajax({type:'POST',
		url:basePath+"mem/baseinfo_checkUserNameIsExistMember.shtml?username="+$("#userName02").val(),
		data:type+'='+val+other,
		async:false,
		success:function(data){
			flag = data;
		}
	});
	return flag;
}

//ajax提交数据
function setPass(type,id){
	$("#msg_"+id+"").html('');
	$("#msg_"+id+"").html('提示：发送中请稍后...');
	$.ajax({type:'POST',
		url:'/index.php?g=Home&m=Finepass&a=setPass',
		data:'userName='+$("#userName"+id).val()+'&'+type+'='+$("#"+type).val()+'&flag='+$("#flag"+id).val(),
		async:true,
		success:function(data){
			flag = data;
	if(flag == 'success') {
		$("#msg_"+id+"").html('');
		alert('发送成功');
	} else if(flag == 'error') {
		$("#msg_"+id+"").html('');
		alert('发送失败，请稍后重试');	
	}	
		}
	});
}