<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page import="com.estate.util.comm.RequestUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String menuCls = RequestUtil.getParam(request,"menuCls","");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>修改头衔</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath%>resource/css/global.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/css/jqueryui/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>resource/css/jqueryui/icon.css"></link>
	<link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
    <script type="text/javascript" src="<%=basePath%>resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=basePath%>resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resource/js/global.js"></script>
	<script type="text/javascript" src="../resource/js/whole.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>member/css/honorCss.css" /> 
  </head>
  <body>
<jsp:include page="../head.jsp"></jsp:include>
  <div style="width: 100%;margin-top: 10px;" align="center">
    <table class="layoutTab" style="border: 0px red solid;">
    	<tr>
    		<td width="20%" align="left" valign="top"><jsp:include page="../left.jsp"></jsp:include></td>
    		<td valign="top">
    		<!-- 会员信息 start -->
    		 <div class="note"> 
            	每个用户都会有一套属于自己的经验值、财富值、等级和头衔。您可以通过发布房源等操作不断增加经验值和财富值，同时您的等级和头衔也会随经验值不断晋升。我们特地为您量身订做了七套角色系列，请您选择一套您最喜欢的角色，从此您的头衔便会按照此角色系列不断晋升，虚拟形象也会发生相应的变化。
            <br> 
        </div>
        <div class="tip"> 
            <img src="images/tips.gif" width="16" height="16">请注意，男生和女生的形象不同哦！ 您可以修改个人信息来选择性别。（如果没有选择性别，就默认为男生^^）        
        </div>
        <div class="tip">请选择您喜欢的角色（以下形象对应您当前的级别）</div> 
    		<form name="myform" onSubmit="return subForm(this);" action="/q"> 
			<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb">
			<tbody style="background-color:#F7F7F7;"> 
			            <tr valign="middle"> 
			                <td height="36" colspan="7" class="tx"><input id="junxian" type="radio" name="role" value="1" onClick="pb(this.value);"> 
			                    <label for="junxian"><strong>军衔</strong></label></td> 
			            </tr> 
			            <tr> 
			                <td width="140" height="24" rowspan="8"><img src="<%=basePath%>resource/images/honor_pic/1/${sessionScope.userinfo.sex}/${sessionScope.userinfo.level}.gif" width="110" height="150"></td> 
			                <td width="35">一级</td>
			                <td>新兵</td>
			                <td width="40">八级</td>
			                <td>中尉</td>
			                <td width="50">十五级</td>
			                <td>准将</td>
			            </tr>
			            <tr>
			                <td>二级</td>
			                <td>列兵</td>
			                <td>九级</td>
			                <td>上尉</td>
			                <td>十六级</td>
			                <td>少将</td>
			            </tr>
			            <tr>
			                <td>三级</td>
			                <td>下士</td>
			                <td>十级</td>
			                <td>大尉</td>
			                <td>十七级</td>
			                <td>中将</td>
			            </tr>
			            <tr>
			                <td>四级</td>
			                <td>中士</td>
			                <td>十一级</td>
			                <td>少校</td>
			                <td>十八级</td>
			                <td>上将</td>
			            </tr>
			            <tr>
			                <td>五级</td>
			                <td>上士</td>
			                <td>十二级</td>
			                <td>中校</td>
			                <td> 十九级</td>
			                <td>大将</td> 
			            </tr>
			            <tr>
			                <td>六级</td>
			                <td>准尉</td>
			                <td>十三级</td>
			                <td>上校</td>
			                <td>二十级</td>
			                <td>元帅</td>
			            </tr>
			            <tr>
			                <td>七级</td>
			                <td>少尉</td>
			                <td>十四级</td> 
			                <td>大校</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			            </tr> 
			            <tr> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			            </tr> 
			        </tbody>
			        <tbody> 
			            <tr valign="middle"> 
			                <td height="36" colspan="7" class="tx"><input id="keju"  type="radio" name="role" value="2" onClick="pb(this.value);"> 
			                    <label for="keju"><strong>科举夺魁</strong></label></td> 
			            </tr> 
			            <tr> 
			                <td width="140" height="24" rowspan="8"><img src="<%=basePath%>resource/images/honor_pic/2/${sessionScope.userinfo.sex}/${sessionScope.userinfo.level}.gif" width="110" height="150"></td> 
			                <td width="35">一级</td> 
			                <td>书童</td> 
			                <td width="40">八级</td> 
			                <td>同进士出身</td> 
			                <td width="50">十五级</td> 
			                <td>翰林学士</td> 
			            </tr> 
			            <tr> 
			                <td>二级</td> 
			                <td>书生</td> 
			                <td>九级</td> 
			                <td>进士出身</td> 
			                <td>十六级</td> 
			                <td>御史中丞</td> 
			            </tr> 
			            <tr> 
			                <td>三级</td> 
			                <td>秀才</td> 
			                <td>十级</td> 
			                <td>探花</td> 
			                <td>十七级</td> 
			                <td>詹士</td> 
			            </tr> 
			            <tr> 
			                <td>四级</td> 
			                <td>举人</td> 
			                <td>十一级</td> 
			                <td>榜眼</td> 
			                <td>十八级</td> 
			                <td>侍郎</td> 
			            </tr> 
			            <tr> 
			                <td>五级</td> 
			                <td>解元</td> 
			                <td>十二级</td> 
			                <td>状元</td> 
			                <td> 十九级</td> 
			                <td>大学士</td> 
			            </tr> 
			            <tr> 
			                <td>六级</td> 
			                <td>贡士</td> 
			                <td>十三级</td> 
			                <td>编修</td> 
			                <td>二十级</td> 
			                <td>文曲星</td> 
			            </tr> 
			            <tr> 
			                <td>七级</td> 
			                <td>会元</td> 
			                <td>十四级</td> 
			                <td>府丞</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			            </tr> 
			            <tr> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			            </tr> 
			        </tbody>
			         <tbody style="background-color:#F7F7F7;"> 
			            <tr valign="middle"> 
			                <td height="36" colspan="7" class="tx"><input id="wujiang" type="radio" name="role" value="3" onClick="pb(this.value);"> 
			                    <label for="wujiang"><strong>武将</strong></label></td> 
			            </tr> 
			            <tr> 
			                <td width="140" height="24" rowspan="8"><img src="<%=basePath%>resource/images/honor_pic/3/${sessionScope.userinfo.sex}/${sessionScope.userinfo.level}.gif" width="110" height="150"></td> 
			                <td width="35">一级</td> 
			                <td>兵卒</td> 
			                <td width="40">八级</td> 
			                <td>军侯</td> 
			                <td width="50">十五级</td> 
			                <td>卫将军</td> 
			            </tr> 
			            <tr> 
			                <td>二级</td> 
			                <td>门吏</td> 
			                <td>九级</td> 
			                <td>军司马</td> 
			                <td>十六级</td> 
			                <td>车骑将军</td> 
			            </tr> 
			            <tr> 
			                <td>三级</td> 
			                <td>武卒</td> 
			                <td>十级</td> 
			                <td>都尉</td> 
			                <td>十七级</td> 
			                <td>骠骑将军</td> 
			            </tr> 
			            <tr> 
			                <td>四级</td> 
			                <td>伍长</td> 
			                <td>十一级</td> 
			                <td>校尉</td> 
			                <td>十八级</td> 
			                <td>大将军</td> 
			            </tr> 
			            <tr> 
			                <td>五级</td> 
			                <td>什长</td> 
			                <td>十二级</td> 
			                <td>中郎将</td> 
			                <td> 十九级</td> 
			                <td>大司马</td> 
			            </tr> 
			            <tr> 
			                <td>六级</td> 
			                <td>队率</td> 
			                <td>十三级</td> 
			                <td>裨将军</td> 
			                <td>二十级</td> 
			                <td>天下兵马大都督</td> 
			            </tr> 
			            <tr> 
			                <td>七级</td> 
			                <td>屯长</td> 
			                <td>十四级</td> 
			                <td>偏将军</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			            </tr>
			            <tr>
			                <td>&nbsp;</td>
			                <td>&nbsp;</td>
			                <td>&nbsp;</td>
			                <td>&nbsp;</td>
			                <td>&nbsp;</td>
			                <td>&nbsp;</td>
			            </tr> 
			        </tbody> 
			        <tbody>
			            <tr valign="middle">
			                <td height="36" colspan="7" class="tx"><input id="jianghu"  type="radio" name="role" value="4" onClick="pb(this.value);"> 
			                    <label for="jianghu"><strong>江湖奇侠</strong></label></td> 
			            </tr>
			            <tr>
			                <td width="140" height="24" rowspan="8"><img src="<%=basePath%>resource/images/honor_pic/4/${sessionScope.userinfo.sex}/${sessionScope.userinfo.level}.gif" width="110" height="150"></td> 
			                <td width="35">一级</td> 
			                <td>初学弟子</td> 
			                <td width="40">八级</td> 
			                <td>江湖大侠</td> 
			                <td width="50">十五级</td> 
			                <td>超凡入圣</td> 
			            </tr> 
			            <tr> 
			                <td>二级</td> 
			                <td>中级弟子</td> 
			                <td>九级</td> 
			                <td>江湖豪侠</td> 
			                <td>十六级</td> 
			                <td>天人合一</td> 
			            </tr> 
			            <tr> 
			                <td>三级</td> 
			                <td>高级弟子</td> 
			                <td>十级</td> 
			                <td>一派堂主</td> 
			                <td>十七级</td> 
			                <td>返璞归真</td> 
			            </tr> 
			            <tr> 
			                <td>四级</td> 
			                <td>初入江湖</td> 
			                <td>十一级</td> 
			                <td>一派护法</td> 
			                <td>十八级</td> 
			                <td>笑傲江湖</td> 
			            </tr> 
			            <tr> 
			                <td>五级</td> 
			                <td>小有名气</td> 
			                <td>十二级</td> 
			                <td>一派掌门</td> 
			                <td> 十九级</td> 
			                <td>独孤求败</td> 
			            </tr> 
			            <tr> 
			                <td>六级</td> 
			                <td>名动一方</td> 
			                <td>十三级</td> 
			                <td>武林盟主</td> 
			                <td>二十级</td> 
			                <td>天外飞仙</td> 
			            </tr> 
			            <tr> 
			                <td>七级</td> 
			                <td>江湖少侠</td> 
			                <td>十四级</td> 
			                <td>一代宗师</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			            </tr> 
			            <tr> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			            </tr> 
			        </tbody> 
			    <tbody style="background-color:#F7F7F7;">
			        <tr valign="middle"> 
			            <td height="36" colspan="7" class="tx"> 
			                <input type="radio" id="bailing" name="role" value="5" onClick="pb(this.value);"> 
			                <label for="bailing" ><strong>公司白领</strong></label> 
			            </td>
			        </tr>
			        <tr>
			            <td width="140" height="24" rowspan="8"><img src="<%=basePath%>resource/images/honor_pic/5/${sessionScope.userinfo.sex}/${sessionScope.userinfo.level}.gif" width="110" height="150"></td> 
			            <td width="35">一级</td>
			            <td>实习生</td>
			            <td width="40">八级</td>
			            <td>中级经理</td>
			            <td width="50">十五级</td>
			            <td>首席运营官</td>
			        </tr>
			        <tr>
			            <td>二级</td>
			            <td>试用期</td>
			            <td>九级</td>
			            <td>高级经理</td>
			            <td>十六级</td>
			            <td>首席执行官</td>
			        </tr> 
			        <tr> 
			            <td>三级</td> 
			            <td>职场新人</td> 
			            <td>十级</td> 
			            <td>部门总监</td> 
			            <td>十七级</td> 
			            <td>副董事长</td> 
			        </tr> 
			        <tr> 
			            <td>四级</td> 
			            <td>助理</td> 
			            <td>十一级</td> 
			            <td>区域总监</td> 
			            <td>十八级</td> 
			            <td>董事长</td> 
			        </tr> 
			        <tr> 
			            <td>五级</td> 
			            <td>见习主管</td> 
			            <td>十二级</td> 
			            <td>部门总裁</td> 
			            <td> 十九级</td> 
			            <td>商界领袖</td> 
			        </tr> 
			        <tr> 
			            <td>六级</td> 
			            <td>主管</td> 
			            <td>十三级</td> 
			            <td>区域总裁</td> 
			            <td>二十级</td> 
			            <td>商界楷模</td> 
			        </tr> 
			        <tr> 
			            <td>七级</td> 
			            <td>初级经理</td> 
			            <td>十四级</td> 
			            <td>副总裁</td> 
			            <td>&nbsp;</td> 
			            <td>&nbsp;</td> 
			        </tr> 
			        <tr> 
			            <td>&nbsp;</td> 
			            <td>&nbsp;</td> 
			            <td>&nbsp;</td> 
			            <td>&nbsp;</td> 
			            <td>&nbsp;</td> 
			            <td>&nbsp;</td> 
			        </tr> 
			        <tbody> 
			            <tr valign="middle"> 
			                <td height="36" colspan="7" class="tx"><input id="magic" type="radio" name="role" value="6" onClick="pb(this.value);"> 
			                    <label for="magic"><strong>魔法师</strong></label></td> 
			            </tr> 
			            <tr> 
			                <td width="140" height="24" rowspan="8"><img src="<%=basePath%>resource/images/honor_pic/6/${sessionScope.userinfo.sex}/${sessionScope.userinfo.level}.gif" width="110" height="150"></td> 
			                <td width="35">一级</td> 
			                <td>魔法学徒</td> 
			                <td width="40">八级</td> 
			                <td>中位魔导士</td> 
			                <td width="50">十五级</td> 
			                <td>护国法师</td> 
			            </tr> 
			            <tr> 
			                <td>二级</td> 
			                <td>见习魔法师</td> 
			                <td>九级</td> 
			                <td>上位魔导士</td> 
			                <td>十六级</td> 
			                <td>法神</td> 
			            </tr> 
			            <tr> 
			                <td>三级</td> 
			                <td>初级魔法师</td> 
			                <td>十级</td> 
			                <td>大魔导士</td> 
			                <td>十七级</td> 
			                <td>法圣</td> 
			            </tr> 
			            <tr> 
			                <td>四级</td> 
			                <td>中级魔法师</td> 
			                <td>十一级</td> 
			                <td>下位魔导师</td> 
			                <td>十八级</td> 
			                <td>魔神</td> 
			            </tr> 
			            <tr> 
			                <td>五级</td> 
			                <td>高级魔法师</td> 
			                <td>十二级</td> 
			                <td>中位魔导师</td> 
			                <td> 十九级</td> 
			                <td>魔圣</td> 
			            </tr> 
			            <tr> 
			                <td>六级</td> 
			                <td>大魔法师</td> 
			                <td>十三级</td> 
			                <td>上位魔导师</td> 
			                <td>二十级</td> 
			                <td>魔界至尊</td> 
			            </tr> 
			            <tr> 
			                <td>七级</td> 
			                <td>下位魔导士</td> 
			                <td>十四级</td> 
			                <td>大魔导师</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			            </tr> 
			            <tr> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			                <td>&nbsp;</td> 
			            </tr> 
			        </tbody>
			        <tbody style="background-color:#F7F7F7;">
			        <tr valign="middle"> 
			            <td height="36" colspan="7" class="tx"> 
			                <input type="radio" id="fugu" name="role" value="7" onClick="pb(this.value);"> 
			                <label for="fugu" ><strong>欧洲复古</strong></label> 
			            </td> 
			        </tr> 
			        <tr> 
			            <td width="140" height="24" rowspan="8"><img style="border:1px solid #DCDBDB" src="<%=basePath%>resource/images/honor_pic/7/${sessionScope.userinfo.sex}/${sessionScope.userinfo.level}.gif" width="110" height="150"></td> 
			            <td width="35">一级</td> 
			            <td>平民</td> 
			            <td width="40">八级</td> 
			            <td>圣殿骑士</td> 
			            <td width="50">十五级</td> 
			            <td>大公</td> 
			        </tr> 
			        <tr> 
			            <td>二级</td> 
			            <td>侍童</td> 
			            <td>九级</td> 
			            <td>从男爵</td> 
			            <td>十六级</td> 
			            <td>亲王</td> 
			        </tr> 
			        <tr> 
			            <td>三级</td> 
			            <td>侍从</td> 
			            <td>十级</td> 
			            <td>男爵</td> 
			            <td>十七级</td> 
			            <td>国王</td> 
			        </tr> 
			        <tr> 
			            <td>四级</td> 
			            <td>高级侍从</td> 
			            <td>十一级</td> 
			            <td>子爵</td> 
			            <td>十八级</td> 
			            <td>皇帝</td> 
			        </tr> 
			        <tr> 
			            <td>五级</td> 
			            <td>见习骑士</td> 
			            <td>十二级</td> 
			            <td>伯爵</td> 
			            <td> 十九级</td> 
			            <td>贤者</td> 
			        </tr> 
			        <tr> 
			            <td>六级</td> 
			            <td>步兵骑士</td> 
			            <td>十三级</td> 
			            <td>侯爵</td> 
			            <td>二十级</td> 
			            <td>圣人</td> 
			        </tr> 
			        <tr> 
			            <td>七级</td> 
			            <td>骑兵骑士</td> 
			            <td>十四级</td> 
			            <td>公爵</td> 
			            <td>&nbsp;</td> 
			            <td>&nbsp;</td> 
			        </tr> 
			        <tr> 
			            <td>&nbsp;</td> 
			            <td>&nbsp;</td> 
			            <td>&nbsp;</td> 
			            <td>&nbsp;</td> 
			            <td>&nbsp;</td> 
			            <td>&nbsp;</td> 
			        </tr>
			        </tbody>
			    </table>
			<br><hr size="1" color="#DBDBDB" width="95%" align="center"> 
			<br>
			<table width="30%" border="0" align="center" cellpadding="0" cellspacing="0"> 
			  <tr> 
			    <td colspan="2"><input type="hidden" name="mrn" id="mrn" /> 
			<script type="text/javascript">
			document.myform.role[${sessionScope.userinfo.honorType}-1].checked = true;
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
			
			function subForm(o){
				var role = GetRadioValue("role");
				var url = "<%=basePath%>mem/baseinfo_loginMember.shtml?username="+username+"&password="+password+"&imgchk="+imgchk+"&time_second="+time_second+"&time="+(new Date().getTime().toString(36));
				$.get(url,function(mes){
					if(mes=="1"){
						window.location.href="<%=basePath%>mem/baseinfo_mainPage.shtml";
					}else if(mes=="2"){
						$.messager.alert('警告','验证码错误','error',function(){
							window.location.href="login.jsp?username="+username;
						})
					}else{
						$.messager.alert('警告','用户名或者密码错误','error',function(){
							window.location.href="login.jsp?username="+username;
						})
					}
				});
			}
			
			function subResult(){
				var role = GetRadioValue("role");
				var url = "<%=basePath%>mem/baseinfo_updateHonorType.shtml?role="+role+"&time="+(new Date().getTime().toString(36));
				$.get(url,function(mes){
					if(mes=="1"){
					$.messager.alert('提示','头衔设置成功！','info',function(){
						window.location.href="<%=basePath%>mem/baseinfo_mainPage.shtml";
						})
					}else{
						$.messager.alert('警告','提交失败','error',function(){
						})
					}
				});
			}
			
			function pb(o){
				 document.myform.mrn.value = o;
			}
			
			</script>
			<a href="#" id="btn" onclick="subResult();"></a>
			</td>
			  </tr>
			</table>
		<br>
</form>
	<!-- 会员信息 end -->
    		</td>
    	</tr>
    </table>
  </div>
  <div style="margin-top: 10px;">
			<center>
			<input name="menuCls" type="hidden" id="menuCls" value="<%=menuCls%>"/>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>
  </body>
  <script type="text/javascript">
  		$('#btn').linkbutton({
   			id:'ad',
   			disabled:false,
   			plain: false,
   			text:'提&nbsp;&nbsp;&nbsp;&nbsp;交',
   			iconCls:'icon-ok login_btn'
   		});
  </script>
</html>
