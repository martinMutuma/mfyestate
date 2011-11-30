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
//------------------------------------
function IsCharAndNum(obj){
  var reg = /^\w+$/;
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
	var re = /\w+@\w+\.\w+/;
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
function validateMobie(ss){
    var re = /^(13[0-9]{9})|(18[0-9]{9})|(15[0-9]{9})$/
    if(re.test(ss)){
       return true;
     }else{
     	return false;
     }
}

// 邮件地址的验证（包含@和.）
function validateEmail(ss){
     var re = /\w@\w*\.\w/
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
// var r= /^13[012345789]{9}/ 以13开头的11位数,后9位不能出现数字6
