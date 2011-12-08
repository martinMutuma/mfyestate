// 写字楼出租脚本
$(function() {
//init district tree
	$("#discode").combotree({
	    url:'',
	    animate:false,
	    onShowPanel:function(){
	    	var dataUrl = '<%=basePath%>district/bulidDistrictTree.shtml?level=5&districtCode=0000000000&t='+(new Date()).getTime().toString(36);
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
	   	}
	});
	$("#searchid").linkbutton({
				text : '查询',
				iconCls : 'icon-search'
			});
	$('#rentgrid').datagrid({
		title : '住宅管理',
		idField : 'id',
		width : 760,
		height : 400,
		nowrap : false,
		striped : true,
		collapsible : false,
		url : '../secondBd/search.shtml',
		loadMsg:'请等待...',
		frozenColumns : [[{
					field : 'ck',
					title : '选择',
					align : 'center',
					checkbox : true
				}]],
		columns : [[{
					title : '基本信息',
					colspan : 7
				}, {
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,
					formatter : function(value, rec) {
						if (rec.id == undefined)
							return null;
						else
							return '<span style="color:red"><span onclick=seeBulid('
									+ rec.id
									+ ')><font style="cursor:pointer;color:blue;">查看</font></span> <span style="color:red"><span onclick=Onmodify("'
									+ rec.id
									+ '")><font style="cursor:pointer;color:blue;">修改</font></span> <span onclick=Ondelete("'
									+ rec.id + '")><font style="cursor:pointer;color:blue;">删除</span></span>';
					}
				}], [{
					field : 'name',
					title : '住宅名称',
					align : 'center',
					width : 145
				}, {
					field : 'respDistrict',
					title : '小区名称',
					width : 120,
					align : 'center',
					sortable : true

				}, {
					field : 'consArea',
					title : '建筑面积(㎡)',
					width : 80,
					align : 'center'
				}, {
					field : 'price',
					title : '租金(元/月)',
					width : 70,
					align : 'center'
				}, {
					field : 'age',
					title : '房龄',
					width : 60,
					align : 'center'
				}, {
					field : 'fitCondition',
					title : '装修状况',
					align : 'center',
					width : 60,
					formatter:function(value,rec){
						if(value == "")
							return "";
						value = parseInt(value,10);
						switch(value){
							case 1:return "毛坯";
							case 2:return "简装";
							case 3:return "中等装修";
							case 4:return "精装";
							case 5:return "豪装";
						}
					}
				}, {
					field : 'auditingState',
					title : '状态',
					align : 'center',
					width : 60,
					formatter:function(value,rec){
						if(value == "")
							return "";
						value = parseInt(value,10);
						switch(value){
							case 0:return "未审核";
							case 1:return "已审核";
							case 3:return "审核驳回";
							case 4:return "申请成交";
							case 5:return "成交通过";
							case 7:return "成交驳回";
						}
					}
				}

		]],
		pagination : true,
		rownumbers : true,
		queryParams : {
			type : '1',
			name : '',
			auditingState : '-1',
			flag:'1',
			area1:'-1',
			area2:'-1',
			price1:'-1',
			price2:'-1',
			discode:'-1'
		},
		toolbar : [{
					id : 'btnadd',
					text : '添加出租信息',
					iconCls : 'icon-add',
					handler : function() {
						$(this).attr("href", '../pro/secondBuilding_rentInfo.jsp?menuCls=12');

					}
				}, '-', {
					id : 'btnsave',
					text : '删除出租信息',
					iconCls : 'icon-remove1',
					handler : function() {
						var records = $('#rentgrid').datagrid("getSelections");
						var ids = '';
						if (null == records || records == "") {
							$.messager.alert('删除操作','请选择要删除的记录','error',function(){
							})
							return;
						}
						for (var i = 0; i < records.length; i++) {
							if (records[i].id == undefined || records[i].id == "undefined"){
								$.messager.alert('删除操作','请选择要删除的记录','error',function(){})
								return;
							}
							ids += records[i].id;
							ids += '_';
						}
						
						$.messager.confirm('删除记录', '请确认要删除记录吗?', function(btn) {
								if (btn) {
									var url1 = "../secondBd/deleteSBrent.shtml";
									$.ajax({
										url : url1,
										data : "ids=" + ids,
										success : function(msg) {
											if(msg == "success"){
												alert("删除成功!");
											}else{
												alert("删除失败!")
											}
											$('#rentgrid').datagrid("reload");
										}
									});
								}
						});
					}
				}]
	}
	);
});

function onSearch() {
	var queryParams = $('#rentgrid').datagrid("options").queryParams;
	queryParams.name = $("#name").val();
	$('#rentgrid').datagrid("reload");
}
function Ondelete(id) {
	if (id == "undefined") {
		$.messager.alert('删除操作','此条记录已删除','error',function(){})
		return;
	}
	$.messager.confirm('删除记录', '请确认要删除记录吗?', function(btn) {
		if (btn) {
			var url1 = "../secondBd/deleteSBrent.shtml";
			$.ajax({
					url : url1,
					data : "tpsId=" + id,
					success : function(msg) {
						if(msg == "success"){
							alert("删除成功!");
						}else{
							alert("删除失败!")
						}
						$('#rentgrid').datagrid("reload");
					}
				});
			}
		});
}
function Onmodify(id) {
	if (id == "undefined") {
		$.messager.alert('修改操作','此条记录已删除','error',function(){})
		return ;
	}
	window.location.href = "../secondBd/toUpdateRent.shtml?tpsId=" + id;
}
function seeBulid(id){
	window.location.href = "../secondBd/showBuliding.shtml?tpsId=" + id+"&menuIndex=4";
}