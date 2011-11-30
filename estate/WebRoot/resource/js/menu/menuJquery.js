var checkedIndex = 1;
var checkMenu = '00';
var isChrome=navigator.userAgent.toLowerCase().indexOf('chrome');
$(function(){
	var br=navigator.userAgent.toLowerCase();
	var browserVer=(br.match(/.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/) || [0, '0'])[1];
	$(".MM li").hover(function(){
		var top = $(this).position().top;
		if(isChrome!=-1&&browserVer>534.16){
			top = top-34;
		}
		$($(this).find("div")[0]).css({left:$(this).position().left+150+'px',top:top+'px'}).show();
	},
	function(){
		$($(this).find("div")[0]).hide();
	})
	$(".MM li div span").hover(function(){
		$(this).removeClass("cate_out");
		$(this).addClass("cate_over");
	},
	function(){
		$(this).removeClass("cate_over");
		$(this).addClass("cate_out");
	})


	var menuGroupAry = $(".content");
	var menuTitle = $(".type");
	try{
		if(checkMenu == "00")
			checkMenu = $("#menuCls").val();
		if(checkMenu == "")
			checkMenu = "00";
		checkedIndex = checkMenu.substring(0,1)
	}catch(e){checkMenu == "00"}
	for(var i = 0; i < menuGroupAry.length; i++){
		var menuGroup = $(menuGroupAry[i]);
		var title = $(menuTitle[i]);
		//menuGroup.attr("id",'p'+i);
		//title.attr("id",i);
		var menuIndex = title.attr("id");
		var showFlag = false;
		if(checkMenu!='00'){
			var childrenGroupAry = menuGroup.find(".MM a");
			for(var j = 0; j < childrenGroupAry.length; j++){
				var childMenu = $(childrenGroupAry[0]);
				if(checkMenu == childMenu.attr("sign")){
					showFlag = true;
					childMenu.addClass("checkedMenu");
					break;
				}
			}
		}
		if(!showFlag)
			if(menuIndex==checkedIndex){
				menuGroup.css("height",$(menuGroup.find(".MM")[0]).outerHeight(true)+'px').show();
			}else
				menuGroup.hide();
		else
			menuGroup.css("height",$(menuGroup.find(".MM")[0]).outerHeight(true)+'px').show();
		title.click(function(){
			var cls = this.id;
			if((checkedIndex)==parseInt(cls,10))
				return;
			var menuGroup = $(".content[id=p"+cls+"]");
			menuGroup.show().css("height",$(menuGroup.find(".MM")[0]).outerHeight(true)+'px');
			var menuGroupChecked = $(".content[id=p"+(checkedIndex)+"]");
			menuGroupChecked.hide();
			checkedIndex = parseInt(cls,10);
		})
	}
})

function go(url){
	window.location.href=url;
}