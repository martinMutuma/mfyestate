 if(document.getElementById("codeFlag").value=="2"){
    alert("你的投诉或意见已经受理，我们将尽快给您答复，谢谢!");
 }else if(document.getElementById("codeFlag").value=="1"){
 document.getElementById("imgchk").focus(); 
 alert("验证码不正确，请重新输入！");
 }
 
 
 function  changePicture(){
     document.getElementById("pic").src="../member/yanzhengma.jsp?date="+new Date();
}
function validateMobie(ss){
    var re = /^(13[0-9]{9})|(18[0-9]{9})|(15[0-9]{9})$/
    if(re.test(ss)){
       return true;
     }else{
             return false;
     }
}

function validateEmail(ss){
     var re = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/
     if(re.test(ss)){
         return true;
      }else{
      	return false;
      }
}

String.prototype.trim = function(){
    return this.replace(/(^\s*)|(\s*$)/g, "");
}

function checkNull(str){
if(str==''||str==null)
 return false;
else if(str.trim().length==0)
	 return false;
 else
	 return true;
}

function checkform(){
    if(!checkNull(document.getElementById("title").value)){
      alert("主题不能为空！");
      return false;
    }
    if(checkNull(document.getElementById("tel").value)&&!validateMobie(document.getElementById("tel").value)){
      alert("手机号码不正确，请重新输入！");
      return false;
    }if(checkNull(document.getElementById("email").value)&&!validateEmail(document.getElementById("email").value)){
      alert("邮箱格式不正确，请重新输入！");
      return false;
    }if(!checkNull(document.getElementById("content").value)){
      alert("投诉或建议的内容不能为空！");
      return false;
    }
    return true;
}

function fail(){
  alert("验证码不正确");
}
