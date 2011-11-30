// 写字楼出租脚本
$(function() {
//init district tree
	initTab('楼盘列表')
	$("#searchid").linkbutton({
				text : '查询',
				iconCls : 'icon-search'
			});
	$('#rentgrid').datagrid({
		title : '楼盘管理',
		idField : 'id',
		width : '100%',
		height : 400,
		nowrap : false,
		striped : true,
		collapsible : false,
		url : '../special/searchBuliding.shtml',
		loadMsg:'请等待...',
		frozenColumns : [[{
					field : 'ck',
					title : '选择',
					align : 'center',
					checkbox : true
				}]],
		columns : [[{
					title : '基本信息',
					colspan : 6
				}, {
					field : 'opt',
					title : '操作',
					width : 120,
					align : 'center',
					rowspan : 2,
					formatter : function(value, rec) {
						if (rec.id == undefined)
							return null;
						else
							return '<span style="color:red" class="fun"><a href=javascript:special("'
									+ rec.id
									+ '")><font style="cursor:pointer">团购/特价房设置</font></a></span>';
					}
				}], [{
					field : 'name',
					title : '楼盘名称',
					align : 'center',
					width : 100
				}, {
					field : 'buildingtype',
					title : '楼盘类型',
					width : 120,
					align : 'center',
					sortable : true,
					formatter:function(value,rec){
						if(undefined != value){
							switch(parseInt(value,10)){
								case 0: return "住宅";
								case 1: return "公寓";
								case 2: return "海景房";
								case 3: return "别墅";
								case 4: return "酒店式公寓";
								case 5: return "产权式公寓";
							}
						}
					}
				}, {
					field : 'features',
					title : '项目特色',
					width : 105,
					align : 'center',
					formatter:function(value,rec){
						if(undefined != value){
							switch(parseInt(value,10)){
								case 0: return "特色别墅";
								case 1: return "养老居所";
								case 2: return "高档小区";
								case 3: return "景观居所";
								case 4: return "宜居生态";
								case 5: return "花园洋房";
								case 6: return "投资地产";
								case 7: return "创意地产";
								case 8: return "水景地产";
							}
						}
					}
				}, {
					field : 'disname',
					title : '地区名称',
					width : 100,
					align : 'center'
				}, {
					field : 'address',
					title : '地址',
					width : 150,
					align : 'center',
					formatter:function(value,rec){
						return '<div align=left>'+value+'</div>';
					}
				}, {
					field : 'opendate',
					title : '开盘日期',
					align : 'center',
					width : 100,
					formatter:function(value,rec){
						return undefined!=value?value.split("T")[0]:"";
					}
				}

		]],
		pagination : true,
		rownumbers : true
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
			var url1 = "../special/deleteSB.shtml";
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
		$.messager.alert('删除操作','此条记录已删除','error',function(){})
		return ;
	}
	window.location.href = "../special/toUpdate.shtml?tpsId=" + id;
}

function special(id){
	addTab('团购设置','../special/toSpecial.shtml?id='+id,id);
}
