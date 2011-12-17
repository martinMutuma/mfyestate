
$(function() {
	$("#auditingState").combobox({
				width : 100,
				panelHeight : 100,
				editable:false 
				
			});
	$("#searchid").linkbutton({
				text : '查询',
				iconCls : 'icon-search'
			});
	$('#projectgrid').datagrid({
		title : '大型项目管理',
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
					title : '案源名称',
					mapping : 'title',
					align : 'center',
					width : 150
				}, {
					field : 'disname',
					title : '所属区域',
					width : 150,
					rowspan : 2,
					align : 'center',
					sortable : true
				}, {
					field : 'paywayString',
					title : '交易类型',
					width : 90,
					align : 'center',
					rowspan : 2
				}, {
					field : 'price',
					title : '价格(万元)',
					align : 'center',
					width : 65,
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
					width : 60,
					rowspan : 2
				}

		]],
		pagination : true,
		rownumbers : true,
		queryParams : {
			name : '',
			auditingState : '-1',
			discode:'-1'
		},
		toolbar : [{
					id : 'btnadd1',
					text : '发布大型项目',
					iconCls : 'icon-add1',
					handler : function() {
						$(this).attr("href", 'projectrelease.jsp?menuCls=17');

					}
				}, '-', {
					iconCls : 'icon-remove1',
					text : '删除大型项目信息',
					iconCls : 'icon-remove1',
					handler : function() {
						var records = $('#projectgrid')
								.datagrid("getSelections");
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
						var url1 = "../largePro/delete.shtml";

						$.ajax({
									url : url1,
									data : "idString=" + ids,
									success : function(msg) {

										var obj = eval('(' + msg + ')');
										var result = obj[0]["message"];
										alert(result);
										$('#projectgrid').datagrid("reload");
									}
								});

					}
				}]
	}

	);
	

});

function onSearch() {
	var queryParams = $('#projectgrid').datagrid("options").queryParams;
	queryParams.name = $("#name").val();
	queryParams.auditingState = $("#auditingState").combobox("getValue");
	queryParams.discode= $("#district").combotree("getValue")=='0000000000'?'-1':$("#district").combotree("getValue");
	$('#projectgrid').datagrid("reload");
}
function Ondelete(id) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	if (confirm("确定删除此条信息吗?")) {

		var url1 = "../largePro/delete.shtml";

		$.ajax({
					url : url1,
					data : "id=" + id,
					success : function(msg) {

						var obj = eval('(' + msg + ')');
						var result = obj[0]["message"];
						alert(result);
						$('#projectgrid').datagrid("reload");
					}
				});

	}
}
function Onmodify(id) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	window.location.href = "../largePro/searchById.shtml?id="+id;
}
