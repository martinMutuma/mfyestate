<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>梦房园</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="resource/css/whole.css" type="text/css"></link>
	<link rel="stylesheet" href="resource/css/global.css" type="text/css"></link>
	<link rel="stylesheet" href="resource/css/stage/seniorSearch.css" type="text/css"></link>
	<script type="text/javascript" src="resource/js/jquery-1.4.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="resource/js/whole.js"></script>
	<script type="text/javascript" src="resource/js/stage/seniorSearchMul.js"></script>
  </head>
  	<script type="text/javascript">
  	</script>
  <body>
  <div style="width: 100%;height: 100%;" align="center">
  <jsp:include page="head.jsp"></jsp:include>
  <!-- 3.添加class="layoutTab"  -->
  	<div class="stand_width searchArea" align="left">
		<span class="location">精确搜索案源信息</span>
		<div class="searchContent">
			<div class="proTitle">
				<span class="checked_title">新房</span><span>写字楼</span><span>商铺</span><span>生意转让</span><span>工业地产</span><span>大型项目</span><span>二手房</span>
				<b title="切换至单选模式" onclick="window.location.href='seniorSearch.shtml'">切换至单选模式</b>
			</div>
			<div id="proContent" class="proContent" align="center">
				<table cellpadding="0" border="0" cellspacing="5px" width="920px" >
				<tr>
						<td class="search_column_span line" valign="top">
							<span>销售状态：</span>
						</td>
						<td valign="top" class="line">
							<span style="cursor: pointer" id="rc_9_0_0"
								class="search_column search_column_selected"
								onclick="search('0','','','',this,'0_0','9')">不限</span>
							<span id="rc_9_0_1" class="search_column"
								onclick="search('8','0','','c2FsZXNTdGF0dXMjMQ==',this,'0_1','9')"
								style="cursor: pointer">待售</span>
							<span id="rc_9_0_2" class="search_column"
								onclick="search('8','1','','c2FsZXNTdGF0dXMjMQ==',this,'0_2','9')"
								style="cursor: pointer">预售</span>
							<span id="rc_9_0_3" class="search_column"
								onclick="search('8','2','','c2FsZXNTdGF0dXMjMQ==',this,'0_3','9')"
								style="cursor: pointer">在售</span>
							<span id="rc_9_0_4" class="search_column"
								onclick="search('8','3','','c2FsZXNTdGF0dXMjMQ==',this,'0_4','9')"
								style="cursor: pointer">尾盘</span>
							<span id="rc_9_0_5" class="search_column"
								onclick="search('8','4','','c2FsZXNTdGF0dXMjMQ==',this,'0_5','9')"
								style="cursor: pointer">售完</span>
						</td>
					</tr>
					<tr>
						<td class="search_column_span line" valign="top">
							<span>现房期房：</span>
						</td>
						<td valign="top" class="line">
							<span style="cursor: pointer" id="rc_9_1_0"
								class="search_column search_column_selected"
								onclick="search('0','','','',this,'1_0','9')">不限</span>
							<span id="rc_9_1_1" class="search_column"
								onclick="search('8','1','','aXNGb3J3YXJkIzE=',this,'1_1','9')"
								style="cursor: pointer">现房</span>
							<span id="rc_9_1_2" class="search_column"
								onclick="search('8','2','','aXNGb3J3YXJkIzE=',this,'1_2','9')"
								style="cursor: pointer">期房</span>
						</td>
					</tr>
					<tr>
						<td class="search_column_span line" valign="top">
							<span>楼盘类型：</span>
						</td>
						<td valign="top" class="line">
							<span style="cursor: pointer" id="rc_9_2_0"
								class="search_column search_column_selected"
								onclick="search('0','','','',this,'2_0','9')">不限</span>
							<span id="rc_9_2_1" class="search_column"
								onclick="search('8','0','','YnVpbGRpbmdfdHlwZQ==',this,'2_1','9')"
								style="cursor: pointer">住宅</span>
							<span id="rc_9_2_2" class="search_column"
								onclick="search('8','1','','YnVpbGRpbmdfdHlwZQ==',this,'2_2','9')"
								style="cursor: pointer">公寓</span>
							<span id="rc_9_2_3" class="search_column"
								onclick="search('8','2','','YnVpbGRpbmdfdHlwZQ==',this,'2_3','9')"
								style="cursor: pointer">海景房</span>
							<span id="rc_9_2_4" class="search_column"
								onclick="search('8','3','','YnVpbGRpbmdfdHlwZQ==',this,'2_4','9')"
								style="cursor: pointer">别墅</span>
							<span id="rc_9_2_5" class="search_column"
								onclick="search('8','4','','YnVpbGRpbmdfdHlwZQ==',this,'2_5','9')"
								style="cursor: pointer">酒店式公寓</span>
							<span id="rc_9_2_6" class="search_column"
								onclick="search('8','5','','YnVpbGRpbmdfdHlwZQ==',this,'2_6','9')"
								style="cursor: pointer">产权式酒店</span>
						</td>
					</tr>
					
					<tr>
						<td class="search_column_span line" valign="top">
							<span>均&emsp;&emsp;价：</span>
						</td>
						<td valign="top" class="line">
							<span style="cursor: pointer" id="rc_9_3_0"
								class="search_column search_column_selected"
								onclick="search('0','','','',this,'3_0','9')">不限</span>
							<span id="rc_9_3_1" class="search_column"
								onclick="search('3','5000','','YXZlcmFnZV9wcmljZQ==',this,'3_1','9')"
								style="cursor: pointer">5000元以下/㎡</span>
							<span id="rc_9_3_2" class="search_column"
								onclick="search('7','5000','8000','YXZlcmFnZV9wcmljZQ==',this,'3_2','9')"
								style="cursor: pointer">5000-8000元/㎡</span>
							<span id="rc_9_3_3" class="search_column"
								onclick="search('7','8000','10000','YXZlcmFnZV9wcmljZQ==',this,'3_3','9')"
								style="cursor: pointer">8000-1万元/㎡</span>
							<span id="rc_9_3_4" class="search_column"
								onclick="search('7','10000','12000','YXZlcmFnZV9wcmljZQ==',this,'3_4','9')"
								style="cursor: pointer">1万-1.2万元/㎡</span>
							<span id="rc_9_3_5" class="search_column"
								onclick="search('7','12000','15000','YXZlcmFnZV9wcmljZQ==',this,'3_5','9')"
								style="cursor: pointer">1.2万-1.5万元/㎡</span>
							<span id="rc_9_3_6" class="search_column"
								onclick="search('7','15000','20000','YXZlcmFnZV9wcmljZQ==',this,'3_6','9')"
								style="cursor: pointer">1.5万-2万元/㎡</span>
							<span id="rc_9_3_7" class="search_column"
								onclick="search('4','20000','','YXZlcmFnZV9wcmljZQ==',this,'3_7','9')"
								style="cursor: pointer">2万元以上/㎡</span>
						</td>
					</tr>
					<tr>
						<td class="search_column_span line" valign="top">
							<span>装修状况：</span>
						</td>
						<td valign="top" class="line">
							<span style="cursor: pointer" id="rc_9_4_0"
								class="search_column search_column_selected"
								onclick="search('0','','','',this,'4_0','9')">不限</span>
							<span id="rc_9_4_1" class="search_column"
								onclick="search('5','1','','Zml0X2NvbmRpdGlvbg==',this,'4_1','9')"
								style="cursor: pointer">毛坯</span>
							<span id="rc_9_4_2" class="search_column"
								onclick="search('5','2','','Zml0X2NvbmRpdGlvbg==',this,'4_2','9')"
								style="cursor: pointer">简单装修</span>
							<span id="rc_9_4_3" class="search_column"
								onclick="search('5','3','','Zml0X2NvbmRpdGlvbg==',this,'4_3','9')"
								style="cursor: pointer">中档装修</span>
							<span id="rc_9_4_4" class="search_column"
								onclick="search('5','4','','Zml0X2NvbmRpdGlvbg==',this,'4_4','9')"
								style="cursor: pointer">精装修</span>
						</td>
					</tr>
					<tr>
						<td class="search_column_span line" valign="top">
							<span>建筑形式：</span>
						</td>
						<td valign="top" class="line">
							<span style="cursor: pointer" id="rc_9_5_0"
								class="search_column search_column_selected"
								onclick="search('0','','','',this,'5_0','9')">不限</span>
							<span id="rc_9_5_1" class="search_column"
								onclick="search('8','1','','YXJjaF9mb3JtcyMx',this,'5_1','9')"
								style="cursor: pointer">多层</span>
							<span id="rc_9_5_2" class="search_column"
								onclick="search('8','2','','YXJjaF9mb3JtcyMx',this,'5_2','9')"
								style="cursor: pointer">高层</span>
							<span id="rc_9_5_3" class="search_column"
								onclick="search('8','3','','YXJjaF9mb3JtcyMx',this,'5_3','9')"
								style="cursor: pointer">低层</span>
						</td>
					</tr>
					<tr>
						<td class="search_column_span line" valign="top">
							<span>项目特色：</span>
						</td>
						<td valign="top" class="line">
							<span style="cursor: pointer" id="rc_9_6_0"
								class="search_column search_column_selected"
								onclick="search('0','','','',this,'6_0','9')">不限</span>
							<span id="rc_9_6_1" class="search_column"
								onclick="search('5','0','','ZmVhdHVyZXMjMQ==',this,'6_1','9')"
								style="cursor: pointer">特色别墅</span>
							<span id="rc_9_6_2" class="search_column"
								onclick="search('5','1','','ZmVhdHVyZXMjMQ==',this,'6_2','9')"
								style="cursor: pointer">养老居所</span>
							<span id="rc_9_6_3" class="search_column"
								onclick="search('5','2','','ZmVhdHVyZXMjMQ==',this,'6_3','9')"
								style="cursor: pointer">高档小区</span>
							<span id="rc_9_6_3" class="search_column"
								onclick="search('5','3','','ZmVhdHVyZXMjMQ==',this,'6_3','9')"
								style="cursor: pointer">景观居所</span>
							<span id="rc_9_6_3" class="search_column"
								onclick="search('5','4','','ZmVhdHVyZXMjMQ==',this,'6_3','9')"
								style="cursor: pointer">宜居生态</span>
							<span id="rc_9_6_3" class="search_column"
								onclick="search('5','5','','ZmVhdHVyZXMjMQ==',this,'6_3','9')"
								style="cursor: pointer">花园洋房</span>
							<span id="rc_9_6_3" class="search_column"
								onclick="search('5','6','','ZmVhdHVyZXMjMQ==',this,'6_3','9')"
								style="cursor: pointer">投资地产</span>
							<span id="rc_9_6_3" class="search_column"
								onclick="search('5','7','','ZmVhdHVyZXMjMQ==',this,'6_3','9')"
								style="cursor: pointer">创意地产</span>
							<span id="rc_9_6_3" class="search_column"
								onclick="search('5','8','','ZmVhdHVyZXMjMQ==',this,'6_3','9')"
								style="cursor: pointer">水景地产</span>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="sureDiv">
			<input type="button" value="GO/搜索"/>
		</div>
  	</div>
  	<jsp:include page="copyright.jsp"></jsp:include>
  </div>
  </body>
</html>
