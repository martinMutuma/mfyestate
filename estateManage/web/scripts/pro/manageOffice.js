// 写字楼出租脚本
$(function() {
    $("#discode").combotree({
				width : 160,
				panelHeight : 200
			});
	 $("#auditingState").combobox({
				width : 100,
				panelHeight : 160
			});
	 $("#tbtype").combobox({
				width :100,
				panelHeight : 200
			});
	 $("#tflag").combobox({
				width :100,
				panelHeight : 80
			});
	$("#searchid").linkbutton({
				text : '查询',
				iconCls : 'icon-search'
			});
	$('#rentgrid').datagrid({
		title : '写字楼管理出租',
		idField : 'id',
		width:'100%',
		height : 400,
		nowrap : false,
		striped : true,
		collapsible : false,
		url : '../office/search.shtml',
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
							return '<span style="color:red"><span onclick=onAudit("'
									+ rec.id+'","'+rec.flag
									+ '")><font style="cursor:pointer">审核</font></span> <span onclick=onDelete("'
									+ rec.id + '")><font style="cursor:pointer">删除</font></span></span>';
					}
				}], [{
					field : 'title',
					title : '案源名称',
					mapping : 'title',
					align : 'center',
					width : 160
				}, {
					field : 'name',
					title : '所属物业',
					width : 160,
					rowspan : 2,
					align : 'center',
					sortable : true,
					formatter:function(value,rec){
						  return  value;
					}
				}, {
					field : 'disname',
					title : '地区',
					width : 80,
					align : 'center',
					rowspan : 2
				},  {
					field : 'price',
					title : '租金(元/平方米·天)',
					width : 120,
					align : 'center',
					rowspan : 2
				}, {
					field : 'area',
					title : '面积(平方米)',
					width : 100,
					align : 'center',
					rowspan : 2
				}, {
					field : 'createTimeString',
					title : '发布时间',
					width : 100,
					align : 'center',
					rowspan : 2
				}, {
					field : 'audtingString',
					title : '状态',
					align : 'center',
					width : 100,
					rowspan : 2
				}
		]],
		pagination : true,
		rownumbers : true,
		queryParams : {
			discode:'0000000000',
			auditingState : '0',
			tbtype : '',
			tflag : ''
		} ,
		toolbar : [
		/*{
				id : 'btnadd',
				text : '审核信息',
				iconCls : 'icon-add',
				handler : function() {
				var records = $('#rentgrid').datagrid("getSelections");
				if (null == records || records == "") {
					alert('请选择要核实的记录');
					return;
				}
				if (records.length>1) {
					alert('只能逐条审核');
					return;
				}
				for (var i = 0; i < records.length; i++) {
					if (records[i].id == undefined || records[i].id == "undefined"){
						alert('此条记录已不存在');
						return;
					}
				}
				$.messager.confirm('审核记录', '请确认要审核记录吗?', function(btn) {
					if (btn) {
						var url1 = "../office/searchById.shtml";
						$.ajax({
							url : url1,
							data : "type="+records[0].flag+"&id=" + records[0].id,
							success : function(msg) {
								//var obj = eval('(' + msg + ')');
								//var result = obj[0]["message"];
								//alert(result);
								window.location.reload();
							}
						});
					}
				})
			}
		}, '-',*/ {
			id : 'btnsave',
			text : '删除信息',
			iconCls : 'icon-save',
			handler : function() {
				var records = $('#rentgrid').datagrid("getSelections");
				var ids = '';
				if (null == records || records == "") {
					alert('请选择要删除的记录');
					return;
				}
				for (var i = 0; i < records.length; i++) {
					if (records[i].id == undefined || records[i].id == "undefined"){
						alert('此条记录已不存在');
						return;
					}
					ids += records[i].id;
					ids += '_';
				}
				$.messager.confirm('删除记录', '请确认要删除记录吗?', function(btn) {
				if (btn) {
				var url1 = "../office/delete.shtml";
				$.ajax({
					url : url1,
					data : "idString=" + ids,
					success : function(msg) {
						//var obj = eval('(' + msg + ')');
						//var result = obj[0]["message"];
						//alert(result);
						window.location.reload();
					}
				});
				}})
			}
		}]
	}
	);
});
function onSearch() {
    var discode= $("#discode").combotree("getValue");
    if(discode=='全  国')discode='0000000000';
    var auditingState= $("#auditingState").combobox("getValue");
    var tbtype= $("#tbtype").combobox("getValue");
    var tflag= $("#tflag").combobox("getValue");
	var queryParams = $('#rentgrid').datagrid("options").queryParams;
	queryParams.discode = discode;
	queryParams.auditingState = auditingState;
	queryParams.tbtype = tbtype;
	queryParams.tflag = tflag;
	$('#rentgrid').datagrid("reload");
}

function onDelete(id) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	$.messager.confirm('删除记录', '请确认要删除记录吗?', function(btn) {
		if (btn) {
		var url1 = "../office/delete.shtml";
		$.ajax({
			url : url1,
			data : "idString=" + id,
			success : function(msg) {
			//	var obj = eval('(' + msg + ')');
			//	var result = obj[0]["message"];
			//	alert(result);
				window.location.reload();
			}
		});
		}})
}

function onAudit(id,type) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	window.location.href = "../office/searchById.shtml?type="+type+"&id=" + id
}
