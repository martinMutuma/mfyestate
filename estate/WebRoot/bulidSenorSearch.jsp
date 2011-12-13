<%@ page language="java" pageEncoding="UTF-8"%>
<div id="searchPanel" align="center">
	<table cellpadding="0" border="0" cellspacing="0" width="920px">
		<tr>
			<td class="search_column_span line" valign="top">
				<span>销售状态：</span>
			</td>
			<td valign="top" class="line">
				<span style="cursor: pointer" id="rc_9_0_0"
					class="search_column search_column_selected"
					onclick="search('0','','','',this,'0_0','9')">不限</span>
				<span id="rc_9_0_1" class="search_column"
					onclick="search('8','0','','c2FsZXNfU3RhdHVzIzE=',this,'0_1','9')"
					style="cursor: pointer">待售</span>
				<span id="rc_9_0_2" class="search_column"
					onclick="search('8','1','','c2FsZXNfU3RhdHVzIzE=',this,'0_2','9')"
					style="cursor: pointer">预售</span>
				<span id="rc_9_0_3" class="search_column"
					onclick="search('8','2','','c2FsZXNfU3RhdHVzIzE=',this,'0_3','9')"
					style="cursor: pointer">在售</span>
				<span id="rc_9_0_4" class="search_column"
					onclick="search('8','3','','c2FsZXNfU3RhdHVzIzE=',this,'0_4','9')"
					style="cursor: pointer">尾盘</span>
				<span id="rc_9_0_5" class="search_column"
					onclick="search('8','4','','c2FsZXNfU3RhdHVzIzE=',this,'0_5','9')"
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
					onclick="search('8','1','','aXNfZm9yd2FyZCMx',this,'1_1','9')"
					style="cursor: pointer">现房</span>
				<span id="rc_9_1_2" class="search_column"
					onclick="search('8','2','','aXNfZm9yd2FyZCMx',this,'1_2','9')"
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
	</table>
</div>
<div id="ts" align="left">
	楼盘特色：
	<span id="lpts"><a id="lpts_0" href="javascript:lptsSearch('')">不限</a><a
		class="" id="lpts_1" href="javascript:lptsSearch('0')">特色别墅</a><a
		class="" id="lpts_2" href="javascript:lptsSearch('1')">养老居所</a><a
		class="" id="lpts_3" href="javascript:lptsSearch('2')">高档小区</a><a
		class="" id="lpts_4" href="javascript:lptsSearch('3')">景观居所</a><a
		class="" id="lpts_5" href="javascript:lptsSearch('4')">宜居生态</a><a
		class="" id="lpts_6" href="javascript:lptsSearch('5')">花园洋房</a><a
		class="" id="lpts_7" href="javascript:lptsSearch('6')">投资地产</a><a
		class="" id="lpts_8" href="javascript:lptsSearch('7')">创意地产</a><a
		class="" id="lpts_9" href="javascript:lptsSearch('8')">水景地产</a> </span>
</div>
