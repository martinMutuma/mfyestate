// 项目需求脚本
$(function() {
	$("#flag").combobox({
				width : 80,
				panelHeight : 70
			});
	$("#auditing").combobox({
				width : 80,
				panelHeight : 70
			});
	$("#searchid").linkbutton({
				text : '查询',
				iconCls : 'icon-search'
			});
	$('#grid').datagrid({
		title : '项目需求管理',
		idField : 'id',
		width : 760,
		height : 400,
		nowrap : false,
		striped : true,
		collapsible : false,
		url : '../largePro/search.shtml',
		frozenColumns : [[{
					field : 'ck',
					title : '选择',
					checkbox : true
				}]],
		columns : [[{
					title : '基本信息',
					colspan : 6
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
							return '<span style="color:red"><span onclick=Onmodify("'
									+ rec.id
									+ '")><font style="cursor:pointer;color:blue;">修改</font></span> <span onclick=Ondelete("'
									+ rec.id + '")><font style="cursor:pointer;color:blue;">删除</font></span></span>';
					}
				}], [{
					field : 'title',
					title : '标题',
					mapping : 'title',
					align : 'center',
					width : 150
				}, {
					field : 'flagString',
					title : '租售',
					width : 80,
					align : 'center',
					rowspan : 2,
					sortable : true
				}, {
					field : 'disname',
					title : '所属区域',
					align : 'center',
					width : 150,
					rowspan : 2
				}, {
					field : 'priceString',
					title : '租金/售价(万元)',
					width : 90,
					align : 'center',
					rowspan : 2
				}, {
					field : 'createTimeString',
					title : '发布时间',
					align : 'center',
					width : 80,
					rowspan : 2
				}, {
					field : 'audtingString',
					title : '状态',
					align : 'center',
					width : 65,
					rowspan : 2
				}

		]],
		pagination : true,
		rownumbers : true,
		queryParams : {
			flag : '0',
			auditingState : '-1',
			type : '4'
		},
		toolbar : [{
					id : 'btnadd1',
					text : '增加需求',
					iconCls : 'icon-add1',
					handler : function() {
						$(this).attr("href", 'mgprodemand.jsp?menuCls=17');
					}
				}, '-', {
			
					text : '删除需求',
					iconCls : 'icon-remove1',
					handler : function() {
						var records = $('#grid').datagrid("getSelections");
						var ids = '';
						if (null == records || records == "") {
							alert('请选择要删除的记录');
							return;
						}
						for (var i = 0; i < records.length; i++) {
							if (records[i].id == undefined
									|| records[i].id == "undefined") {

								alert('此条记录已不存在');
								return;
							}
							ids += records[i].id;
							ids += '_';
						}
						$.messager.confirm('删除记录', '请确认要删除记录吗?', function(btn) {
							if (btn) {
							var url1 = "../largePro/delete.shtml";
							$.ajax({
									url : url1,
									data : "idString=" + ids + "&type=4",
									success : function(msg) {
										var obj = eval('(' + msg + ')');
										var result = obj[0]["message"];
										alert(result);
										window.location.reload();
									}
								});
						}});
					}
				}]
	}

	);


});

function onSearch() {
	var queryParams = $('#grid').datagrid("options").queryParams;
	queryParams.flag = $("#flag").combobox("getValue");
	queryParams.auting = $("#auditing").combobox("getValue");
	$('#grid').datagrid("reload");
}
function Ondelete(id) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	$.messager.confirm('删除记录', '请确认要删除记录吗?', function(btn) {
	if (btn) {
		var url1 = "../largePro/delete.shtml";
		$.ajax({
					url : url1,
					data : "id=" + id + "&type=4",
					success : function(msg) {

						var obj = eval('(' + msg + ')');
						var result = obj[0]["message"];
						alert(result);
						window.location.reload();

					}
				});
	}});
}
function Onmodify(id) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	window.location.href = "../largePro/searchById.shtml?id=" + id
			+ "&type=4";
}
