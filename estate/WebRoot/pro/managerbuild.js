// 居民楼盘管理
$(function() {
	$("#searchid").linkbutton({
				text : '查询',
				iconCls : 'icon-search'
			});
	$('#rentgrid').datagrid({
		title : '居住楼盘管理',
		idField : 'id',
		width : 760,
		height : 400,
		nowrap : false,
		striped : true,
		collapsible : false,
		url : '../building/search.shtml',
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
					width : 120,
					align : 'center',
					rowspan : 2,
					formatter : function(value, rec) {
							if (rec.id == undefined)
							return null;
						else
							return '<span style="color:red"><span onclick=seeShow("'
									+ rec.id
									+ '")><font style="cursor:pointer;color:blue;">查看</font></span><span style="color:red"><span onclick=Onmodify("'
									+ rec.id
									+ '")><font style="cursor:pointer;color:blue;">&nbsp;&nbsp;修改</font></span> <span onclick=Ondelete("'
									+ rec.id + '")><font style="cursor:pointer;color:blue;">删除</font></span></span>';
					}
				}], [{
					field : 'name',
					title : '楼盘名称',
					mapping : 'name',
					align : 'center',
					width : 160
				}, {
					field : 'salesStatus',
					mapping : 'SALES_STATUS',
					title : '销售状态',
					width : 60,
					align : 'center',
					rowspan : 2,
						formatter : function(value, rec) {
						   if(value=='0')return '待售';
						   if(value=='1')return '预售';
						   if(value=='2')return '在售';
						   if(value=='3')return '尾盘';
						   if(value=='4')return '售完';
						
					}
				
				}, {
					field : 'address',
					title : '楼盘地址',
					width : 150,
					mapping : 'address',
					align : 'center',
					rowspan : 2
				},
				{
					field : 'minPrice',
					title : '楼盘起价(㎡/元)',
					width : 100,
					align : 'center',
					mapping : 'MIN_PRICE',
					rowspan : 2
				}, {
					field : 'dateString',
					title : '开盘时间',
					align : 'center',
					width : 100,
					rowspan : 2
				}

		]],
		pagination : true,
		rownumbers : true,
		queryParams : {
			discode:'-1'
		},
		toolbar : [{
					id : 'btnadd',
					text : '增加楼盘',
					iconCls : 'icon-add1',
					handler : function() {
						$(this).attr("href", 'tabuilding.jsp?menuCls=11');

					}
				}, '-', {
					id : 'btnsave',
					text : '删除楼盘',
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
						var url1 = "../building/deleteBuiding.shtml";

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
	var queryParams = $('#rentgrid').datagrid("options").queryParams;
	queryParams.discode= $("#discode").combotree("getValue");
	$('#rentgrid').datagrid("reload");
}
function Ondelete(id) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	if (confirm("确定删除此条信息吗?")) {

		var url1 = "../building/deleteBuiding.shtml";

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
function  seeShow(id){
    go("../building/toBuidingInfo.shtml?id="+id)
    
}
function Onmodify(id) {
	if (id == "undefined") {
		alert("此条记录已删除");
		return;
	}
	
window.location.href = "../building/searchById.shtml?id=" + id;
}
