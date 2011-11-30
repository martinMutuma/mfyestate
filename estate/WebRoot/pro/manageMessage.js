// 生意转让脚本
$(function() {
     $("#category").combobox({
				width :100,
				panelHeight : 100
			});
	 $("#price1").combobox({
				width : 50,
				panelHeight : 100
			});
	 $("#price2").combobox({
				width : 50,
				panelHeight : 100
			});
	$("#auditingState").combobox({
				width : 100,
				panelHeight : 100
			});
	$("#searchid").linkbutton({
				text : '查询',
				iconCls : 'icon-search'
			});
	$('#messagegrid').datagrid({
		title : '生意转让管理',
		idField : 'id',
		width : 760,
		height : 400,
		nowrap : false,
		striped : true,
		collapsible : false,
		url : '../business/search.shtml',
		frozenColumns : [[{
					field : 'ck',
					title : '选择',
					checkbox : true
				}]],
		columns : [[{
					title : '基本信息',
					colspan : 5
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
					title : '名称',
					mapping : 'title',
					align : 'center',
					width : 162
				}, {
					field : 'disname',
					title : '所属区域',
					align : 'center',
					width : 145,
					rowspan : 2,
					sortable : true

				}, {
					field : 'price',
					title : '转让价格(万元)',
					width : 100,
					align : 'center',
					rowspan : 2
				},
				{
					field : 'createTimeString',
					title : '发布时间',
					width : 100,
					align : 'center',
					rowspan : 2
				}, {
					field : 'audtingString',
					title : '状态',
					align : 'center',
					width : 80,
					rowspan : 2
				}

		]],
		pagination : true,
		rownumbers : true,
		queryParams : {
			name : '',
			auditingState : '-1',
			category:'-1',
			price1:'-1',
			price2:'-1',
			discode:'-1'
		},
		toolbar : [{
					id : 'btnadd',
					text : '发布信息',
					iconCls : 'icon-add1',
					handler : function() {
						$(this).attr("href", 'sendMessage.jsp?menuCls=15');

					}
				}, '-', {
					id : 'btnsave',
					text : '删除信息',
					iconCls : 'icon-remove1',
					handler : function() {
						var records = $('#messagegrid')
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
						var url1 = "../business/deleteBusiness.shtml";

						$.ajax({
									url : url1,
									data : "idString=" + ids + "&type=1",
									success : function(msg) {

										var obj = eval('(' + msg + ')');
										var result = obj[0]["message"];
										alert(result);
										$('#messagegrid').datagrid("reload");
									}
								});

					}
				}]
	}

	);


});

function onSearch() {
      var category= $("#category").combobox("getValue");
      var price1= $("#price1").combobox("getValue");
      var price2= $("#price2").combobox("getValue");
       if(price1==-1 && price2!=-1){
         alert('选择的转让价格不符合要求，先选转让价格的最小值');
         return;
      }
      
       if(parseInt(price1)>parseInt(price2)){
         alert('选择的转让价格不符合要求，转让价格的最小值应小于转让价格的最大值');
         return;
        }
	var queryParams = $('#messagegrid').datagrid("options").queryParams;
	queryParams.name = $("#name").val();
	queryParams.auditingState = $("#auditingState").combobox("getValue");
	queryParams.category =category;
	queryParams.price1 =price1;
	queryParams.price2 =price2;
	queryParams.discode= $("#discode").combotree("getValue")=='0000000000'?'-1':$("#discode").combotree("getValue");
	$('#messagegrid').datagrid("reload");
}
function Ondelete(id) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	if (confirm("确定删除此条信息吗?")) {

		var url1 = "../business/deleteBusiness.shtml";
		$.ajax({
					url : url1,
					data : "id=" + id,
					success : function(msg) {

						var obj = eval('(' + msg + ')');
						var result = obj[0]["message"];
						alert(result);
						$('#messagegrid').datagrid("reload");
					}
				});

	}
}
function Onmodify(id) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	window.location.href = "../business/searchById.shtml?menuCls=15&id=" + id;
}
