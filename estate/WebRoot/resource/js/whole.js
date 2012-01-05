/**
 * 地区列表
 */
var disAry = new Array('3201000000,南京市', '3207000000,连云港市', '3208000000,淮安市',
		'3209000000,盐城市')
function headLoad() {
	var charea_flag = true;
	var rightP = $("#changeArea").position().left
			+ $("#changeArea").outerWidth(true) - $("#charea").outerWidth(true);
	$("#charea").css({
		top : "25px",
		left : rightP + "px"
	}).blur(function() {
		if (charea_flag)
			$("#charea").hide();
	}).hover(function() {
		charea_flag = false;
	}, function() {
		charea_flag = true;
	});
	var rmbqAry = new Array(
			"<a href=\"javascript:searchHot('0_3','YnVpbGRpbmdfdHlwZSMx~8~2~','9','0','')\">海景房</a><a href=\"javascript:searchHot('','','9','0','4')\">宜居生态</a><a href=\"javascript:searchHot('','','9','0','2')\">高档小区</a><a href=\"javascript:searchHot('0_5','YnVpbGRpbmdfdHlwZSMx~8~4~','9','0','')\">酒店式公寓</a><a href=\"javascript:searchHot('','','9','0','5')\">花园洋房</a>",
			"<a href=\"javascript:searchHot('1_1','Y2F0ZWdvcnkjMQ==~5~1~','0','0','')\">纯写字楼</a><a href=\"javascript:searchHot('1_2','Y2F0ZWdvcnkjMQ==~5~2~','0','0','')\">商住楼</a><a href=\"javascript:searchHot('1_3','Y2F0ZWdvcnkjMQ==~5~3~','0','0','')\">酒店式公寓</a><a href=\"javascript:searchHot('1_4','Y2F0ZWdvcnkjMQ==~5~4~','0','0','')\">园区办公</a><a href=\"javascript:searchHot('1_5','Y2F0ZWdvcnkjMQ==~5~5~','0','0','')\">商务中心</a>",
			"", "")
	var ser_type_obj = $("#ser_type > span[class*='pro_selected']");
	$("#ser_type > span").click(function() {
		if (ser_type_obj == $(this))
			return;
		$(ser_type_obj).removeClass("pro_selected");
		$(this).addClass("pro_selected");
		ser_type_obj = $(this);
		if ($(this).html() == "写字楼") {
			$("#rmbq").html(rmbqAry[1]);
			select_pro_item = 1;
		} else if ($(this).html() == "商铺") {
			$("#rmbq").html(rmbqAry[2]);
			select_pro_item = 2;
		} else if ($(this).html() == "经纪人") {
			$("#rmbq").html(rmbqAry[3]);
			select_pro_item = 3;
		} else if ($(this).html() == "住宅") {
			$("#rmbq").html(rmbqAry[0]);
			select_pro_item = 0;
		}
	})

	var menuIndex = $("#menuIndex").val();
	if (menuIndex == "") {
		menuIndex = "0"
	}
	if (menuIndex == "0")
		$("#menu_index").addClass("current");
	else if (menuIndex == "1")
		$("#menu_bulid").addClass("current");
	else if (menuIndex == "2")
		$("#menu_bus").addClass("current");
	else if (menuIndex == "3")
		$("#menu_secondBulid").addClass("current");
	else if (menuIndex == "4")
		$("#menu_rent").addClass("current");
	else if (menuIndex == "5")
		$("#menu_groupbuy").addClass("current");
	else if (menuIndex == "6")
		$("#menu_one").addClass("current");
	else if (menuIndex == "7")
		$("#menu_news").addClass("current");
	else if (menuIndex == "8")
		$("#menu_nest").addClass("current");

	var nowAreaCode = $("#nowAreaCode").val();
	if (nowAreaCode == "")
		nowAreaCode = "3201000000";
	for (var i = 0; i < disAry.length; i++) {
		var strTemp = disAry[i];
		var disCodeTemp = strTemp.split(",");
		var code = disCodeTemp[0];
		var name = disCodeTemp[1];
		if (code == nowAreaCode)
			$("#aname").html(name);
		else {
			$("#charea").append('<span id="' + code + '">' + name + '</span>')
		}
	}

	$("#charea > span").hover(function() {
		$(this).removeClass("area_out")
		$(this).addClass("area_over")
	}, function() {
		$(this).removeClass("area_over")
		$(this).addClass("area_out")
	}).click(function() {
		var districtCode = $(this).attr("id");
		$("#aname").html($(this).html());
		$("#charea").hide();
		$.get("changeArea.shtml?district=" + districtCode + '&t='
				+ (new Date()).getTime().toString(36), function(res) {
			if (res == "true") {
				window.location.reload();
			}
		})
	})
}

// 显示地区
function showArea() {
	$("#charea").show();
	$("#charea").focus();
}
// 头部搜索标签
var select_pro_item = 0;
// 头部关键字查询--前期只做简单查询
function keyWordSearch() {
	var keyword = encodeURIComponent($("#keywordField").val());
	go(project_root_path + 'keyWordSearch.shtml?keyword=' + keyword
			+ '&proIndex=' + select_pro_item);
}
// 转向目标地址
function go(url) {
	window.location.href = url;
}
// 查看地产行天下项目具体信息
function show(id, proId) {
	window.location.href = "proShow.shtml?id=" + id + "&searchPro=" + proId;
}
// 查看需求具体信息
function showNeed(id, proId) {
	window.location.href = "needShow.shtml?id=" + id + "&searchPro=" + proId;
}

// 查看新房具体信息
function showBulid(id) {
	go('building/toBuidingInfo.shtml?id=' + id)
}

// 进入经纪人商铺
function toMyStore(id) {
	go('mem/baseinfo_toMyStore.shtml?authorId=' + id + '&type=build');
}

// 进入二手房
function tosecondBd(id, type) {
	go('secondBd/showBuliding.shtml?tpsId=' + id + '&menuIndex=' + type);
}

// 查看热门标签
function searchHot(staus, query, pro, tab, lpts) {
	$("#searchStatus").val(staus);
	$("#searchQuery").val(query);
	$("#searchPro").val(pro);
	$("#selectedTab").val(tab);
	$("#lptsValue").val(lpts);
	window.searchForm.action = 'search.shtml';
	window.searchForm.method = "post";
	window.searchForm.submit();
}
/**
 * 替换字符 str 元字符传 sptr 被替换字符 sptr1替换字符
 */
function replaceAll(str, sptr, sptr1) {
	while (str.indexOf(sptr) >= 0) {
		str = str.replace(sptr, sptr1);
	}
	return str;
}

// ****只能填数字********
function onlyNum() {
	if (!((event.keyCode >= 48 && event.keyCode <= 57)
			|| (event.keyCode >= 96 && event.keyCode <= 105) || (event.keyCode >= 37 && event.keyCode <= 40)))
		// 考虑小键盘上的数字键
		if (event.keyCode != 8 && event.keyCode != 13)
			event.returnValue = false;
	// return false;
}
// *****关注及参加看房团start**********
function attention(obj) {
	alert('您已关注成功!');
}

function notLogged() {
	if (confirm("您尚未登陆，不能对此楼盘添加关注，是否需要登录")) {
		window.location.href = "../member/login.jsp";
	}
}

function hasattention() {
	alert('您已关注过该楼盘');
}

function hasshowing() {
	alert('您已参加过该楼盘的看房团，感谢您的参与！');
}
function onAttion(id, attentionNum) {
	var url = "building/attentionOff.shtml?id=" + id + "&attentioncount="
			+ attentionNum + "&time=" + (new Date().getTime().toString(36));
	$.get(url, function(mes) {
		if (mes == "1") {
			alert('您已关注过该楼盘！')
		} else if (mes == "0") {
			alert('您已关注成功!')
		} else {
			alert('您还没有登录，请您登录后再关注！')
		}
	});
}
// *****关注及参加看房团end**********
