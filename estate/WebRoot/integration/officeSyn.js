// 写字楼出租脚本
$(function () {
	$("#discode").combotree({url:"", animate:false, onShowPanel:function () {
		var dataUrl = "<%=basePath%>district/bulidDistrictTree.shtml?level=5&districtCode=0000000000&t=" + (new Date()).getTime().toString(36);
		if ($("#discode").combotree("options").url == "") {
			$.messager.show({showType:null, showSpeed:1000, width:150, height:70, msg:"\u5730\u533a\u4fe1\u606f\u52a0\u8f7d\u4e2d... ...", title:"\u63d0\u793a", timeout:2000});
			$("#discode").combotree("options").url = dataUrl;
			$.get(dataUrl, function (data) {
				var json = "";
				try {
					json = eval("(" + data + ")");
				}
				catch (e) {
					json = data;
				}
				$("#discode").combotree("loadData", json);
			});
		}
	}, onLoadSuccess:function () {
		if ($("#discode").combotree("options").url != "") {
			$.messager.show({showType:"slide", showSpeed:1000, width:150, height:70, msg:"\u5730\u533a\u4fe1\u606f\u52a0\u8f7d\u5b8c\u6210", title:"\u63d0\u793a", timeout:3000});
		}
	}});
	$("#area1").combobox({width:70, panelHeight:100});
	$("#area2").combobox({width:70, panelHeight:100});
	$("#price1").combobox({width:50, panelHeight:100});
	$("#price2").combobox({width:50, panelHeight:100});
	$("#auditingState").combobox({width:100, panelHeight:100});
	$("#searchid").linkbutton({text:"\u67e5\u8be2", iconCls:"icon-search"});
	$("#rentgrid").datagrid({title:"写字楼出租信息", idField:"id", width:710, height:400, nowrap:false, striped:true, collapsible:false, url:"../office/search.shtml", loadMsg:"\u8bf7\u7b49\u5f85...", frozenColumns:[[{field:"ck", title:"\u9009\u62e9", align:"center", checkbox:true}]], columns:[[{title:"\u57fa\u672c\u4fe1\u606f", colspan:6}], [{field:"title", title:"\u6848\u6e90\u540d\u79f0", mapping:"title", align:"center", width:100}, {field:"name", title:"\u6240\u5c5e\u7269\u4e1a", width:120, rowspan:2, align:"center", sortable:true, formatter:function (value, rec) {
		return value;
					     //return  "<a href=detailfloor.jsp>"+value+"</a>";
	}}, {field:"price", title:"\u79df\u91d1(\u5143/\u5e73\u65b9\u7c73\xb7\u5929)", width:105, align:"center", rowspan:2}, {field:"area", title:"\u9762\u79ef(\u5e73\u65b9\u7c73)", width:75, align:"center", rowspan:2}, {field:"createTimeString", title:"\u53d1\u5e03\u65f6\u95f4", width:120, align:"center", rowspan:2}, {field:"audtingString", title:"\u72b6\u6001", align:"center", width:65, rowspan:2}]], pagination:true, rownumbers:true, queryParams:{type:"1", name:"", auditingState:"-1", area1:"-1", area2:"-1", price1:"-1", price2:"-1", discode:"-1"}, toolbar:[{id:"btnadd", text:"数据共享", iconCls:"icon-add1", handler:function () {
		//数据共享
		$("#win").window("open");
	}}, "-"]});
	//数据共享对话框
	$("#win").window({
				title: '数据共享',
				width: 600,
				modal: true,
				closed: false,
				height: 300,
				closed:true,
				cache:true,
				top:$("#gridArea").offset().top
		})
	//365登陆对话框
	$('#365login').dialog({
		closed:true,
		top:$("#gridArea").offset().top,
		title: '365登陆',
		modal: true,
		width: 300,
		height: 150,
		buttons:[{
					text:'登陆',
					iconCls:'icon-ok',
					handler:function(){
						var name = $("#uname_365").val();
						var password = $("#password_365").val();
						if(name==""||password==""){
							$.messager.alert('信息提醒','用户名或者密码不能为空','warning');
							return;
						}
						$.get("../integration/login365.shtml?t="+(new Date().getTime().toString(36)),{'uname':name,'password':password},function(result){
							if("1"==result){
								$('#365login').dialog('close');
								$("#imgLogin365").hide().parent().html("已成功登录");
							}else{
								$.messager.alert('错误提醒','用户名或者密码错误','error')
							}
						})
					}
				},{
					text:'取消',
					iconCls:'icon-undo',
					handler:function(){
						$('#365login').dialog('close');
					}
				}]
	});
	//365数据共享按钮初始化
	$('#integration_365').linkbutton({
		plain:true
	})
	
});
function onSearch() {
	var arear1 = $("#area1").combobox("getValue");
	var arear2 = $("#area2").combobox("getValue");
	var price1 = $("#price1").combobox("getValue");
	var price2 = $("#price2").combobox("getValue");
	if (arear1 == -1 && arear2 != -1) {
		$.messager.alert("\u67e5\u8be2\u64cd\u4f5c", "\u9009\u62e9\u7684\u5e73\u65b9\u4e0d\u7b26\u5408\u8981\u6c42\uff0c\u5148\u9009\u524d\u9762\u6846", "error", function () {
		});
		return;
	}
	if (parseInt(arear1) > parseInt(arear2)) {
		$.messager.alert("\u67e5\u8be2\u64cd\u4f5c", "\u9009\u62e9\u7684\u5e73\u65b9\u4e0d\u7b26\u5408\u8981\u6c42\uff0c\u524d\u9762\u6846\u7684\u503c\u5e94\u5c0f\u4e8e\u540e\u9762\u6846\u7684\u503c", "error", function () {
		});
		return;
	}
	if (price1 == -1 && price2 != -1) {
		$.messager.alert("\u67e5\u8be2\u64cd\u4f5c", "\u9009\u62e9\u7684\u5e73\u65b9\u4e0d\u7b26\u5408\u8981\u6c42\uff0c\u5148\u9009\u524d\u9762\u6846", "error", function () {
		});
		return;
	}
	if (parseInt(price1) > parseInt(price2)) {
		$.messager.alert("\u67e5\u8be2\u64cd\u4f5c", "\u9009\u62e9\u7684\u5e73\u65b9\u4e0d\u7b26\u5408\u8981\u6c42\uff0c\u524d\u9762\u6846\u7684\u503c\u5e94\u5c0f\u4e8e\u540e\u9762\u6846\u7684\u503c", "error", function () {
		});
		return;
	}
	var queryParams = $("#rentgrid").datagrid("options").queryParams;
	queryParams.name = $("#name").val();
	queryParams.auditingState = $("#auditingState").combobox("getValue");
	queryParams.area1 = arear1;
	queryParams.area2 = arear2;
	queryParams.price1 = price1;
	queryParams.price2 = price2;
	queryParams.discode = $("#discode").combotree("getValue");
	$("#rentgrid").datagrid("reload");
}

function login(type){
		$('#'+type+'login').dialog("open");
}