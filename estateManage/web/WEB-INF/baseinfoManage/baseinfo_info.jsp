<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>用户信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" href="../resource/css/global.css"
			type="text/css"></link>
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/jqueryui/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/jqueryui/icon.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/jqueryui/icon.css">
		<script type="text/javascript"
			src="<%=basePath%>scripts/jquery-1.4.2.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>scripts/jquery.easyui.min.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>scripts/baseinfoManage/baseinfo_info.js"></script>
	</head>
	<STYLE type="text/css">
html,body,div,span,td,font {
	font-family: Helvetica, Arial, sans-serif;
	font-size: 12px;
	color: black;
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	line-height: normal;
}
</STYLE>
	<script LANGUAGE="JavaScript">
  function init(){
  	$("#tbtype").focus();
  	$("#tipspan").hide();
  	$("#register_btn").hide();
  }
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
	         $("#mobile").css('background-color','#FF8080');
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
	<body onload="init();">
		<div style="width: 100%; height: 100%;" align="center">
			<table width="60%" style="border: 0px #FF8080 solid;" align="center"
				class="layoutTab">

				<tr align="center">
					<td>
						<form id="sysAgentBean" name="sysAgentBean"
							onsubmit="return true;" action="baseinfo_saveOrUpdate.shtml"
							method="post">
							<table width="100%" border="0" cellpadding="0" cellspacing="1"
								bgcolor="#CCCCCC">
								<tr>
									<td height="30" colspan="2" align="center" bgcolor="#BACEEF"
										class="tostrong">
										<s:if test="flag==1">
						【新增会员】
					</s:if>
										<s:if test="flag==2">
						【会员详情】
					</s:if>
										<s:if test="flag==3">
						【修改会员】
					</s:if>

									</td>
								</tr>
								<tr>
									<td width="20%" height="30" align="right" bgcolor="#FFFFFF">
									<input TYPE="hidden" name="baseinfo.id" value='<s:property value="baseinfo.id"/>' />
										<span style="color: #FF0000;">* </span>用 户 名：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<input type="text" name="baseinfo.username"
											style="width: 220px" maxlength="15" id="username"
											onchange="return checkAgent(this)" class="easyui-validatebox"
											missingMessage="5-15个字符(包括英文字母、数字)" required="true"
											validType="length[5,15]" invalidMessage="长度为5-16"
											value='<s:property value="baseinfo.username"/>' />
										<font><span id="checkid" style="color: #FF8080"></span>
										</font><font><span id="checkid1" style="color: green"></span>
										</font>
									</td>
								</tr>
								<s:if test="flag!=2">
									<tr>
										<td height="30" align="right" bgcolor="#FFFFFF">
											<span style="color: #FF0000;">* </span>密&nbsp;&nbsp;&nbsp;&nbsp;码：
										</td>
										<td bgcolor="#FFFFFF" style="anchor: 100%">
											&nbsp;
											<label>
												<input type="password" name="baseinfo.password"
													style="width: 220px" id="password"
													class="easyui-validatebox"
													missingMessage="6-16个字符，英文字母加数字的组合密码" required="true"
													maxlength="16" validType="length[6,12]"
													invalidMessage="长度为6-12" value='<s:property value="baseinfo.password"/>' />
											</label>
										</td>
									</tr>
									<tr>
										<td height="30" align="right" bgcolor="#FFFFFF">
											<span style="color: #FF0000;">* </span>确认密码：
										</td>
										<td bgcolor="#FFFFFF">
											&nbsp;
											<input type="password" name="repassword" style="width: 220px"
												id="repassword" class="easyui-validatebox"
												missingMessage="请输入确认密码" required="true" maxlength="16"
												onchange="return chechrepass(this)" value='<s:property value="baseinfo.password"/>' />
											<font><span id="repasswordid" style="color: #FF8080"></span>
											</font>
										</td>
									</tr>
								</s:if>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										<span style="color: #FF0000;">* </span>会员类别：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<s:select
											list="#{'1':'经纪人','2':'个人业主','3':'公司业主','4':'开发商','5':'客户(需求方)','6':'银行','7':'贷款中介','8':'评估公司','9':'研究机构','10':'连锁企业','11':'其他'}"
											name="baseinfo.type" id="tbtype" theme="simple" headerKey="0"
											headerValue="--请选择--"></s:select>
									</td>
								</tr>

								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										<span style="color: #FF0000;">* </span>地&nbsp;&nbsp;&nbsp;&nbsp;
										区：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<s:select
											list="#{'0101':'南京市玄武区','0102':'南京市鼓楼区','0103':'南京市雨花区'}"
											name="baseinfo.discode" theme="simple" headerKey=""
											id="discode" headerValue="--请选择--"></s:select>
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										电子信箱：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<input type="text" name="baseinfo.email" style="width: 220px"
											class="easyui-validatebox"
											value='<s:property value="baseinfo.email"/>' />
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										真实姓名：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<input type="text" name="baseinfo.realName"
											style="width: 220px" class="easyui-validatebox"
											value='<s:property value="baseinfo.realName"/>' />
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										所属公司：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<input type="text" name="baseinfo.company"
											style="width: 220px" maxlength="15"
											class="easyui-validatebox"
											value='<s:property value="baseinfo.company"/>' />
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										门店：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<input type="text" name="baseinfo.stores" style="width: 220px"
											class="easyui-validatebox"
											value='<s:property value="baseinfo.stores"/>' />
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										<span style="color: #FF0000;"></span>手机号码：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<input type="text" name="baseinfo.mobile" style="width: 220px"
											class="easyui-validatebox"
											value='<s:property value="baseinfo.mobile"/>' />
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										固定电话：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<label>
											<input type="text" name="baseinfo.tel" size="30"
												value='<s:property value="baseinfo.tel"/>' />
										</label>
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										状态：
									</td>
									<td bgcolor="#FFFFFF">
										<s:radio list="#{'0':'正常','1':'禁用'}" name="baseinfo.status"
											theme="simple" />
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										认证：
									</td>
									<td bgcolor="#FFFFFF">
										<s:radio list="#{'0':'是','1':'否'}"
											name="baseinfo.certification" theme="simple" />
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										金币：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<label>
											<input type="text" name="baseinfo.money" size="30"
												value='<s:property value="baseinfo.money"/>' />
										</label>
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										积分：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<label>
											<input type="text" name="baseinfo.integral" size="30"
												value='<s:property value="baseinfo.integral"/>' />
										</label>
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										口碑：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<label>
											<input type="text" name="baseinfo.mouseWord" size="30"
												value='<s:property value="baseinfo.mouseWord"/>' />
										</label>
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										等级：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<label>
											<input type="text" name="baseinfo.level" size="30"
												value='<s:property value="baseinfo.level"/>' />
										</label>
									</td>
								</tr>
								<tr>
									<td height="30" align="right" bgcolor="#FFFFFF">
										虚拟金钱：
									</td>
									<td bgcolor="#FFFFFF">
										&nbsp;
										<label>
											<input type="text" name="baseinfo.virtualCurrency" size="30"
												value='<s:property value="baseinfo.virtualCurrency"/>' />
										</label>
									</td>
								</tr>
							</table>

							<p align="center">
								<label>
									<s:if test="flag!=2">
										<a href="#" id="btn1" onclick="checkform();"></a>&nbsp;&nbsp;&nbsp;&nbsp;
										</s:if>
									<a href="javascript:history.go(-1)" id="btn2"></a>
								</label>
							</p>
							<div class="clear">
								&nbsp;
							</div>
							<input type="hidden" name="tb.integral" value="10" />

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
   			text:'保&nbsp;&nbsp;&nbsp;&nbsp;存',
   			iconCls:'icon-ok login_btn'
   		});
 $('#btn2').linkbutton({
   			id:'ad',
   			disabled:false,
   			plain: false,
   			text:'返&nbsp;&nbsp;&nbsp;&nbsp;回',
   			iconCls:'icon-ok login_btn'
   		});
   		

  function checkform(){
      var tbtype=document.sysAgentBean.tbtype;
      var discode=document.sysAgentBean.discode;
      var username = document.sysAgentBean.username;
      var password = document.sysAgentBean.password;
      var repwd = document.sysAgentBean.repassword;
      var email = document.sysAgentBean.email;
      var mobile = document.sysAgentBean.mobile;
      var company=document.sysAgentBean.company;
      var groups = ["300","700","900","1100"];
      
   
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


    document.sysAgentBean.submit();
    return true;
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
