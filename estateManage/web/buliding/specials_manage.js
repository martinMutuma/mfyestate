// 写字楼出租脚本
$(function() {
//init district tree
	initTab('团购列表')
	$("#searchid").linkbutton({
				text : '查询',
				iconCls : 'icon-search'
			});
	$('#rentgrid').datagrid({
		title : '团购管理',
		idField : 'id',
		width : '100%',
		height : 400,
		nowrap : false,
		striped : true,
		collapsible : false,
		url : '../special/searchSpecials.shtml',
		loadMsg:'请等待...',
		frozenColumns : [[{
					field : 'ck',
					title : '选择',
					align : 'center',
					checkbox : true
				}]],
		columns : [[{
					title : '基本信息',
					colspan : 5
				}, {
					field : 'opt',
					title : '操作',
					width : 150,
					align : 'center',
					rowspan : 2,
					formatter : function(value, rec) {
						if (rec.id == undefined)
							return null;
						else
							return '<span style="color:red" class="fun"><a href=javascript:view("'
									+ rec.id
									+ '")><font style="cursor:pointer">预览</font></a>  <a href=javascript:Onmodify("'
									+ rec.id
									+ '")><font style="cursor:pointer">修改</font></a>   <a href=javascript:Ondelete("'
									+ rec.id
									+ '")><font style="cursor:pointer">删除</font></a></span>';
					}
				}], [{
					field : 'descr',
					title : '信息简述',
					align : 'center',
					width : 400,
					formatter:function(value){
						if(value!=null&&value!=undefined){
							return "<div align='left'>"+value+"</div>";
						}
					}
				}, {
					field : 'starttime',
					title : '开始时间',
					width : 150,
					align : 'center',
					sortable : true,
					formatter:function(value,rec){
						if(value!=null&&value!=undefined){
							return value.replace("T"," ");
						}
					}
				}, {
					field : 'endtime',
					title : '结束时间',
					width : 150,
					align : 'center',
					formatter:function(value,rec){
						if(value!=null&&value!=undefined){
							return value.replace("T"," ");
						}
					}
				}, {
					field : 'specialsmes',
					title : '优惠信息',
					width : 75,
					align : 'center'
				}, {
					field : 'endtime1',
					title : '状态',
					width : 75,
					align : 'center',
					formatter:function(value,rec){
						if(undefined==rec.endtime)
							return "";
						var time = rec['endtime'].split("T");
						var time1 = time[0].split("-");
						var time2 = time[1].split(":");
						var year = time1[0];
						var month = time1[1];
						var day = time1[2];
						var hour = time2[0];
						var minite = time2[1];
						var second = time2[2];
						var endDate = new Date(year,month,day,hour,minite,second);
						var nowDate = new Date();
						if(endDate < nowDate){
							return '<div style="color:red">已过期</div>';
						}else if(endDate >= nowDate){
							return '<div style="color:green">正在进行中</div>'
						}
					}
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
					text : '添加团购',
					iconCls : 'icon-add',
					handler : function() {
						addTab('团购设置','../buliding/buliding_manage.jsp','add');
					}
				}]
	}
	);
});

function onSearch() {
	var queryParams = $('#rentgrid').datagrid("options").queryParams;
	queryParams.name = $("#name").val();
	$('#rentgrid').datagrid("reload");
}
function Ondelete(id) {
	if (id == "undefined") {
		$.messager.alert('删除操作','此条记录已删除','error',function(){})
		return;
	}
	$.messager.confirm('删除记录', '请确认要删除记录吗?', function(btn) {
		if (btn) {
			var url1 = "../special/deleteSpecials.shtml";
			$.ajax({
					url : url1,
					data : "id=" + id,
					success : function(msg) {
						if(msg == "success"){
							alert("删除成功!");
						}else{
							alert("删除失败!")
						}
						$('#rentgrid').datagrid("reload");
					}
				});
			}
		});
}
function Onmodify(id) {
	if (id == "undefined") {
		$.messager.alert('修改操作','数据已丢失','error',function(){})
		return ;
	}
	addTab('团购修改',"../special/toModify.shtml?id=" + id,id);
}

function view(id){
	addTab('团购预览','../special/view.shtml?id='+id,id);
}
