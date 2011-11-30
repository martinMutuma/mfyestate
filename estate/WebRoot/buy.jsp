<%@ page language="java" import="com.estate.domain.member.TmBaseinfo" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="resource/css/whole.css" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="resource/css/specials.css">
	<link rel="stylesheet" type="text/css" href="resource/css/index.css">
	<link rel="stylesheet" type="text/css" href="resource/css/house.css">
	<link rel="stylesheet" type="text/css" href="resource/css/jqueryui/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="resource/css/jqueryui/icon.css">
	<script type="text/javascript" src="resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="resource/js/whole.js"></script>
	<script type="text/javascript" src="resource/js/special.js"></script>
	<script type="text/javascript" src="resource/js/Need_online.js"></script>
	
  </head>

  <body>
  	<jsp:include page="head.jsp"/>
   	<div style="width: 100%;margin-top: 15px;" align="center">
   		<div class="whole_width">
<div class="service bdfa" id="fsub0">
    <div class="service_dt hk_bg" id="fsub0"><div style="line-height:55px; color:#856326; font-size:18px; font-weight:bold; padding-left:276px;">一样的房源，更低的价格</div></div>

   							<!--购房需求Start--> 
                           <form id="form1" name="form1" action="<%=basePath%>building/save.shtml" method="post" class="form_x">
                            <div class="service_dd" id="ndFirst">
                            	<div class="cf3 need_box_dt">留下您的购房需求，拥有贴心置业秘书，享受梦房园独家服务！</div>
                                <div class="need_box_dd">
                                    <div class="buy_x"></div>
                                    <div class="nd_top y_top"></div>
                                    <div class="nd_cen">
                                          <div class="py">
                                           <div class="x_kk01">置业城市：</div>
                                                <div class="x_kk">
                                                <c:if test="${sessionScope.sessionDistrict=='3201000000'}">
                                                	<label><input name='needObj.city' type='checkbox'  value='玄武区' onclick=""> 玄武区</label><label><input name='needObj.city' type='checkbox'  value='白下区' onclick=""> 白下区</label><label><input name='needObj.city' type='checkbox'  value='秦淮区' onclick=""> 秦淮区</label><label><input name='needObj.city' type='checkbox'  value='建邺区' onclick=""> 建邺区</label><label><input name='needObj.city' type='checkbox'  value='鼓楼区' onclick=""> 鼓楼区</label><label><input name='needObj.city' type='checkbox'  value='下关区' onclick=""> 下关区</label><label><input name='needObj.city' type='checkbox'  value='浦口区' onclick=""> 浦口区</label><label><input name='needObj.city' type='checkbox'  value='栖霞区' onclick=""> 栖霞区</label><label><input name='needObj.city' type='checkbox'  value='江宁区' onclick=""> 江宁区</label><label><input name='needObj.city' type='checkbox'  value='雨花台区' onclick=""> 雨花台区</label><label><input name='needObj.city' type='checkbox'  value='其他' onclick=""> 其他</label>                                                <p id="needCityTips" style="color:#F00; display:none;"><strong>告诉我们您想在哪里置业哦！</strong></p>
                                                </c:if>
												<c:if test="${sessionScope.sessionDistrict=='3207000000'}">
                                                	<label><input name='needObj.city' type='checkbox'  value='新浦区' onclick=""> 新浦区</label><label><input name='needObj.city' type='checkbox'  value='连云区' onclick=""> 连云区</label><label><input name='needObj.city' type='checkbox'  value='海州区' onclick=""> 海州区</label><label><input name='needObj.city' type='checkbox'  value='赣榆县' onclick=""> 赣榆县</label><label><input name='needObj.city' type='checkbox'  value='灌云县' onclick=""> 灌云县</label><label><input name='needObj.city' type='checkbox'  value='东海县' onclick=""> 东海县</label><label><input name='needObj.city' type='checkbox'  value='灌南县' onclick=""> 灌南县</label><label><input name='needObj.city' type='checkbox'  value='其他' onclick=""> 其他</label>                                                <p id="needCityTips" style="color:#F00; display:none;"><strong>告诉我们您想在哪里置业哦！</strong></p>
												</c:if>
                                            	</div>
                                            </div>
                                            <div class="py">
                                                <div class="x_kk01">物业类型：</div>
                                                <div class="x_kk">
                                                <label><input name='needObj.preference'  type='checkbox' value='住宅' onclick="getNameValue('needObj.preference')"/> 住宅</label><label><input name='needObj.preference'  type='checkbox' value='公寓' onclick="getNameValue('needObj.preference')"/> 公寓</label><label><input name='needObj.preference'  type='checkbox' value='海景房' onclick="getNameValue('needObj.preference')"/> 海景房</label><label><input name='needObj.preference'  type='checkbox' value='别墅' onclick="getNameValue('needObj.preference')"/> 别墅</label><label><input name='needObj.preference'  type='checkbox' value='酒店式公寓' onclick="getNameValue('needObj.preference')"/> 酒店式公寓</label><label><input name='needObj.preference'  type='checkbox' value='产权式酒店' onclick="getNameValue('needObj.preference')"/> 产权式酒店</label><label><input name='needObj.preference'  type='checkbox' value='写字楼' onclick="getNameValue('needObj.preference')"/> 写字楼</label><label><input name='needObj.preference'  type='checkbox' value='商铺' onclick="getNameValue('needObj.preference')"/> 商铺</label>                                                </div>
                                                <div id="needPreferenceTips" style="color:#F00; display:none; margin-left:70px;"><strong>告诉我们您想购买什么类型的新房哦！</strong></div>
                                            </div>
                                            <div class="py">
                                                <div class="x_kk01">置业目的：</div>
                                                <div class="x_kk">
                                                <label><input name='needObj.purpose' type='checkbox' value='居住' onclick="getNameValue('needObj.purpose')" /> 居住</label><label><input name='needObj.purpose' type='checkbox' value='养老' onclick="getNameValue('needObj.purpose')" /> 养老</label><label><input name='needObj.purpose' type='checkbox' value='休闲度假' onclick="getNameValue('needObj.purpose')" /> 休闲度假</label><label><input name='needObj.purpose' type='checkbox' value='投资' onclick="getNameValue('needObj.purpose')" /> 投资</label><label><input name='needObj.purpose' type='checkbox' value='其他' onclick="getNameValue('needObj.purpose')" /> 其他</label>                                                </div>
                                            </div>
                                            <div class="py">
                                                <div class="x_kk01">置业户型：</div>
                                                <div class="x_kk">
                                                <label><input name='needObj.needRoom' type='Radio' value='1室' /> 一居</label><label><input name='needObj.needRoom' type='Radio' value='2室' /> 二居</label><label><input name='needObj.needRoom' type='Radio' value='3室' /> 三居</label><label><input name='needObj.needRoom' type='Radio' value='4室' /> 四居</label><label><input name='needObj.needRoom' type='Radio' value='5室' /> 五居</label><label><input name='needObj.needRoom' type='Radio' value='6室' /> 五居以上</label>                                                </div>
                                            </div>
                                            <div class="py h_030">
                                            <div class="left">
                                                <div class="x_kk01">置业面积：</div>
                                                <div class="left">
                                                	<label>
                                                    <select name="needObj.area" id="area">
                                                    	<option value="">请选择需求面积</option>
                                                		<option value=50 />50㎡以内</option><option value=50-80 />50-80㎡</option><option value=80-120 />80-120㎡</option><option value=120-160 />120-160㎡</option><option value=160-200 />160-200㎡</option><option value=200以上 />200㎡以上</option>                                                    </select>
                                                    </label>
                                                </div>
                                                </div>
                                                <div class="left">
                                                <div class="x_kk01">预算单价：</div>
                                                <div class="left">
                                                	<label>
                                                    <select name="needObj.totalPrice" id="TotalPrice">
                                                    	<option value="">请选择预算单价</option>
                                                		<option value=5000以下 />5000元/㎡以下</option><option value=5000-8000 />5000-8000元/㎡</option><option value=8000-1万 />8000-1万元/㎡</option><option value=1万-1.2万 />1万-1.2万元/㎡</option><option value=1.2万-1.5万 />1.2万-1.5万元/㎡</option><option value=1.5万-2万 />1.5万-2万元/㎡</option><option value=2万以上 />2万元以上/㎡</option>                                                    </select>
                                                    </label>
                                                </div>
                                                </div>
                                            </div>
                                       
                                    </div>
                                    <div class="nd_foot y_foot left"></div>
                                        <div id="ndTips" style="color:red""></div>
                                        <div class="clear"><input name="" type="button" class="xu_butt" value="提交购房需求" onclick="setSave()"/></div>
                                </div>
                                <div class="online_cl hk_bg"></div>
                            </div>
                            <!--购房需求End-->
                            
                            <!--填写联系信息Start-->
                            	<div class="service_dd" id="ndSecond" style="display:none;">
                            	<div class="cf3 need_box_dt" style="background:none">为了专业置业秘书能联系到您，为您提供更贴心服务，您需填写以下信息：</div>
                                <div class="need_box_dd">
                                    
                                    
                                    <div class="nd_cen" style="margin-top: 5px;">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td class="tR padt6">真实姓名：<br><br></td>
                                            <td class="tL padt6" id="ndName_0"><input type="text" name="needObj.name" id="name"/> <span class="cf3" id="ndErrorNameTip">*</span><br><br></td>
                                            <td class="tL" id="ndName_1">${sessionScope.userinfo.realName}<br><br></td>
                                            <td class="tL"><p id="needNameTips" style="color:#F00; display:none;">请填写姓名！</p><br><br></td>
                                          </tr>
                                          <tr>
                                            <td class="tR padt6">手机号码：<br><br></td>
                                            <td class="tL padt6" id="ndTel_0"><input type="text" name="needObj.phone" id="tel" onchange="AjaxCheckTel($(this).val());" /> <span class="cf3" id='ndErrorTelTip'>*</span><br><br></td>
                                            <td class="tL" id="ndTel_1">${sessionScope.userinfo.mobile}<br><br></td>
                                            <td><p id="needPhoneTips" style="color:#F00; display:none;">请填写手机号码！</p><br><br></td>
                                          </tr>
                                          <tr>
                                            <td class="tR padt6">性 别：<br><br></td>
                                            <td class="tL padt6" id="ndSex_0"><input type="radio" name="needObj.sex" value="1" checked="checked"/> 先生 &nbsp;<input type="radio" name="needObj.sex" value="2"/> 女士<br><br></td>
                                            <td class="tL" id="ndSex_1"><c:if test="${sessionScope.userinfo.sex=='1'}"> 先生</c:if><c:if test="${sessionScope.userinfo.sex=='2'}"> 女士</c:if><br><br></td>
                                          </tr>
                                          <tr>
                                            <td valign="top" class="tR padt6">特别需求：<br><br></td>
                                            <td class="tL padt6">
                                                <textarea rows="5" name="needObj.otherDemand" class="w6 f12" id="otherDemand"></textarea>
                                            <br><br></td>
                                          </tr>
                                          <tr>
                                            <td class="tR">&nbsp;<br><br></td>
                                            <td class="tL padt15"><input name="" type="button" value="确 定" class="input_07" onclick="addUserInfo($('#name').val(),$('#tel').val(),$('#otherDemand').val())"/> <input name="" type="reset" value="重 置" class="input_07" /> <input name="" type="button" value="关 闭" onclick="ndCloseDiv('ndSecond')" class="input_07" /><br><br></td>
                                          </tr>
                                       </table>
                                    </div>
                                       <div class="ts_gb"><a href="javascript:void(0)" onclick="ndCloseDiv('ndFive')"><img src="resource/images/delete.png" /> 关闭</a></div>
                                       
                                       
                                </div>
                                
                            </div>
                           </form>
                            <!--填写联系信息End-->
                            
                            <!--提交需求，填写联系信息成功（登陆用户）Start-->
                            <div class="service_dd" id="ndThreed" style="display:none;">
                            	<div class="cf3 need_box_dt" style="background:none;">提交成功</div>
                                <div class="need_box_dd">
                                    
                                    
                                    <div class="yqts_box">
                                        <div class="yqts all366C">
                                            <div class="tit f14 L22"><img src="resource/images/accept.png" />您已成功提交置业需求，梦房园置业秘书<br />将全心全意帮您置业！</div>
                                            
                                            <div class="tC all366C pad_t pad_11"><a href="<%=basePath%>member/login.jsp">登陆梦房园了解更多信息！</a></div>
                                        </div>
                                        <div class="ts_gb"><a href="javascript:void(0)" style="cursor:pointer;" onclick="ndCloseDiv('ndThreed')"><img src="resource/images/delete.png" /> 关闭</a></div>

                                    </div>
                                    
                                        
                                        
                                </div>
                                
                            </div>
                            <!--提交需求，填写联系信息成功（登陆用户）End-->
                            
                            
                            <!--提交需求，填写联系信息成功（未登陆用户）S-->
                            <div class="service_dd" id="ndFour" style="display:none;">

                            	<div class="cf3 need_box_dt" style="background:none;">提交成功</div>
                                <div class="need_box_dd">
                                    
                                    
                                    <div class="yqts_box">
                                        <div class="yqts all366C">
                                            <div class="tit f14 L22"><img src="resource/images/accept.png" />您已成功提交置业需求，梦房园置业秘书<br />将全心全意帮您置业！</div>
                                            
                                            您尚未注册梦房园帐号，不能进入我的置业秘书查看系统为您推荐的楼盘，使用手机号登录即可激活您的<br />梦房园帐号，密码为<span id="fsub_psw" style="color:red;"></span><a href="/index.php?m=Popular&a=login&" target="_blank">现在登录</a>
                                        </div>
                                        <div class="ts_gb"><a href="javascript:void(0)" onclick="ndCloseDiv('ndFour')"><img src="resource/images/delete.png" /> 关闭</a></div>
                                    </div>
                                    
                                        
                                </div>
                                
                            </div>
                            <!--提交需求，填写联系信息成功（未登陆用户）E-->
                            
                            <!--没有填写用户联系信息S-->
                            <div class="service_dd" id="ndFive" style="display:none;">
                            	<div class="cf3 need_box_dt" style="background:none;">提交成功</div>

                                <div class="need_box_dd">
                                    
                                    
                                    <div class="yqts_box">
                                        <div class="yqts all366C">
                                            <div class="tit f14 L22"><img src="resource/images/accept.png" />提交购房需求成功！</div>
                                            
                                            <span>您尚未填写联系信息，专业置业顾问暂不能为您服务，您可以：</span>

                                            <div class="tC all366C pad_t pad_11"><a href="#" target="_blank">进入楼盘搜索页面</a></div>
                                            
                                            <span>或者返回上一步，填写您的联系信息，以便专业置业顾问能够为您服务。</span>
                                            <div class="tC all366C pad_t pad_11"><a href="javascript:void(0)" onclick="addUserDiv('ndFive')">填写我的联系信息</a></div>
                                        </div>
                                        <div class="ts_gb"><a href="javascript:void(0)" onclick="ndCloseDiv('ndFive')"><img src="resource/images/delete.png" /> 关闭</a></div>

                                    </div>
                                    
                                        
                                        
                                </div>
                                
                            </div>
<!--需求结束-->

            <!--服务开通-->
            
    </div>
      <div class="asdo borde madt49" id="feedback">
    	<span class="feedback place"></span>
        <div class="docon">欢迎您对梦房园置业秘书服务提出宝贵意见，让我们更好的为您服务</div>
  	      <div class="pinp" id="zhiyepl">
          
          </div>

        <div class="fuwuww">
        	<form action="" method="post" name="Formsec" id="Formsec" class="liu_p">
                      			<div>
                       				<label>留言内容：</label>
                        			<span><textarea name="content" id="content" class="w379"></textarea></span>
                                </div>
                                <div>
                                     <% 
                                        if(session.getAttribute("userinfo")==null){
                                     
                                     %>
                                  
                                     <span>
                                	<span id="secUser_span">
                                   
                                	<label>梦房园账号：</label>
                                    <input name="createdBy" id="loginname" type="text" class="ip_bg" value="" />
                                            密码：
                                    <input name="pwdsec" id="loginpass" type="password" class="ip_bg" value="" />
                                    </span>
                                    </span>
                                 
                                  <% } %>
                                    <span >
                                            验 证 码：
                                        <input name="verify" id="verify" type="text" maxlength="4" class="w65" onkeyup="this.value=this.value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                    				<img id="pic" SRC="<%=basePath%>member/yanzhengma.jsp"  BORDER="0" ALT="点击刷新验证码" style="cursor:pointer" align="absmiddle"><a href="javascript:changePicture();" > 看不清,换一张</a>
                                    </span>
                                </div>
                      			<div class="pad_b">
                                	<div style="color:#F00; font-weight:bold; padding-left:20px;" id="secTips"></div>
                                	<input type="hidden" name="userId" id="userId" />
                          			<input name="input" type="button" class="yjfk" value="" onclick="checkMessage()"/>
                                    <input type="checkbox" id="checkboxNm" value="1"/> 匿名发表 <a href="<%=basePath%>member/register.jsp"   rel="nofollow" class="mad_r21" >[免费注册]</a>

                      			</div>
                                <div class="clear"></div>
                  		</form>
        </div>
    </div>
	<div class="friendly madt">
    	<strong>友情提示：</strong>1、梦房园置业秘书当前只对在梦房园网（要）购买海南房的客户提供！2、梦房园网置业秘书服务最终解释权归梦房园网所有！
    </div>
    <div class="clear"></div>

</div>
   		</div>
   	 <jsp:include page="copyright.jsp"></jsp:include>
   	 <iframe name="test" style="display: none;"></iframe>
  </body>
  <script language="javascript">
  	var userId = '${sessionScope.userinfo.id}';
  	var  username='${sessionScope.userinfo.username}';
  	var  pass='${sessionScope.userinfo.password}';
  	var basePath = '<%=basePath%>';
    function  changePicture(){
       document.getElementById("pic").src="member/yanzhengma.jsp?date="+new Date();
     }
  </script>
</html>
