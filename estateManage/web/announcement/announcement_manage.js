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
		url : '../announcement/manage.shtml',
		loadMsg:'请等待...',
		frozenColumns : [[{
					field : 'ck',
					title : '选择',
					align : 'center',
					checkbox : true
				}]],
		columns : [[{
					field : 'title',
					title : '公告标题',
					align : 'center',
					width : 300
				},{
					field : 'invailid',
					title : '状态',
					align : 'center',
					width : 100,
					formatter:function(value,rec){
						if (rec.id == undefined)
							return null;
						return true==value?"有效":"失效";
					}
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
							return '<span style="color:red" class="fun"><a href=javascript:Onmodify("'
									+ rec.id
									+ '")><font style="cursor:pointer">修改</font></a>&nbsp;&nbsp;<a href=javascript:Ondelete("'
									+ rec.id
									+ '")><font style="cursor:pointer">删除</font></a></span>';
					}
				}

		]],
		toolbar : [{
					id : 'addAnnouncement',
					text : '添加公告',
					iconCls : 'icon-add',
					handler : function() {
						addTab('公告添加','../announcement/annouccement_info.jsp','add');
					}
				}],
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
			var url1 = "../announcement/delete.shtml";
			$.ajax({
					url : url1,
					data : "id=" + id,
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
	addTab('公告维护','../announcement/toModify.shtml?id=' + id,'add');
}

