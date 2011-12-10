// 写字楼出租脚本
$(function() {
//init district tree
	// initTab('团购列表')
	$("#searchid").linkbutton({
				text : '查询',
				iconCls : 'icon-search'
			});
	$('#rentgrid').datagrid({
		title : '团购成员管理',
		idField : 'id',
		width : '95%',
		height : 450,
		nowrap : false,
		striped : true,
		collapsible : false,
		url : '../special/loadSpecialMember.shtml',
		loadMsg:'请等待...',
		frozenColumns : [[{
					field : 'ck',
					title : '选择',
					align : 'center',
					checkbox : true
				}]],
		columns : [ [{
					field : 'name',
					title : '姓名',
					align : 'center',
					width : 100
				}, {
					field : 'sex',
					title : '性别',
					width : 80,
					align : 'center',
					sortable : true,
					formatter:function(value,rec){
						if(value==null&&value==undefined){
							return "";
						}else if(value=='1'){
							return "男";
						}else if(value=='2'){
							return "女";
						}else{
							return "";
						}
					}
				}, {
					field : 'type',
					title : '是否下定',
					width : 120,
					align : 'center',
					formatter:function(value,rec){
						if(value==null&&value==undefined){
							return "";
						}else if(value=='1'){
							return "已下定";
						}else if(value=='0'){
							return "已报名未下定";
						}else{
							return "";
						}
					}
				},{
					field : 'mobile',
					title : '手机号码',
					width : 120,
					align : 'center'
				},{
					field : 'tel',
					title : '固定电话',
					width : 120,
					align : 'center'
				}, {
					field : 'jointime',
					title : '参加时间',
					width : 180,
					align : 'center',
					formatter:function(value){
						return value.replace('T',' ')
					}
				}, {
					field : 'confirmtime',
					title : '下定时间',
					width : 180,
					align : 'center',
					formatter:function(value){
						return value.replace('T',' ')
					}
				}
		]],
		pagination : true,
		rownumbers : true,
		queryParams : {
			pid : pid,
			pflag : pflag
		}
		/*,
		toolbar : [{
					id : 'btnadd',
					text : '添加团购',
					iconCls : 'icon-save',
					handler : function() {
						addTab('团购设置','../buliding/buliding_manage.jsp','add');
					}
				},'-',{
					id : 'btnadd',
					text : '参团成员信息查看',
					iconCls : 'icon-add',
					handler : function() {
						addTab('成员信息查看','../buliding/buliding_manage.jsp','add');
					}
				}]
				*/
	}
	);
});
//参团成员信息查看
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
