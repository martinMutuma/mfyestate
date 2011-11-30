<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>楼盘比较</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 1.css添加 -->
	<link rel="stylesheet" href="../resource/css/global.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>member/css/thickbox.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>dynamic/css/css1.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>dynamic/css/css3.css"/>
    <link rel="stylesheet" href="../resource/css/whole.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="../resource/css/jqueryui/icon.css"></link>
    <script type="text/javascript" src="../resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="../resource/js/whole.js"></script>
	<script type="text/javascript" src="../resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../resource/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../resource/js/global.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
  		<jsp:include page="../head.jsp"></jsp:include>
		<div style="width: 100%; margin-top: 10px;" align="center">
    <table class="layoutTab" style="border: 0px red solid;">
    	<tr>
    		<td valign="top">
   <dl class="duibi">
    <dd>
		<table class="qbox">
          <tr>
          	<td colspan="5" bgcolor="#9EC4ED" class="cf3 f16"><strong class="tit"><img src="<%=basePath%>dynamic/img/consultant.gif"/>楼盘基本信息</strong></td>
          </tr>
          <!-- 
          <tr>
            <td class="x_left">操 作</td>
            <td class="x_cen"><input type="button" style="cursor:pointer" value=" 删除此楼盘" onclick="delCompare(1586)"/></td><td class="x_cen"><input type="button" style="cursor:pointer" value=" 删除此楼盘" onclick="delCompare(9741)"/></td>
		  </tr>
		   -->
          <tr>
            <td class="x_left">名 称</td>
	        <s:iterator value="tbuildingList" status="st" id="item">
		            <td class="x_cen">
		           		<a href="#" ><strong class="c36c f14" title="<s:property value="name"/>"><s:property value="name"/></strong></a>
		           	</td>
	         </s:iterator>
		  </tr>
          <tr>
            <td class="x_left">楼盘类型</td>
            <s:iterator value="tbuildingList" status="st" id="item">
            	<td class="x_bgc x_pl_15"><s:property value="buildingType"/></td>
            </s:iterator>
			</tr>
          <tr>
            <td class="x_left">项目特色</td>
            <s:iterator value="tbuildingList" status="st" id="item">
            	<td class="x_bgc x_pl_15"><s:property value="features"/></td>
            </s:iterator>
          </tr>
          <tr>
            <td class="x_left">效果图</td>
            <s:iterator value="tbuildingList" status="st" id="item">
            <td class="x_bgc x_cen"><a href="#" title="效果图"><img src="<%=basePath%><s:property value="compressUrl"/>" title="<s:property value="name"/>" />[更多效果图]</a></td>
			</s:iterator>
			</tr>
          <tr>
            <td class="x_left">价格</td>
            <s:iterator value="tbuildingList" status="st" id="item">
	            <td class="x_pl_15">
	            <p><strong>起价：<s:property value="minPrice"/> 元/㎡ </strong></p>
	            <p><strong>均价：<s:property value="averagePrice"/>元/㎡ </strong></p>
	            <p><strong>最高价：<s:property value="maxPrice"/>元/㎡ </strong></p>
	            </td>
            </s:iterator>
            </tr>
            <!-- 
          <tr>
            <td class="x_left">优惠打折</td>
			<s:iterator value="tbuildingList" status="st" id="item">
            	<td class="x_bgc x_pl_15">金江金外滩二期全部封顶，内墙已经装修好，外墙在做门窗框架；目前推出特价房多套。</td>
			</s:iterator>
			</tr>
			 -->
          <tr>
            <td class="x_left">项目位置</td>
            <s:iterator value="tbuildingList" status="st" id="item">
            	<td class="x_pl_15"><s:property value="district"/></td>
			</s:iterator>
			</tr>
          <tr>
            <td class="x_left">项目地址</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value="address"/> </td>
			</s:iterator>
		  </tr>
          <tr>
            <td class="x_left">销售状态</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value="salesStatus"/> </td>
			</s:iterator>
		  </tr>
          <tr>
            <td class="x_left">装修状况</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value="fitCondition"/> </td>
			</s:iterator>
		  </tr>
          <tr>
            <td class="x_left">绿化率</td>
           <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value="greenRate"/> </td>
			</s:iterator>
		  </tr>
          <tr>
            <td class="x_left">容积率</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value="capacityRate"/> </td>
			</s:iterator>
		  </tr>
          <tr>
            <td class="x_left">开盘时间</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:date name="openDate" format="yyyy-mm-dd"/> </td>
			</s:iterator>
		  </tr>
          <tr>
            <td class="x_left">入住时间</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:date name="checkDate" format="yyyy-mm-dd"/></td>
			</s:iterator>
		  </tr>
          <tr>
            <td class="x_left">开发商</td>
           <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value="businessDevelopment"/> </td>
			</s:iterator>
		  </tr>
		  <!-- 
          <tr>
          	<td colspan="5" bgcolor="#9EC4ED" class="cf3 f16"><strong class="tit"><img src="img/consultant.gif" />精选户型</strong></td>
          </tr>
          <tr>
            <td class="x_left">一 居</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value=""/> </td>
			</s:iterator>
          </tr>
			<tr>
            <td class="x_left">二 居</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value=""/> </td>
			</s:iterator>
           </tr>
		   <tr>
            <td class="x_left">四 居</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value=""/> </td>
			</s:iterator> 
           </tr>
		   <tr>
            <td class="x_left">五居一上/td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value=""/> </td>
			</s:iterator> 
           </tr>
            -->
		   <tr>
            <td colspan="5" bgcolor="#9EC4ED" class="cf3 f16"><strong class="tit"><img src="<%=basePath%>dynamic/img/consultant.gif" />小区配套</strong></td>
          </tr>
          <tr>
            <td class="x_left">小区配套</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value="neighborhoods"/> </td>
			</s:iterator>
		  </tr>
          <tr>
            <td colspan="5" bgcolor="#9EC4ED" class="cf3 f16"><strong class="tit"><img src="<%=basePath%>dynamic/img/consultant.gif" />周边配套</strong></td>
          </tr>
          <tr>
            <td class="x_left">周边配套</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property value="lifeSupport"/> </td>
			</s:iterator>
		  </tr>
          <tr>
            <td colspan="5" bgcolor="#9EC4ED" class="cf3 f16"><strong class="tit"><img src="<%=basePath%>dynamic/img/consultant.gif" />交通配套</strong></td>
          </tr>
          <tr>
            <td class="x_left">交通状况</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value="traffic"/> </td>
			</s:iterator>
			</tr>
			<!-- 
          <tr>
            <td class="x_left">公 车</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value=""/> </td>
			</s:iterator>
		  </tr>
          <tr>
            <td class="x_left">其 他</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value=""/> </td>
			</s:iterator>
		  </tr>
		   -->
          <tr>
            <td colspan="5" bgcolor="#9EC4ED" class="cf3 f16"><strong class="tit"><img src="<%=basePath%>dynamic/img/consultant.gif" />用户关注</strong></td>
          </tr>
          <tr>
            <td class="x_left">浏览数</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value="views"/> </td>
			</s:iterator>
          <tr>
            <td class="x_left">关注数</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value=""/> </td>
			</s:iterator>
          <tr>
            <td class="x_left">参加看房团人数</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value=""/> </td>
			</s:iterator>
          <tr>
            <td class="x_left">备选数</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value="attentionNum"/> </td>
			</s:iterator>
          <tr>
            <td colspan="5" bgcolor="#9EC4ED" class="cf3 f16"><strong class="tit"><img src="<%=basePath%>dynamic/img/consultant.gif" />操 作</strong></td>
          </tr>
          <tr>
            <td class="x_left">加入关注</td>
            <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15">
			    <s:if test='#item.isAttention=="1"'>
                    <img src="<%=basePath%>dynamic/img/white.gif" id=""/>
                </s:if>
                <s:else>    
                    <a href="#" style="cursor:pointer" onclick="setState('<s:property value="id"/>')" title="加入关注" rel="nofollow"><img src="<%=basePath%>dynamic/img/attention.gif" id="pic_<s:property value="id"/>"/></a>
                </s:else>
			  </td>
			  </s:iterator>
          </tr>
          <!-- 
          <tr>
            <td class="x_left">参加免费看房团</td>
              <s:iterator value="tbuildingList" status="st" id="item">
          	  <td class="x_bgc x_pl_15"><s:property  value=""/> </td>
			</s:iterator>
			<!-- 
            <td class="x_pl_15"><div class="x_dd"><input type="button" class="x_dd04" value="参加看房团" onclick="jumpUrlTuan('1586')"/></div></td><td class="x_pl_15"><div class="x_dd"><input type="button" class="x_dd04" value="参加看房团" onclick="jumpUrlTuan('9741')"/></div></td>
             -- >
            </tr>
             -->
          <tr>
            <td class="x_left">加入备选</td>
             <s:iterator value="tbuildingList" status="st" id="item">
             <td class="x_bgc x_pl_15">
          	  <s:if test='#item.isChoose=="1"'>
                  <img src="<%=basePath%>dynamic/img/white.gif" id=""/>
              </s:if>
              <s:else>    
                  <a href="#" style="cursor:pointer" onclick="setState('<s:property value="id"/>','4')" title="加入备选" rel="nofollow"><img src="<%=basePath%>dynamic/img/choose.gif" id="pic_<s:property value="id"/>"/></a>
              </s:else>
              </td>
			</s:iterator>
            </tr>
        </table>

    </dd>
</dl>
        </td>
      </tr>
    </table>
 <div style="margin-top: 10px;">
			<center>
				<jsp:include page="../copyright.jsp" />
			</center>
		</div>   
  </body>
  <script type="text/javascript">
  function setState(id,optype){
	  if(optype=='4'){
		  	$("#pic_choose_"+id).attr("src","<%=basePath%>dynamic/img/white.gif");
		  	$.messager.alert('提示','已成功加入备选','info',function(){
			});
	   }else{
		  	$("#pic_attention_"+id).attr("src","<%=basePath%>dynamic/img/white.gif");
		  	$.messager.alert('提示','已成功加入关注','info',function(){
			});
	   }
		// window.location.href="<%=basePath%>proInfo/proInfo_createproInfo.shtml?operateType=2&operateToType=4&proId="+id;
	   $.get("<%=basePath%>proInfo/proInfo_createproInfo.shtml?operateType=1&operateToType="+optype+"&proId="+id+"&time="+(new Date().getTime().toString(36)),function(obj){
	   });
   }
   function delbuilding(id){
   	//	$("#building_"+id).attr("display",none);
   	// alert(id)
   		$("#building_"+id).remove();
   		$.get("<%=basePath%>proInfo/proInfo_deleteproInfo.shtml?operateType=1&proId="+id+"&time="+(new Date().getTime().toString(36)),function(obj){
		});
   }
   function deleteAllproInfo(){
   	$.messager.confirm('清空记录', '确定要删除所有关注的楼盘吗?', function(btn) {
		if (btn) {
	   		window.location.href="<%=basePath%>proInfo/proInfo_deleteAllproInfo.shtml?operateType=1";
  		}
  	});
   }
  </script>
</html>
