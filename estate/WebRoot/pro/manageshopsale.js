// 商铺出售脚本
$(function() {
     $("#area1").combobox({
				width : 70,
				panelHeight : 100 
			});
	 $("#area2").combobox({
				width :70,
				panelHeight : 100
			});
	 $("#price1").combobox({
				width : 50,
				panelHeight : 150
			});
	 $("#price2").combobox({
				width : 50,
				panelHeight : 150
			});
	$("#auditingState").combobox({
				width : 100,
				panelHeight : 100
			});
	$("#searchid").linkbutton({
				text : '查询',
				iconCls : 'icon-search'
			});
	$('#shopsalegrid').datagrid({
		title : '商铺出售管理',
		idField : 'id',
		width : 760,
		height : 400,
		nowrap : false,
		striped : true,
		collapsible : false,
		url : '../shop/search.shtml',
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
							return '<span style="color:red"><span onclick=seeBulid('
									+ rec.id
									+ ')><font style="cursor:pointer;color:blue;">查看</font></span> <span style="color:red"><span onclick=Onmodify("'
									+ rec.id
									+ '")><font style="cursor:pointer;color:blue;">修改</font></span> <span onclick=Ondelete("'
									+ rec.id + '")><font style="cursor:pointer;color:blue;">删除</font></span></span>';
					}
				}], [{
					field : 'title',
					title : '案源名称',
					mapping : 'title',
					align : 'center',
					width : 200
				}, {
					field : 'disname',
					title : '所属区域',
					align : 'center',
					width : 120,
					rowspan : 2,
					sortable : true
				}, {
					field : 'bursary',
					title : '售价(万元)',
					align : 'center',
					width : 80,
					rowspan : 2
				}, {
					field : 'createTimeString',
					title : '发布时间',
					align : 'center',
					width : 100,
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
			type : '2',
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
					text : '发布出售',
					iconCls : 'icon-add1',
					handler : function() {
						$(this).attr("href", 'shopsale.jsp?menuCls=14');
					}
				}, '-', {
					id : 'btnsave',
					text : '删除出售信息',
					iconCls : 'icon-remove1',
					handler : function() {
						var records = $('#shopsalegrid')
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
						$.messager.confirm('删除记录', '请确认要删除记录吗?', function(btn) {
						if (btn) {
							var url1 = "../shop/delete.shtml";
							$.ajax({
									url : url1,
									data : "idString=" + ids + "&type=2",
									success : function(msg) {
										// var obj = eval('(' + msg + ')');
										// var result = obj[0]["message"];
										// alert(result);
										$('#shopsalegrid').datagrid("reload");
									}
								});
							}});
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
      var discode= $("#discode").combobox("getValue");
      if(arear1==-1 && arear2!=-1){
         alert('选择的面积不符合要求，请选择面积最小值');
         return;
      }
      
       if(parseInt(arear1,10)>parseInt(arear2,10)){
         alert('选择的面积不符合要求，面积的最小值应小于最大的值');
         return;
        }
       if(price1==-1 && price2!=-1){
         alert('选择的租金不符合要求，请选择售价的最小值');
         return;
      }
      
      if(parseInt(price1,10)>parseInt(price2,10)){
         alert('选择的售价不符合要求，售价的最小值应小于最大的值');
         return;
      }
	var queryParams = $('#shopsalegrid').datagrid("options").queryParams;
	queryParams.name = $("#name").val();
	queryParams.auditingState = $("#auditingState").combobox("getValue");
	queryParams.area1 =arear1;
	queryParams.area2 =arear2;
	queryParams.price1 =price1;
	queryParams.price2 =price2;
	queryParams.discode= $("#discode").combobox("getValue")=='0000000000'?'-1':$("#discode").combobox("getValue");
	$('#shopsalegrid').datagrid("reload");
}
function Ondelete(id) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	$.messager.confirm('删除记录', '请确认要删除记录吗?', function(btn) {
		if (btn) {
		var url1 = "../shop/delete.shtml";
		$.ajax({
				url : url1,
				data : "id=" + id + "&type=2",
				success : function(msg) {
				//	var obj = eval('(' + msg + ')');
				//	var result = obj[0]["message"];
				//	alert(result);
					$('#shopsalegrid').datagrid("reload");
				}
			});
		}});
}
function Onmodify(id) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	window.location.href = "../shop/searchById.shtml?id=" + id + "&type=2&menuCls=14";
}
function seeBulid(id){
	window.open('../proShow.shtml?id='+id+'&searchPro=1');
}