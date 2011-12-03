$(function(){
	// $("#tbtype").focus();
  	$("#tipspan").hide();
  	$("#register_btn").hide();
	$("#discode").combotree({
		    url:'',
		    animate:true,
		    onShowPanel:function(){
		    	var dataUrl = basePath+'district/bulidDistrictTree.shtml?level=5&districtCode=0000000000&t='+(new Date()).getTime().toString(36);
		    	if($("#discode").combotree("options").url==""){
		    		$.messager.show({
			   			showType:null,
			   			showSpeed:1000,
			   			width:150,
			   			height:70,
			   			msg:'地区信息加载中... ...',
			   			title:'提示',
			   			timeout:2000
			   		});
		    		$("#discode").combotree("options").url=dataUrl;
			    	$.get(dataUrl,function(data){
						var json = "";
						try{
							json = eval('('+data+')');
						}catch(e){
							json = data;
						}
						$("#discode").combotree("loadData",json);
			    	})
		    	}
		    },
		   	onLoadSuccess:function(){
		   	if($("#discode").combotree("options").url!="")
		   		$.messager.show({
		   			showType:'slide',
		   			showSpeed:1000,
		   			width:150,
		   			height:70,
		   			msg:'地区信息加载完成',
		   			title:'提示',
		   			timeout:3000
		   		})
		   	},onClick:function(node){
		   		$("#disname").val(node.text)
		   	}
		});
		$('#btn').linkbutton({
   			id:'ad',
   			disabled:false,
   			plain: false,
   			text:'注&nbsp;&nbsp;&nbsp;&nbsp;册',
   			iconCls:'icon-ok login_btn'
   		});
   		if(document.getElementById("#imgchk")!=null){
			$("#imgchk").tip({height:'20px',width:'80px'},"<font style='color:black;' size='2px'>请输入验证码</font>","1");
   		}
   		
})
var isLogin="",isEmail="",isphone="";
    
    function checkUsername(me){
      var username = document.getElementById("username").value
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
	         var url = basePath+'mem/baseinfo_checkUserNameIsExistMember.shtml?username='+username;
			 $.get(url,function(mes){
				if(mes=="0"){
					$("#username").css('background-color','#FF8080');
					document.getElementById("checkid1").innerHTML="";
					document.getElementById("checkid").innerHTML=" 该用户名已经存在";
	           	    _Alert(me,"请重新输入用户名!");
	           	    isLogin=0;
	           	    return false;
				}else{
					$("#username").css('background-color','#FFFFFF');
					document.getElementById("checkid").innerHTML="";
					document.getElementById("checkid1").innerHTML=" 可以注册";
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
	       var email=document.getElementById("email").value;
	       if(!checkNull(me)){
	          _Alert(me,"请输入电子邮箱");
	         return false;
	        }else if(!validateEmail(email)){
	        	$("#email").css('background-color','#FF8080');
	        	document.getElementById("mailid1").innerHTML="";
                document.getElementById("mailid").innerHTML = " E-mail格式不正确";
                isEmail=0;
                return false;
            }else{
             $("#email").css('background-color','#FFFFFF');
             var url = basePath+'mem/baseinfo_checkEmailIsExistMember.shtml?email='+email;
			 $.get(url,function(mes){
				if(mes=="0"){
	            		document.getElementById("mailid1").innerHTML="";
	            		document.getElementById("mailid").innerHTML = " 该E-mail已经存在";
	            	    _Alert(me,"请重新输入email!");
	            	    isEmail=0;
	                    return false;
	            	  }else{
	            		  document.getElementById("mailid").innerHTML="";
	            		  document.getElementById("mailid1").innerHTML=" 可以注册";
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
	         document.getElementById("phoneid1").innerHTML="";
	         document.getElementById("phoneid").innerHTML = " 手机号码格式不正确";
            _Alert(me,"输入手机号码格式不正确，请输入数字");
          return false;
         }else{
         $("#mobile").css('background-color','#FFFFFF');
            var url = basePath+'mem/baseinfo_checkMobileIsExistMember.shtml?mobile='+mobile;
			 $.get(url,function(mes){
				if(mes=="0"){
            		 document.getElementById("phoneid1").innerHTML="";
            		 document.getElementById("phoneid").innerHTML = " 该手机号码已经存在!";
            	      _Alert(me,"请重新输入手机号码!");
            	      isphone=0;
            	      return false;
            	  }else{
            		  document.getElementById("phoneid").innerHTML="";
            		  document.getElementById("phoneid1").innerHTML=" 可以注册";
            	      isphone=1;
            	    }
			})
            }
         }
     }
     
     function rundiv(){
		var s = document.getElementById("dd");
		if(s.innerHTML == 0){
			goMainPage();
			// window.location.href='http://localhost:8080/estate/member/register.jsp';
			return false;
		}
		s.innerHTML = s.innerHTML  - 1;
	}

	function goDoFullInfoPage(){
		window.location.href=basePath+"mem/baseinfo_modUserInfoPage.shtml";
	}
	
	function goMainPage(){
		window.location.href=basePath+"mem/baseinfo_mainPage.shtml?type=main";
	}
	
	
    
   function checkUser(userName){
      var names = userName.value;
      var Expression=/^([\u4E00-\u9FA5]|[\uFE30-\uFFA0])*$/;
      var objExp=new RegExp(Expression);
      if(objExp.test(names)==true){
         return true;   
      }else{
         return false; 
      }
	}
function showdiv(tag){
 var light=document.getElementById(tag);
 var fade=document.getElementById('fade');
 light.style.display='block';
 fade.style.display='block';
 }
function hidediv(tag){
 var light=document.getElementById(tag);
 var fade=document.getElementById('fade');
 light.style.display='none';
 fade.style.display='none';
}
  function checkform(){
      var tbtype=document.sysAgentBean.tbtype;
      var tbsex=document.sysAgentBean.tbsex;
      var discode=$("#discode");
      var username = document.sysAgentBean.username;
      var password = document.sysAgentBean.password;
      var repwd = document.sysAgentBean.repassword;
      var email = document.sysAgentBean.email;
      var realName = document.sysAgentBean.realName;
    
      var mobile = document.sysAgentBean.mobile;
      var ck_ok = document.sysAgentBean.ck_ok;
      var company=document.sysAgentBean.company;
      var imgchk=document.sysAgentBean.imgchk;
      var groups = ["300","700","900","1100"];
      
      if(!checkNull(tbtype)){
         _Alert(tbtype,"请选择会员类别。");
         return false;
      }
      
      if(!checkNull(tbsex)){
         _Alert(tbsex,"请选择会员性别。");
         return false;
      }
      
      if(discode.combotree('getValue').trim().length==0){
      _Alert(discode,"请选择地区。");
         return false;
      }
	
     if(!checkNull(username)){
       _Alert(username,"请输入用户名。");
         return false;
      } else{
          if(!IsCharAndNum(username)){
          $.messager.alert('警告','输入用户名应为英文字母、数字。','error',function(){
				})
	          _Alert(username,"输入用户名应为英文字母、数字。");
	          return false;
         }else{
            if(username.value.length<5){
	             _Alert(username,"输入用户名最短为5位。");
	             return false;
             }
         }
      }
      
    if(isLogin=="0"){
		 _Alert(username,"请输入用户名 !");
		 return false;
    }
    if(!checkNull(password)){
      _Alert(password,"请输入用户密码。");
      return false;
    }else{
       if(password.value.length<6){
	      _Alert(password,"输入用户密码长度最小为6位。");
	      return false;
       }
    }

    if(!checkNull(repwd)){
      _Alert(repwd,"请输入确认密码。");
      return false;
    }else{
      if(password.value!=repwd.value){
      document.getElementById("repasswordid").innerHTML='两次密码不一致';
	      _Alert(repwd,"确认密码输入不正确。");
	      return false;
       }else{
       	 document.getElementById("repasswordid").innerHTML=' ';
       }
    }
    
	if(!checkNull(realName)){
       _Alert(realName,"请输入真实姓名。");
       return false;
    }else if(!checkUser(realName)){
    	realName.value='';
        _Alert(realName,"姓名必须为中文!");
       return false;
    }

    if(!checkNull(email)){
      _Alert(email,"请输入电子邮箱。");
      return false;
    }else{
      if(!validateEmail(email.value)){
          _Alert(email,"输入电子邮箱格式不正确");
          return false;
         }
     }
     
    if(isEmail=="0"){
    	 _Alert(email,"请重新输入电子邮箱!");
    	  return false;
    }
    
      
    if(!checkNull(mobile)){
      _Alert(mobile,"请输入手机号码。");
      return false;
    }else{
      if(!validateMobie(mobile.value)){
          _Alert(mobile,"输入手机格式不正确，请输入数字");
          return false;
         }
     }
     
    if(isphone=="0"){
    	 _Alert(mobile,"请重新输入手机!");
    	 return false;
    }
    if(!checkNull(imgchk)){
      _Alert(imgchk,"请输入校验码。");
      return false;
    }
    if(!ck_ok.checked){
      $.messager.alert('提示','必须接受《用户服务协议》才可以注册','warning',function(){})
      return false;
    }
     document.sysAgentBean.submit();
     showdiv('light');
   	 window.setInterval("rundiv();", 1000);
     $("#regi").css("display","none");
     $("#skip").show();
   //  document.sysAgentBean.target="test";
    return true;
}
    function checkUsere(userName){
	       if(!checkUser(userName)){
	          _Alert(userName,"姓名必须为中文!");
	          return false;
	       }
    }
function fail(){
	$.messager.alert('警告','验证码错误','error',function(){})
}
function chechrepass(repass){
	 if(document.sysAgentBean.password.value!=repass.value){
      	  document.getElementById("repasswordid").innerHTML='两次密码不一致';
	      _Alert(repass,"确认密码输入不正确。");
	      return false;
       }else{
       	  document.getElementById("repasswordid").innerHTML=' ';
       }
}
//检查密码安全性
        var PasswordStrength ={
            Level : ["差","中","强"],
            LevelValue : [0,20,30],//强度值
            Factor : [1,2,5],//字符加数,分别为字母，数字，其它
            KindFactor : [0,0,10,20],//密码含几种组成的加数 
            Regex : [/[a-zA-Z]/g,/\d/g,/[^a-zA-Z0-9]/g], //字符正则数字正则其它正则
			Color : ["#FF4545","#FFD35E","#95EB81"]
            }
		PasswordStrength.init = function(pwd){
			var div = "";
            for(var i = 0 ; i < this.LevelValue.length ; i ++){
			     div +="<div id='"+i+"' style='position:absolute;display:none;width:4px;height:2px;border:1px solid #0000;background:#BEBEBE;' title='密码安全性'></div>";
			}
		    document.write(div);
		}
        PasswordStrength.StrengthValue = function(pwd){
            var strengthValue = 0;
            var ComposedKind = 0;
            for(var i = 0 ; i < this.Regex.length;i++)
            {
                var chars = pwd.match(this.Regex[i]);
                if(chars != null)
                {
                    strengthValue += chars.length * this.Factor[i];
                    ComposedKind ++;
                }
            }
            strengthValue += this.KindFactor[ComposedKind];
            return strengthValue;
        } 
        PasswordStrength.StrengthLevel = function(event){
			var ev = event||window.event;
			var obj = ev.target||ev.srcElement;
			//alert(this);
			//alert(this.StrengthValue(obj.value));
            var value = this.StrengthValue(obj.value);
            for(var i = 0 ; i < this.LevelValue.length ; i ++)
            {
                if(value >= this.LevelValue[i] )
					this.showStrength(obj,this.Level[i],i);
            }
        }
		PasswordStrength.showStrength = function(obj,label,level){
           for(var i = 0 ; i < this.LevelValue.length ; i ++){
		      var el = document.getElementById(""+i);
			  el.style.display = "none";
		   }
		   //
		   var el = null;
		   var pwd = obj.getBoundingClientRect(); 
		   var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop);         
		   var scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft); 
		   var divTop = pwd.top + scrollTop;
		   var divLeft = pwd.left + scrollLeft + obj.offsetWidth;//
		   for(var i=0;i<=level;i++){
				el = document.getElementById(""+i);
				el.title = "密码安全性";
				el.style.top = divTop-1;
				el.style.left = divLeft+i*6;
				el.style.height = 4;
				el.style.background = this.Color[level];
				el.title=el.title+":"+label;
				el.style.display = "block"; 
		   }
        }
//大写锁定键检查
        var CapsLockDetect ={
            }
		CapsLockDetect.detectCapsLock = function(event){
				var e = event||window.event;
				var o = e.target||e.srcElement;
				var oTip =  document.getElementById("tip");
				oTip.innerHTML='&nbsp;<img src="/website/images/question.gif">&nbsp;<b>大写锁定打开！</b><br>&nbsp;保持大写锁定打开可能会使您错误输入密码。<br>&nbsp;在输入密码前，您应该按"Caps Lock"键来将其<br>&nbsp;关闭。';
				var keyCode  =  e.keyCode||e.which; // 获取按键的keyCode
				var isShift  =  e.shiftKey ||(keyCode  ==   16 ) || false ; // 判断shift键是否按住
				if (((keyCode >=   65   &&  keyCode  <=   90 )  &&   !isShift)|| ((keyCode >=   97   &&  keyCode  <=   122 )  &&  isShift)){
					var box = o.getBoundingClientRect(); 
					var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop);         
					var scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft);  
					oTip.style.top = box.top + scrollTop - 2;
					oTip.style.left = box.left + scrollLeft + o.offsetWidth;
					oTip.style.display = 'block';
				}
				else{
					oTip.style.display  =  'none';
				}
			}
		CapsLockDetect.init = function(event){
			var div = "<div id='tip' style='position:absolute;display:none;background:#F0F7EF;width:255px;border:1px solid #000;color:#ffff;text-align:left;font-size:12;' onclick=\"javascript:this.style.display = 'none'\";></div>";
		    document.write(div);
		}
		CapsLockDetect.closeMsg = function(event){
			var oTip =  document.getElementById("tip");
			oTip.style.display  =  'none';
		}
		
		
//----------------------------------------------------------------------------
//字符串相关函数
//--------------------------------------
//字符创新增trim方法
//" sdfd sdf "返回值"sdfd sdf"
//--------------------------------------
String.prototype.trim = function(){
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
function sTrim(str){
	return str.replace(/(^\s*)|(\s*$)/g, "");
}
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
 
//--------------------------------------
//检查字符串是否为null
//obj:检查的对象
//返回值:不为空返回true
//--------------------------------------
function checkNull(obj){
 if(obj.value.trim().length==0)
	 return false;
 else
	 return true;
}
//--------------------------------------
//检查字符串大于指定长度
//obj:检查的对象
//len:指定长度
//返回值:小于指定长度返回true
//--------------------------------------
function checkLength(obj,len){
	 if(obj.value.length>len)
		 return false;
	 else
	     return true;
}
//------------------------------------
//得到字符串的字节长度
//------------------------------------
function unicodeLength(str){
	return (new String(str)).unicodeLength();
}
String.prototype.unicodeLength=function(){
	var l=0;
	for(var i=0;i<this.length;i++){
		if(this.charCodeAt(i)>255)l+=3;
		else l++;
	}
	return l;
}
//------------------------------------
//得到字符串是否为英文字符和数字
//用户名只包含大小写英文、数字和下划线。同时用户名长度在6-15之间
//------------------------------------
function IsCharAndNum(obj){
   		var reg=/^[0-9A-Za-z_]{5,15}$/;
	  if(reg.test(obj.value)){
			return true;
	  }else{
			return false;
	  }
	}
//数字相关函数
//------------------------------------
//检查是否为任意数（实数）
//------------------------------------
function isNumeric(obj) {
	var reg=/^(-|\+)?\d+(\.\d+)?$/
	if(reg.test(obj.value)){
		return true;
	}else{
		return false;
	}
}
//------------------------------------
//检查是否为正数
//------------------------------------
function isUnsignedNumeric(obj) {
	var reg=/^\d+(\.\d+)?$/
	if(reg.test(obj.value)){
		return true;
	}else{
		return false;
	}
}
//------------------------------------
//检查是否为整数
//------------------------------------
function isInteger(obj) {
	var reg=/^(-|\+)?\d+$/
	if(reg.test(obj.value)){
		return true;
	}else{
		return false;
	}
}
//------------------------------------
//检查是否为正整数
//------------------------------------
function isUnsignedInteger(obj) {
	var reg=/^\d+$/
	if(reg.test(obj.value)){
		return true;
	}else{
		return false;
	}
}
//------------------------------------
//数字判断函数
//------------------------------------
function isNumber(str) 
{
	var digits = "0123456789";
	var i = 0;
	if(str==null) return false;
	var sLength = str.length;
    if(sLength==0)  return false;
	while ((i < sLength))
	{
	var c = str.charAt(i);
	if (digits.indexOf(c) == -1) return false;
	i++;
	}
	return true;
}
//------------------------------------
//判断是否为合法的数值函数
//------------------------------------
function isValidDouble(str) 
{
	var digits = ".0123456789";
	var i = 0;
	if(str==null) return false;
	var sLength = str.length;	
    if(sLength==0)  return false;
	while (i < sLength)
	{
	var c = str.charAt(i);
	if (digits.indexOf(c) == -1) return false;
	i++;
	}
	return true;
}

//时间日期相关的函数
//------------------------------------
//判断是否为合法的小时
//------------------------------------
function isValidHour(str) {
  var hour;
  if(!isNumber(str)) {
     return false;
  }
  hour=parseInt(str,10);
  if(hour>23 || hour<0) {
     return false; 
  }
  return true;
}
//------------------------------------
//判断是否为合法的分钟
//------------------------------------
function isValidMinute(str) {
  var minute;
  if(!isNumber(str)) {
     return false;
  }
  minute=parseInt(str,10);  
  //alert(minute);
  if(minute>59 || minute<0) {
     return false; 
  }  
   return true;
}
//------------------------------------
//判断是否为合法的月份
//------------------------------------
function isValidMonth(str) {
  var month;
  if(!isNumber(str)) {    
     return false;
  }
  month=parseInt(str,10);
  if(month>12 || month<1) {
     return false; 
  }
   return true;
}
//------------------------------------
//判断输入年月是否小于当前年月
//------------------------------------
function isBeforeCurrDate(year,month) {
   var gNow = new Date();
   var vNowMonth = gNow.getMonth()+1;
   var vNowYear = gNow.getFullYear();
   if(!isNumber(year)|| !isValidMonth(month)) {
       alert("所输入年月必须为数字");
       return false;
   }
   if(vNowYear<=parseInt(year,10)) {      
   		if(vNowYear==parseInt(year,10)) {   				
        	if(vNowMonth>parseInt(month,10)) {
       			return false;
        	}else return true;
  		}else return true;
   }
   else return false;
}
//------------------------------------
//判断是否合法日期 xxxx-xx-xx
//------------------------------------
function isValidDate(theDate) {
  var reg = /^\d{4}-((0{0,1}[1-9]{1})|(1[0-2]{1}))-((0{0,1}[1-9]{1})|([1-2]{1}[0-9]{1})|(3[0-1]{1}))$/;  
  var result=true;
  if(!reg.test(theDate))
    result = false;
  else{
    var arr_hd=theDate.split("-");
    var dateTmp;
    dateTmp= new Date(arr_hd[0],parseFloat(arr_hd[1])-1,parseFloat(arr_hd[2]));
    if(dateTmp.getFullYear()!=parseFloat(arr_hd[0])|| dateTmp.getMonth()!=parseFloat(arr_hd[1]) -1 || dateTmp.getDate()!=parseFloat(arr_hd[2])){
        result = false
    }
  }
  return result;
}
//----------------------------------
//判断两个日期的大小,日期格式 yyyy-MM-dd
//cmp gt 大于,lt 小于 //ne 不等于,eq 等于,le 小于等于,ge 大于等于
//date1:日期1
//date2:日期2
//return:
//----------------------------------
function cmpDate(date1,date2){
  var dt1 =  new Date(date1.replace(/-/g,"\/"));
  var dt2 =  new Date(date2.replace(/-/g,"\/"));
  if(dt1.getTime()>=dt2.getTime()){
    return true;
  }
  else{
    return false;
  }
}
//
//中文相关的函数
//------------------------------------
//判断是否中文函数
//------------------------------------
function ischinese(str){
	var ret=true;
	for(var i=0;i<str.length;i++)
	ret=ret && (str.charCodeAt(i)>=10000);
	return ret;
}
//------------------------------------
//返回该字符中是否含有中文
//------------------------------------
function hasChinese(str){
	return (new String(str)).hasChinese();
}
String.prototype.hasChinese=function(){
	var s=escape(this);
	return (s.indexOf("%u")!=-1);
}
//其他函数
//------------------------------------
//验证E-MAIL格式函数
//------------------------------------
function isemail(email){
	var re = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	if (re.test(email))
	   return true;
	else
	   return false;
}
function checkNull(str){
if(str==''||str==null)
 return false;
else if(str.value.trim().length==0)
	 return false;
 else
	 return true;
}
function _Alert(theText,notice){
   // alert(notice);
   theText.focus();
//   theText.select();
}
/*换验证码*/
 function  changePicture(){
     document.getElementById("pic").src="yanzhengma.jsp?date="+new Date();
}
// 手机号码的验证（13开头和15开头和18开头，共11位）
function validateMobie(mobile){
    // var re = /^(13[0-9]{9})|(18[0-9]{9})|(15[0-9]{9})$/;
   if (mobile != ""){      
		var reg0 = /^13\d{9}$/;   
		var reg1 = /^153\d{8}$/;   
		var reg2 = /^159\d{8}$/;   
		var reg3 = /^16\d{9}$/; 
		var reg4 = /^150\d{8}$/;
		var reg5 = /^158\d{8}$/;
		var reg6 = /^15\d{9}$/;
		var reg7 = /^18\d{9}$/; 
		var my = false;   
		if (reg0.test(mobile))my=true;   
		if (reg1.test(mobile))my=true;   
		if (reg2.test(mobile))my=true;   
		if (reg3.test(mobile))my=true; 
		if (reg4.test(mobile))my=true;   
		if (reg5.test(mobile))my=true;   
		if (reg6.test(mobile))my=true;
		if (reg7.test(mobile))my=true;
		if (!my){ 
			return false;   
		}   
		return true;   
	}
}

// 邮件地址的验证（包含@和.）
function validateEmail(ss){
     // var re = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
     var re = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
     if(re.test(ss)){
         return true;
      }else{
      	return false;
      }
}
 //  邮政编码的验证（开头不能为0，共6位）
function validatePostcode(ss){
      var re= /^[1-9][0-9]{5}$/
      if(re.test(ss)){
         return true;
      }else{
      	return false;
      }
}
//验证中文
function checkUser(userName){
      var names = userName.value;
      // ^[u4e00-u9fa5],{0,}$ |^[u4e00-u9fa5]+$
      var Expression=/^([\u4E00-\u9FA5]|[\uFE30-\uFFA0])*$/;
      var objExp=new RegExp(Expression);
      //objExp.test(names)==true
      //alert(objExp.test(names));
     if(objExp.test(names)==true){
         return true;   
     }else{
         return false; 
     }
} 
// var r= /^13[012345789]{9}/ 以13开头的11位数,后9位不能出现数字6
