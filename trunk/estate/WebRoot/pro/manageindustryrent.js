// 工业地产出租脚本
$(function() {
    $("#category").combobox({
				width :100,
				panelHeight : 100,
				editable:false 
				
			});
	  $("#area1").combobox({
				width : 70,
				panelHeight : 100,
				editable:false 
				
			});
	 $("#area2").combobox({
				width :70,
				panelHeight : 100,
				editable:false 
				
			});
	 $("#price1").combobox({
				width : 50,
				panelHeight : 100,
				editable:false 
				
			});
	 $("#price2").combobox({
				width : 50,
				panelHeight : 100,
				editable:false 
				
			});
	$("#auditingState").combobox({
				width : 100,
				panelHeight : 100,
				editable:false 
				
			});
	$("#searchid").linkbutton({
				text : '查询',
				iconCls : 'icon-search'
			});
	$('#rentgrid').datagrid({
		title : '工业地产管理出租',
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
					width : 145,
					align : 'center',
					rowspan : 2,
					sortable : true
				}, {
					field : 'bursary',
					title : '年租金(万元)',
					align : 'center',
					width : 90,
					rowspan : 2
				},
				{
					field : 'createTimeString',
					title : '发布时间',
					align : 'center',
					width : 130,
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
			type : '1',
			name : '',
			auditingState : '-1',
			category:'-1',
			price1:'-1',
			price2:'-1',
			discode:'-1',
			area1:'-1',
			area2:'-1',
			discode:'-1'
		},
		toolbar : [{
					id : 'btnadd',
					text : '发布出租',
					iconCls : 'icon-add1',
					handler : function() {
						$(this).attr("href", 'industryrent.jsp');

					}
				}, '-', {
					id : 'btnsave',
					text : '删除出租信息',
					iconCls : 'icon-remove1',
					handler : function() {
						var records = $('#rentgrid').datagrid("getSelections");
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
									data : "idString=" + ids + "&type=1",
									success : function(msg) {

										var obj = eval('(' + msg + ')');
										var result = obj[0]["message"];
										alert(result);
										$('#rentgrid').datagrid("reload");
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
      var price1= $("#price1").combobox("getValue");
      var price2= $("#price2").combobox("getValue");

      if(arear1==-1 && arear2!=-1){
         alert('选择的面积不符合要求，请选面积的最小值');
         return;
      }
      
       if(parseInt(arear1)>parseInt(arear2)){
         alert('选择的面积不符合要求，面积的最小值应小于面积的最大值');
         return;
        }
       if(price1==-1 && price2!=-1){
         alert('选择的租金不符合要求，请选租金的最小值');
         return;
      }
      
       if(parseInt(price1)>parseInt(price2)){
         alert('选择的租金不符合要求，租金的最小值应小于租金的最大值');
         return;
        }
	var queryParams = $('#rentgrid').datagrid("options").queryParams;
	queryParams.name = $("#name").val();
	queryParams.auditingState = $("#auditingState").combobox("getValue");
	queryParams.area1 =arear1;
	queryParams.area2 =arear2;
	queryParams.category = $("#category").combobox("getValue");
	queryParams.discode= $("#discode").combotree("getValue");
	queryParams.price1 =price1;
	queryParams.price2 =price2;
	$('#rentgrid').datagrid("reload");
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
					data : "id=" + id + "&type=1",
					success : function(msg) {

						var obj = eval('(' + msg + ')');
						var result = obj[0]["message"];
						alert(result);
						$('#rentgrid').datagrid("reload");
					}
				});

	}
}
function Onmodify(id) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	window.location.href = "../industry/searchById.shtml?id=" + id + "&type=1";
}
