// 写字楼出租脚本
$(function() {
//init district tree
	initTab('写字楼管理');
	$("#searchid").linkbutton({
				text : '查询',
				iconCls : 'icon-search'
			});
	$('#rentgrid').datagrid({
		title : '写字楼列表',
		idField : 'id',
		width : '100%',
		height : 363,
		nowrap : false,
		striped : true,
		collapsible : false,
		loadMsg:'请等待...',
		frozenColumns : [[{
					field : 'ck',
					title : '选择',
					align : 'center',
					checkbox : true
				}]],
		columns : [[{
					field : 'title',
					title : '案源标题',
					align : 'center',
					width : 300,
					formatter:function(value){
						return '<div align=left>'+value+'</div>';
					}
				},{
					field : 'name',
					title : '写字楼名称',
					align : 'center',
					width : 150,
					formatter:function(value){
						return '<div align=left>'+value+'</div>';
					}
				},{
					field : 'category',
					title : '写字楼类型',
					align : 'center',
					width : 120,
					formatter:function(value){
						if(value != ""){
							switch(parseInt(value,10)){
								case 1:return "纯写字楼";
								case 2:return "商住楼";
								case 3:return "酒店式公寓";
								case 4:return "园区办公";
								case 5:return "商务中心";
								case 6:return "其他类型";
								default:return "其他类型";
							}
						}
						return '其他类型';
					}
				},{
					field : 'area',
					title : '建筑面积(㎡)',
					align : 'center',
					width : 100,
					formatter:function(value,rec){
						if(!isNaN(value))
							return value.toFixed(0);
					}
				}

		]],
		toolbar : [{
					id : 'addAnnouncement',
					text : '显示出租列表',
					iconCls : 'icon-search',
					handler : function() {
						onSearch("1");
					}
				},{
					id : 'addAnnouncement',
					text : '显示出售列表',
					iconCls : 'icon-search',
					handler : function() {
						onSearch("2");
					}
				},{
					id : 'addAnnouncement',
					text : '数据同步',
					iconCls : 'icon-save',
					handler : function() {
						onSearch("2");
					}
				}],
		pagination : true,
		rownumbers : true
	}
	);
});

function onSearch(type) {
	var queryParams = $('#rentgrid').datagrid("options").queryParams;
	queryParams.type = type;
	$('#rentgrid').datagrid("reload");
}


