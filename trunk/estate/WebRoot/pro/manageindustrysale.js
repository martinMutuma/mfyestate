// 工业地产出售脚本
$(function() {
    $("#category").combobox({
				width :100,
				panelHeight : 100
			});
	  $("#area1").combobox({
				width : 70,
				panelHeight : 100
			});
	 $("#area2").combobox({
				width :70,
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
	$('#salegrid').datagrid({
		title : '工业地产管理出售',
		idField : 'id',
		width : 760,
		height : 400,
		nowrap : false,
		striped : true,
		collapsible : false,
		url : '../industry/search.shtml',
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
									+ '")><font style="cursor:pointer">修改</span></font> <span onclick=Ondelete("'
									+ rec.id + '")><font style="cursor:pointer">删除</font></span></span>';
					}
				}], [{
					field : 'title',
					title : '案源名称',
					mapping : 'title',
					width : 130
				}, {
					field : 'disname',
					title : '所属区域',
					width : 120,
					rowspan : 2,
					sortable : true

				}, {
					field : 'bursary',
					title : '售价(万元)',
					width : 150,
					rowspan : 2
				},

				{
					field : 'createTimeString',
					title : '发布时间',
					width : 100,
					rowspan : 2
				}, {
					field : 'audtingString',
					title : '状态',
					width : 100,
					rowspan : 2
				}

		]],
		pagination : true,
		rownumbers : true,
		queryParams : {
			type : '2',
			name : '',
			auditingState : '-1',
			category:'-1',
			area1:'-1',
			area2:'-1',
			discode:'-1'
		},
		toolbar : [{
					id : 'btnadd',
					text : '发布出售',
					iconCls : 'icon-add1',
					handler : function() {
						$(this).attr("href", 'industrysale.jsp');

					}
				}, '-', {
					id : 'btnsave',
					text : '删除出售信息',
					iconCls : 'icon-remove1',
					handler : function() {
						var records = $('#salegrid').datagrid("getSelections");
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
						var url1 = "../industry/delete.shtml";

						$.ajax({
									url : url1,
									data : "idString=" + ids + "&type=2",
									success : function(msg) {

										var obj = eval('(' + msg + ')');
										var result = obj[0]["message"];
										alert(result);
										window.location.reload();

									}
								});

					}
				}]
	}

	);

});

function onSearch() {
      var arear1= $("#area1").combobox("getValue");
      var arear2= $("#area2").combobox("getValue");
       if(arear1==-1 && arear2!=-1){
         alert('选择的面积不符合要求，先选面积最小值');
         return;
      }
      
       if(parseInt(arear1)>parseInt(arear2)){
         alert('选择的面积不符合要求，面积最小值应小于面积最大值');
         return;
        }
	var queryParams = $('#salegrid').datagrid("options").queryParams;
	queryParams.name = $("#name").val();
	queryParams.auditingState = $("#auditingState").combobox("getValue");
	queryParams.area1 =arear1;
	queryParams.area2 =arear2;
	queryParams.category =$("#category").combobox("getValue");
	queryParams.discode= $("#discode").combotree("getValue");
	$('#salegrid').datagrid("reload");
}
function Ondelete(id) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	if (confirm("确定删除此条信息吗?")) {

		var url1 = "../industry/delete.shtml";

		$.ajax({
					url : url1,
					data : "id=" + id + "&type=2",
					success : function(msg) {

						var obj = eval('(' + msg + ')');
						var result = obj[0]["message"];
						alert(result);
						window.location.reload();

					}
				});

	}
}
function Onmodify(id) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	window.location.href = "../industry/searchById.shtml?id=" + id + "&type=2";
}
