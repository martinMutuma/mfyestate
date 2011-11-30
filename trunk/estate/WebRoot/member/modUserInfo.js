	$(function(){
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
  		$('#btn').linkbutton({
   			id:'ad',
   			disabled:false,
   			plain: false,
   			text:'注&nbsp;&nbsp;&nbsp;&nbsp;册',
   			iconCls:'icon-ok login_btn'
   		});
	  if($("#reLogin").val()=='0'){
	  		$.messager.show({
	   			showType:'slide',
	   			showSpeed:1000,
	   			width:300,
	   			height:150,
	   			msg:'旧密码错误',
	   			title:'密码修改失败',
	   			timeout:5000
	   		});
	  	}
	})
	
	$("#tbtype").focus();
  	$("#tipspan").hide();
  	$("#register_btn").hide();
    var isLogin="",isEmail="",isphone="";
    function checkAgent(me){
      var username=document.getElementById("username").value
      // alert(username)
      if(!checkNull(me)){
        _Alert(me,"请输入用户名");
        $("#username").css('background-color','#FFFFFF');
		document.getElementById("checkid").innerHTML="";
        return false;
      }else{
         if(!IsCharAndNum(me)){
	          _Alert(me,"输入用户名应为英文字母、数字");
	           return false;
         }else if(username.length>=5){
	         var url = basePath+"mem/baseinfo_checkUserNameIsExistMember.shtml?username="+username;
			 $.get(url,function(mes){
				if(mes=="0"){
					$("#username").css('background-color','#FF8080');
					document.getElementById("checkid1").innerHTML="";
					document.getElementById("checkid").innerHTML=username+"已经存在";
	           	    _Alert(me,"请重新输入用户名!");
	           	    isLogin=0;
	           	    return false;
				}else{
					$("#username").css('background-color','#FFFFFF');
					document.getElementById("checkid").innerHTML="";
					document.getElementById("checkid1").innerHTML="用户名可以注册";
	           	    isLogin=1;
				}
			})
            }
         }
     }

      function isEmails(email){
        //var reEmail = /^([A-Za-z0-9])(\w)+@(\w)+(\.)(com|com\.cn|net|cn|net\.cn|org|biz|info|gov|gov\.cn|edu|edu\.cn)/;
        var reEmail = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;   
        //var reEmail=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
        if (!email.match(reEmail)&&email!="")
        {
             return false;
        }
         return true;
      }

       function checkMail(me){
	       var email=document.getElementById("email").value
	       if(!checkNull(me)){
	          _Alert(me,"请输入电子邮箱");
	         return false;
	        }else if(!validateEmail(email)){
	        	$("#email").css('background-color','#FF8080');
	        	document.getElementById("mailid1").innerHTML="";
                document.getElementById("mailid").innerHTML="该Email格式不正确";
                isEmail=0;
                return false;
            }else{
	             $("#email").css('background-color','#FFFFFF');
	             var url = basePath+"mem/baseinfo_checkEmailIsExistMember.shtml?email="+email;
				 $.get(url,function(mes){
					if(mes=="0"){
		            		document.getElementById("mailid1").innerHTML="";
		            		document.getElementById("mailid").innerHTML="该Email已经存在";
		            	    _Alert(me,"请重新输入email!");
		            	    isEmail=0;
		                    return false;
		            	  }else{
		            		  document.getElementById("mailid").innerHTML="";
		            		  document.getElementById("mailid1").innerHTML="该Email可以使用";
		            	      isEmail=1;
		            	 }
				})
            }
         }

function checkPhone(me){
      var mobile=document.getElementById("mobile").value
      if(!checkNull(me)){
        _Alert(me,"请输入手机号码");
        return false;
      }else{
         if(!validateMobie(mobile)){
         	 isphone=0;
	         $("#mobile").css('background-color','#FF8080');
	         document.getElementById("phoneid").innerHTML="该手机号码格式不正确";
            _Alert(me,"输入手机格式不正确，请输入数字");
          return false;
         }else{
         $("#mobile").css('background-color','#FFFFFF');
            var url = basePath+"mem/baseinfo_checkMobileIsExistMember.shtml?mobile="+mobile;
			 $.get(url,function(mes){
				if(mes=="0"){
            		 document.getElementById("phoneid1").innerHTML="";
            		 document.getElementById("phoneid").innerHTML="该手机号码已经存在!";
            	      _Alert(me,"请重新输入手机号码!");
            	      isphone=0;
            	      return false;
            	  }else{
            		  document.getElementById("phoneid").innerHTML="";
            		  document.getElementById("phoneid1").innerHTML="该手机号码可以使用";
            	      isphone=1;
            	    }
			})
            }
         }
     }
      	function oncheck(type,value){
  		if(type=='1'){
	  		if('<s:property value="tb.email"/>'!=value){
				document.getElementById('editEmail').style.display='block';
			}else{
				if(document.getElementById("mailid").innerHTML!=''||document.getElementById("mailid1").innerHTML!='')
					 isEmail=1;
				$("#email").css('background-color','#FFFFFF');
				document.getElementById("mailid").innerHTML="";
				document.getElementById("mailid1").innerHTML="";
				document.getElementById('editEmail').style.display='none';
			}
		}else if(type=='2'){
			if('<s:property value="tb.mobile"/>'!=value){
				document.getElementById('editPhone').style.display='block';
			}else{
			if(document.getElementById("phoneid").innerHTML!=''||document.getElementById("phoneid").innerHTML!='')
					 isphone=1;
				$("#mobile").css('background-color','#FFFFFF');
				document.getElementById("phoneid").innerHTML="";
				document.getElementById("phoneid1").innerHTML="";
				document.getElementById('editPhone').style.display='none';
			}
		}
	}
  function checkform(){
      if(isEmail=="0"){
    	 _Alert($("#email"),"请重新输入电子邮箱!");
    	  return false;
    	}
        if(isphone=="0"){
    	 _Alert($("#mobile"),"请重新输入手机!");
    	 return false;
    	}
    document.sysAgentBean.submit();
    return true;
  }