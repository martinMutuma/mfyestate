// 写字楼出租脚本
$(function() {
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
		title : '写字楼出租管理',
		idField : 'id',
		width : 760,
		height : 400,
		nowrap : false,
		striped : true,
		collapsible : false,
		url : '../../office/search.shtml',
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
					width : 100,
					align : 'center',
					rowspan : 2,
					formatter : function(value, rec) {
						if (rec.id == undefined)
							return null;
						else
							return '<span style="color:red"><span onclick=seeBulid('
									+ rec.id
									+ ')><font style="cursor:pointer;color:blue;">查看</font></span> <span style="color:red"><span onclick=Onmodify("'
									+ rec.id
									+ '")><font style="cursor:pointer;color:blue;">修改</font></span> <span onclick=Ondelete("'
									+ rec.id + '")><font style="cursor:pointer;color:blue;">删除</span></span>';
					}
				}], [{
					field : 'title',
					title : '案源名称',
					mapping : 'title',
					align : 'center',
					width : 150
				}, {
					field : 'name',
					title : '楼盘名称',
					width : 120,
					rowspan : 2,
					align : 'center',
					sortable : true,
					formatter:function(value,rec){
						  return  value;
					     //return  "<a href=detailfloor.jsp>"+value+"</a>";
					}

				}, {
					field : 'price',
					title : '租金(元/㎡·天)',
					width : 105,
					align : 'center',
					rowspan : 2
				}, {
					field : 'area',
					title : '建筑面积(㎡)',
					width : 75,
					align : 'center',
					rowspan : 2
				}, {
					field : 'createTimeString',
					title : '发布时间',
					width : 80,
					align : 'center',
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
			type : '1',
			name : '',
			auditingState : '-1',
			area1:'-1',
			area2:'-1',
			price1:'-1',
			price2:'-1',
			discode:'-1'
		},
		toolbar : [{
					id : 'btnadd',
					text : '发布出租',
					iconCls : 'icon-add1',
					handler : function() {
						$(this).attr("href", 'buildingrent.jsp?menuCls=11');

					}
				}, '-', {
					id : 'btnsave',
					text : '删除出租信息',
					iconCls : 'icon-remove1',
					handler : function() {
						var records = $('#rentgrid').datagrid("getSelections");
						var ids = '';
						if (null == records || records == "") {
							$.messager.alert('删除操作','请选择要删除的记录','error',function(){
							})
							return;
						}
						for (var i = 0; i < records.length; i++) {
							if (records[i].id == undefined || records[i].id == "undefined"){
								$.messager.alert('删除操作','请选择要删除的记录','error',function(){})
								return;
							}
							ids += records[i].id;
							ids += '_';
						}
						
						$.messager.confirm('删除记录', '请确认要删除记录吗?', function(btn) {
								if (btn) {
									var url1 = "../../office/delete.shtml";
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
         $.messager.alert('查询操作','选择的面积不符合要求，请选择面积最小值','error',function(){})
         return;
      }
      
       if(parseInt(arear1)>parseInt(arear2)){
         $.messager.alert('查询操作','选择的面积不符合要求，面积最小值应小于最大值','error',function(){})
         return;
        }
       if(price1==-1 && price2!=-1){
         $.messager.alert('查询操作','选择的租金不符合要求，请选择租金最小值','error',function(){})
         return;
      }
      
       if(parseInt(price1)>parseInt(price2)){
         $.messager.alert('查询操作','选择的租金不符合要求，租金最小值应小于最大值','error',function(){})
         return;
        }
	var queryParams = $('#rentgrid').datagrid("options").queryParams;
	queryParams.name = $("#name").val();
	queryParams.auditingState = $("#auditingState").combobox("getValue");
	queryParams.area1 =arear1;
	queryParams.area2 =arear2;
	queryParams.price1 =price1;
	queryParams.price2 =price2;
	 queryParams.discode= $("#discode").combotree("getValue");
	$('#rentgrid').datagrid("reload");
}
function Ondelete(id) {
	if (id == "undefined") {
		$.messager.alert('删除操作','此条记录已删除','error',function(){})
		return;
	}
	$.messager.confirm('删除记录', '请确认要删除记录吗?', function(btn) {
		if (btn) {
			var url1 = "../../office/delete.shtml";
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
		});
}
function Onmodify(id) {
	if (id == "undefined") {
		$.messager.alert('修改操作','此条记录已删除','error',function(){})
		return ;
	}
	window.location.href = "../../office/searchById.shtml?id=" + id + "&type=1&menuCls=11";
}
function onsee(id) {
	if (id == "undefined") {
		$.messager.alert('查看操作','此条记录已删除','error',function(){})
		return ;
	}
	window.open("../../office/searchById.shtml?id=" + id + "&type=1&flag=see");
}
function seeBulid(id){
	window.open('../../proShow.shtml?id='+id+'&searchPro=0');
}