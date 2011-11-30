/**
*地区列表
*/
var disAry = new Array('3201000000,南京市','3207000000,连云港市')
function headLoad(){
	var charea_flag = true;
	var rightP = $("#changeArea").position().left+$("#changeArea").outerWidth(true)-$("#charea").outerWidth(true);
	$("#charea").css({top:"25px",left:rightP+"px"}).blur(function(){
		if(charea_flag)
			$("#charea").hide();
	}).hover(function(){
		charea_flag = false;
	},function(){
		charea_flag = true;
	});
	var rmbqAry = new Array(
		"<a href=\"javascript:searchHot('0_3','building_type~8~2~','9','0','')\">海景房</a><a href=\"javascript:searchHot('','','9','0','4')\">宜居生态</a><a href=\"javascript:searchHot('','','9','0','2')\">高档小区</a><a href=\"javascript:searchHot('0_5','building_type~8~4~','9','0','')\">酒店式公寓</a><a href=\"javascript:searchHot('','','9','0','5')\">花园洋房</a>",
		"<a href=\"javascript:searchHot('1_1','category#1~5~1~','0','0','')\">纯写字楼</a><a href=\"javascript:searchHot('1_2','category#1~5~2~','0','0','')\">商住楼</a><a href=\"javascript:searchHot('1_3','category#1~5~3~','0','0','')\">酒店式公寓</a><a href=\"javascript:searchHot('1_4','category#1~5~4~','0','0','')\">园区办公</a><a href=\"javascript:searchHot('1_5','category#1~5~5~','0','0','')\">商务中心</a>",
		"",
		""
	)
	var ser_type_obj = $("#ser_type > span[class*='pro_selected']");
	$("#ser_type > span").click(function(){
		if(ser_type_obj == $(this))
			return;
		$(ser_type_obj).removeClass("pro_selected");
		$(this).addClass("pro_selected");
		ser_type_obj = $(this);
		if($(this).html()=="写字楼"){
			$("#rmbq").html(rmbqAry[1]);
			select_pro_item = 1;
		}
		else if($(this).html()=="商铺"){
			$("#rmbq").html(rmbqAry[2]);
			select_pro_item = 2;
		}
		else if($(this).html()=="经纪人"){
			$("#rmbq").html(rmbqAry[3]);
			select_pro_item = 3;
		}
		else if($(this).html()=="住宅"){
			$("#rmbq").html(rmbqAry[0]);
			select_pro_item = 0;
		}
	})
	
	var menuIndex = $("#menuIndex").val();
	if(menuIndex!="0"){
		$("#menu_index").removeClass("menu_selected");
		if(menuIndex=="1")
			$("#menu_bulid").addClass("menu_selected");
		else if(menuIndex=="2")
			$("#menu_bus").addClass("menu_selected");
		else if(menuIndex=="3")
			$("#menu_mem").addClass("menu_selected");
		else
			$("#menu_index").addClass("menu_selected");
	}
	
	var nowAreaCode = $("#nowAreaCode").val();
	if(nowAreaCode == "")
		nowAreaCode = "3201000000";
	for(var i = 0; i < disAry.length; i++){
		var strTemp = disAry[i];
		var disCodeTemp = strTemp.split(",");
		var code = disCodeTemp[0];
		var name = disCodeTemp[1];
		if(code == nowAreaCode)
			$("#aname").html(name);
		else{
			$("#charea").append('<span id="'+code+'">'+name+'</span>')
		}
	}
	
	$("#charea > span").hover(function(){
		$(this).removeClass("area_out")
		$(this).addClass("area_over")
	},function(){
		$(this).removeClass("area_over")
		$(this).addClass("area_out")
	}).click(function(){
		var districtCode = $(this).attr("id");
		$("#aname").html($(this).html());
		$("#charea").hide();
		$.get("changeArea.shtml?district="+districtCode+'&t='+(new Date()).getTime().toString(36),function(res){
			if(res=="true"){
				window.location.reload();
			}
		})
	})
}
//pro_index
var select_pro_item = 0;
function showArea(){
	$("#charea").show();
	$("#charea").focus();
}

function keyWordSearch(){
	var keyword = encodeURIComponent($("#keywordField").val());
	go(project_root_path+'keyWordSearch.shtml?keyword='+keyword+'&proIndex='+select_pro_item);
}

function go(url){
	window.location.href = url;
}

function show(id,proId){
	window.location.href = "proShow.shtml?id="+id+"&searchPro="+proId;
}

function showNeed(id,proId){
	window.location.href = "needShow.shtml?id="+id+"&searchPro="+proId;
}
function showBulid(id){
	go('building/toBuidingInfo.shtml?id='+id)
}

function searchHot(staus,query,pro,tab,lpts){
	$("#searchStatus").val(staus);
	$("#searchQuery").val(query);
	$("#searchPro").val(pro);
	$("#selectedTab").val(tab);
	$("#lptsValue").val(lpts);
	window.searchForm.action = 'search.shtml';
	window.searchForm.method="post";
	window.searchForm.submit();
}