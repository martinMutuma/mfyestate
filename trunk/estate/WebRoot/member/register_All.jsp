<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户信息完善</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/icon.css">
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>resource/js/jquery.tip.js"></script>
	<script type="text/javascript" src="<%=basePath %>member/register.js" charset="utf-8"></script>
	  <script type="text/javascript" src="../resource/js/whole.js"></script>
	    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
  </head>
 <STYLE type="text/css">
 html,body,div,span,td,font{
			font-family: Helvetica,Arial,sans-serif;
			font-size:12px;
			color: black;
			font-style:normal;
			font-variant:normal;
			font-weight:normal;	
			line-height:normal;
		}
 </STYLE>
  <script LANGUAGE="JavaScript">
  	$("#tbtype").focus();
  	$("#logo_span").hide();
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
	         var url = "<%=basePath%>mem/baseinfo_checkUserNameIsExistMember.shtml?username="+username;
			 $.get(url,function(mes){
				if(mes=="0"){
					$("#username").css('background-color','red');
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
	        	$("#email").css('background-color','red');
	        	document.getElementById("mailid1").innerHTML="";
                document.getElementById("mailid").innerHTML=email+"Email格式不正确";
                isEmail=0;
                return false;
            }else{
             $("#email").css('background-color','#FFFFFF');
             var url = "<%=basePath%>mem/baseinfo_checkEmailIsExistMember.shtml?email="+email;
			 $.get(url,function(mes){
				if(mes=="0"){
	            		document.getElementById("mailid1").innerHTML="";
	            		document.getElementById("mailid").innerHTML=email+"已经存在";
	            	    _Alert(me,"请重新输入email!");
	            	    isEmail=0;
	                    return false;
	            	  }else{
	            		  document.getElementById("mailid").innerHTML="";
	            		  document.getElementById("mailid1").innerHTML="邮箱可以注册";
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
	         $("#mobile").css('background-color','red');
	         document.getElementById("phoneid").innerHTML=mobile+"手机格式不正确";
            _Alert(me,"输入手机格式不正确，请输入数字");
          return false;
         }else{
         $("#mobile").css('background-color','#FFFFFF');
            var url = "<%=basePath%>mem/baseinfo_checkMobileIsExistMember.shtml?mobile="+mobile;
			 $.get(url,function(mes){
				if(mes=="0"){
            		 document.getElementById("phoneid1").innerHTML="";
            		 document.getElementById("phoneid").innerHTML=mobile+"手机已经存在!";
            	      _Alert(me,"请重新输入手机!");
            	      isphone=0;
            	      return false;
            	  }else{
            		  document.getElementById("phoneid").innerHTML="";
            		  document.getElementById("phoneid1").innerHTML="手机可以注册";
            	      isphone=1;
            	    }
			})
            }
         }
     }

</script>
  <body >
  <div style="width: 100%;height: 100%;" align="center">
    <table width="60%" style="border: 0px red solid;" align="center">
    	<tr>
    		<td colspan="2" align="center">
    			<jsp:include page="../head.jsp"></jsp:include>
    		</td>
    	</tr>
    	<tr align="center">
    		<td>
    		<br/>
   			<form id="sysAgentBean" name="sysAgentBean" onsubmit="return true;" action="<%=basePath%>mem/baseinfo_registerMember.shtml" method="post">
			  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
			   <tr>
			      <td height="30" colspan="2" align="center" bgcolor="#BACEEF" class="tostrong">会 员 注 册 -- 信息完善 （<span class="impt">*</span> 为必填项）
			      </td>
			    </tr>
			    <tr>
			      <td height="30" colspan="2" align="center" class="tostrong" bgcolor="#FFFFFF"><span class="impt"> </span>
			      </td>
			    </tr>
			    <tr>
			      <td height="30" align="right" bgcolor="#FFFFFF" ><span style="color:#FF0000;">* </span>会员类别：</td>
			      <td bgcolor="#FFFFFF" >&nbsp;
			        <select name="tb.type" id="tbtype" class="easyui-validatebox" missingMessage="请选择会员类别" required="true" style="width: 120px">
			            <option value="" selected>请选择</option>
			            <option value="1" >经纪人</option>
			            <option value="2" >个人业主</option>
			            <option value="3" >公司业主</option>
						<option value="4" >开发商</option>
						<option value="5" >客户(需求方)</option>
						<option value="6" >银行</option>
						<option value="7" >贷款中介</option>
						<option value="8" >评估公司</option>
						<option value="9" >研究机构</option>
						<option value="10" >连锁企业</option>
						<option value="11" >其他</option>
			        </select></td>
			    </tr>

			     <tr>
			       <td height="30" align="right" bgcolor="#FFFFFF" ><span style="color:#FF0000;">* </span>地&nbsp;&nbsp;&nbsp;&nbsp;	区：</td>
					<td bgcolor="#FFFFFF" >&nbsp;
						<select id="tb.discode" name="discode" id="discode" class="easyui-validatebox" missingMessage="请选择地区" required="true" style="width: 120px">
						<option value="" selected>请选择</option>
					    <option value="0101">南京市玄武区</option>
					    <option value="0102">南京市鼓楼区</option>
					    <option value="0103">南京市雨花区</option>
						 </select>  
					</td>
			      </tr>

			    <tr>
			      <td width="20%" height="30" align="right" bgcolor="#FFFFFF"><span style="color:#FF0000;">* </span>用 户 名：</td>
			      <td bgcolor="#FFFFFF">&nbsp;
			      <input type="text" name="tb.username"  style="width: 220px" maxlength="15" value="<s:property value="tb.username"/>" readonly="readonly" id="username" onchange="return checkAgent(this)" class="easyui-validatebox" missingMessage="5-15个字符(包括英文字母、数字)" required="true" validType="length[5,15]" invalidMessage="长度为5-16"/>
			      <font><span id="checkid" style="color:red"></span></font><font><span id="checkid1" style="color:green"></span></font></td>
			    </tr>
			   <!-- <tr>
			      <td height="30" align="right" bgcolor="#FFFFFF"><span style="color:#FF0000;">* </span>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
			      <td bgcolor="#FFFFFF" style="anchor:100%">&nbsp;<label>
			      <input type="password" name="tb.password" size="31" id="password" class="easyui-validatebox" missingMessage="6-16个字符，英文字母加数字的组合密码" required="true" maxlength="16" validType="length[6,12]" invalidMessage="长度为6-12"/>
			      </label></td>
			    </tr>
			    <tr>
			      <td height="30" align="right" bgcolor="#FFFFFF"><span style="color:#FF0000;">* </span>确认密码：</td>
			      <td bgcolor="#FFFFFF">&nbsp;
			      <input type="password" name="repassword" size="31" id="repassword" class="easyui-validatebox" missingMessage="请输入确认密码" required="true" maxlength="16" onchange="return chechrepass(this)"/>
			      <font><span id="repasswordid" style="color:red"></span></font></td>
			    </tr>
				-->
			    <tr>
			      <td height="30" align="right" bgcolor="#FFFFFF"><span style="color:#FF0000;">* </span>电子信箱：</td>
			      <td bgcolor="#FFFFFF">&nbsp;
			      <input type="text" name="tb.email" style="width: 220px" value="<s:property value="tb.email"/>" id="email" readonly="readonly" onchange="return checkMail(this)" class="easyui-validatebox" missingMessage="安全验证的邮箱，请正确填写 无需验证，仅用于找回密码" required="true"/>
			        <font > <span id="mailid" style="color:red"></span></font></td>
			    </tr>
			     <tr>
			      <td height="30" align="right" bgcolor="#FFFFFF"><span style="color:#FF0000;"></span>真实姓名：</td>
			      <td bgcolor="#FFFFFF">&nbsp;
			      <input type="text" name="tb.realName" style="width: 220px" value="<s:property value="tb.realName"/>" id="realName" onchange="javascript:checkUsere(this)" class="easyui-validatebox" missingMessage="经纪人请填写身份证上的真实姓名，否则无法通过验证" required="true"/>
			      </td>
			    </tr>
			      <tr>
			        <td height="30" align="right" bgcolor="#FFFFFF">所属公司：</td>
			        <td bgcolor="#FFFFFF">&nbsp;<label>
			            <input type="text" name="tb.company" style="width: 220px" maxlength="15" value="<s:property value="tb.company"/>" id="company" class="easyui-validatebox" missingMessage="请如实填写,经纪人、公司业主、代理商、开发商，必须填写公司名称" required="true"/>
			            </label>
			        </td>
			      </tr>
			      <tr>
			        <td height="30" align="right" bgcolor="#FFFFFF">所属部门：</td>
			        <td bgcolor="#FFFFFF">&nbsp;<label>
			            <input type="text" name="tb.stores" style="width: 220px" maxlength="15" value="<s:property value="tb.stores"/>" id="stores" class="easyui-validatebox" missingMessage="请如实填写,经纪人、公司业主、代理商、开发商，必须填写公司名称" required="true"/>
			            </label>
			        </td>
			      </tr>
			    <tr>
			      <td height="30" align="right" bgcolor="#FFFFFF"><span style="color:#FF0000;">* </span>手机号码：</td>
			      <td bgcolor="#FFFFFF">&nbsp;
			      <input type="text" name="tb.mobile" style="width: 220px" value="<s:property value="tb.mobile"/>" id="mobile" onchange="return checkPhone(this)" class="easyui-validatebox" missingMessage="请输入手机号" required="true"/>
			      <font> <span id="phoneid" style="color:red"></span></font><font> <span id="phoneid1" style="color:green"></span></font>
			      </td>
			    </tr>
			    <tr>
			      <td height="30" align="right" bgcolor="#FFFFFF">咨询电话：</td>
			      <td bgcolor="#FFFFFF">&nbsp;<label>
			      <input type="text" name="tb.tel" style="width: 220px" value="<s:property value="tb.tel"/>" id="tel"/>
			      </label></td>
			    </tr>
			    <tr>
			      <td height="30" align="right" bgcolor="#FFFFFF">自我介绍：</td>
			      <td bgcolor="#FFFFFF">&nbsp;<label>
			      <textarea type="text" name="tb.introduction" style="width: 400px" value="<s:property value="tb.introduction"/>" id="introduction" style="width: 480px;height: 80px"></textarea>
			      </label></td>
			    </tr>
			    <tr>
			      <td height="30" align="right" bgcolor="#FFFFFF"><span style="color:#FF0000;">* </span>校 验 码：</td>
			      <td bgcolor="#FFFFFF">&nbsp;
			      	  <input type="text" name="imgchk" id="imgchk" maxlength="4" size="4">
				      <img id="pic" src="<%=basePath%>member/yanzhengma.jsp" align="middle" /> <a href="javascript:changePicture();">换一张</a>
			      </td>
			    </tr>
			   <!-- <tr>
			      <td height="45" align="right" bgcolor="#FFFFFF">&nbsp;</td>
			      <td bgcolor="#FFFFFF">&nbsp;<label>
			        <input type="checkbox" name="ck_ok" id="ck_ok"  value="checkbox" checked />
			      我已阅读并接受《<a href="/pages/common/help/useragree.jsp" target="_blank">用户服务协议</a>》</label></td>
			    </tr> --> 
			  </table>
			  <p align="center">
			    <label>
			  <!--   <input type="button" name="bt_sumit" value="注 册" onclick="return checkform()"/>--> 
			    <a href="#" id="btn1" onclick="checkform();"></a>
			    <a href="#" id="btn2" onclick="window.location.href='<%=basePath%>mem/baseinfo_mainPage.shtml'"></a>
			    </label>
			  </p>
			  <div class="clear">&nbsp;</div>
			  <input type="hidden" name="tb.id" value="<s:property value="tb.id"/>"/>
			  <input type="hidden" name="tb.discode" value="<s:property value="tb.discode"/>"/>
			  <input type="hidden" name="tb.status" value="<s:property value="tb.status"/>"/>
			  <input type="hidden" name="tb.certification" value="<s:property value="tb.certification"/>"/>
			  <input type="hidden" name="tb.integral" value="<s:property value="tb.integral"/>"/>
			  <input type="hidden" name="tb.mouseWord" value="<s:property value="tb.mouseWord"/>"/>
			  <input type="hidden" name="tb.level" value="<s:property value="tb.level"/>"/>
			  <input type="hidden" name="tb.introduction" value="<s:property value="tb.introduction"/>"/>
			  <input type="hidden" name="tb.createTime" value="<s:date name="tb.createTime"/>"/>
			</form>
    		</td>
    	</tr>
    </table>
    </div>
    <iframe name="test" style="display: none;"></iframe>
  </body>
<script language="javascript">
$('#btn1').linkbutton({
   			id:'ad',
   			disabled:false,
   			plain: false,
   			text:'注&nbsp;&nbsp;&nbsp;&nbsp;册',
   			iconCls:'icon-ok login_btn'
   		});
$('#btn2').linkbutton({
   			id:'ad',
   			disabled:false,
   			plain: false,
   			text:'返&nbsp;&nbsp;&nbsp;&nbsp;回',
   			iconCls:'icon-ok login_btn'
   		});
   		
$("#imgchk").tip({height:'20px',width:'80px'},"<font style='color:black;' size='2px'>请输入验证码</font>","1")
    function checkUsere(userName){
       if(!checkUser(userName)){
          _Alert(userName,"姓名必须为中文!");
          return false;
       }
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

  function checkform(){
      var tbtype=document.sysAgentBean.tbtype;
      var discode=document.sysAgentBean.discode;
      var username = document.sysAgentBean.username;
      var email = document.sysAgentBean.email;
      var realName = document.sysAgentBean.realName;
      var mobile = document.sysAgentBean.mobile;
      var company=document.sysAgentBean.company;
      var imgchk=document.sysAgentBean.imgchk;
      
      if(!checkNull(tbtype)){
         _Alert(tbtype,"请选择会员类别。");
         return false;
      }
      
      if(!checkNull(discode)){
         _Alert(discode,"请选择地区。");
         return false;
      }
		
     if(!checkNull(username)){
       _Alert(username,"请输入用户名。");
         return false;
      } else{
          if(!IsCharAndNum(username)){
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

    if(!checkNull(email)){
      _Alert(email,"请输入电子邮箱。");
      return false;
    }
    if(isEmail=="0"){
    	 _Alert(email,"请重新输入电子邮箱!");
    	  return false;
    }
   /* if(!checkNull(realName)){
       _Alert(realName,"请输入真实姓名。");
       return false;
    }else if(!checkUser(realName)){
        _Alert(realName,"姓名必须为中文!");
       return false;
    }

    for(var i=0;i<groups.length;i++){
         if(groups[i]==group.value){
             if(!checkNull(store)){
                   _Alert(store,"请输入公司名称。");
                   return false;
             }
          }
     }     
      */
      
    if(!checkNull(mobile)){
      _Alert(mobile,"请输入手机号码。");
      return false;
    }else{
      if(!isUnsignedInteger(mobile)){
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
    
    document.sysAgentBean.target="test";
    document.sysAgentBean.submit();
    return true;
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
</script>
</html>
