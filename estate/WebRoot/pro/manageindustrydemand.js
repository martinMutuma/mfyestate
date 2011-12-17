// 工业地产需求管理脚本
$(function() {
	$("#flag").combobox({
				width : 80,
				panelHeight : 70,
				editable:false 
				
			});
	$("#auditing").combobox({

				width : 80,
				panelHeight : 70,
				editable:false 
				
			});

	$("#searchid").linkbutton({
				text : '查询',
				iconCls : 'icon-search'
			});
	$('#grid').datagrid({
		title : '工业地产需求管理',
		idField : 'id',
		width : 760,
		height : 400,
		nowrap : false,
		striped : true,
		collapsible : false,
		url : '../officeneed/search.shtml',
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
					width:100,
					align : 'center',
					rowspan : 2,
					formatter : function(value, rec) {
						if (rec.id == undefined)
							return null;
						else
							return '<span style="cursor:pointer;color:blue;"><span style="cursor:pointer;color:blue;" onclick=Onmodify("'
									+ rec.id
									+ '")>修改</span> <span style="cursor:pointer;color:blue;"  onclick=Ondelete("'
									+ rec.id + '")>删除</span></span>';
					}
				}], [{
					field : 'title',
					title : '标题',
					mapping : 'title',
					width : 150
				}, {
					field : 'flagString',
					title : '租售',
					width : 80,
					rowspan : 2,
					sortable : true

				}, {
					field : 'disname',
					title : '所属区域',
					width : 80,
					rowspan : 2
				}, {
					field : 'priceString',
					title : '租金/售价(万元)',
					width : 100,
					rowspan : 2
				}, {
					field : 'auditing',
					title : '审核状态',
					width : 100,
					rowspan : 2,
					formatter : function(value, rec) {
						   if(value=='0')return '未审核';
						   if(value=='1')return '审核成功';
						   if(value=='2')return '审核失败';
						   if(value=='3')return '审核驳回';
						   if(value=='4')return '申请成交';
						   if(value=='5')return '成交通过';
						   if(value=='6')return '成交失败';
						  if(value=='7')return '成交驳回';
						
					}
				}, {
					field : 'createTimeString',
					title : '发布时间',
					width : 80,
					rowspan : 2
				}

		]],
		pagination : true,
		rownumbers : true,
		queryParams : {
			flag : '0',
			auting: '0',
			type : '3'
		},
		toolbar : [{
					id : 'btnadd',
					text : '增加需求',
					iconCls : 'icon-add1',
					handler : function() {
						$(this).attr("href", 'industrydemand.jsp');

					}
				}, '-', {
					id : 'btnsave',
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
						var url1 = "../officeneed/delete.shtml";

						$.ajax({
									url : url1,
									data : "idString=" + ids + "&type=3",
									success : function(msg) {

										var obj = eval('(' + msg + ')');
										var result = obj[0]["message"];
										alert(result);
										$('#grid').datagrid("reload");

									}
								});

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
	if (confirm("确定删除此条信息吗?")) {
		var url1 = "../officeneed/delete.shtml";

		$.ajax({
					url : url1,
					data : "id=" + id + "&type=3",
					success : function(msg) {

						var obj = eval('(' + msg + ')');
						var result = obj[0]["message"];
						alert(result);
						$('#grid').datagrid("reload");

					}
				});

	}
}
function Onmodify(id) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	window.location.href = "../officeneed/searchById.shtml?id=" + id
			+ "&type=3";
}
