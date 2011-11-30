var itemId = 'tabIndex';
var bodyId = 'bodyIndex';
var iframeId = 'tabIframe';
var selectedIndex = 0;
var mainId = 'mainBody';
var areaId = 'tabArea';
var tabCounts = 1;
var ary = "";
var link = '0';
var dblClickMsg = '双击关闭当前页';
var initHeight = 0;
var initWidth = 0;
function initTab(title){
	$("body,html").css({padding:0,margin:'0 0 0 0px','background-color':'#FFFFFF',width:'100%',height:'100%',overflow:'hidden'})
	if($("body").innerHeight()>document.documentElement.clientHeight)
		initHeight = $("body").innerHeight();
	else
		initHeight = document.documentElement.clientHeight;
	if($("body").innerWidth()>document.documentElement.clientWidth)
		initWidth = $("body").innerWidth();
	else
		initWidth = document.documentElement.clientWidth;
	$("body").wrapInner("<div id='"+mainId+"'></div>");
	$("body").html("<div class='top_menu' id='"+areaId+"'></div>"+$("body").html());
	$("#"+areaId).append('<span onclick="clickSupport(this)" id="tabIndex_'+(selectedIndex)+'_h" class="tab_selected">'+title+'</span><span id="tabIndex_'+(selectedIndex)+'_w" class="tab3">&nbsp;</span>');
	$("#"+mainId).addClass("mainBody").css({width:(initWidth-4-5)+'px',height:(initHeight-4-30)+'px'});
	var initBody = $("#"+mainId).html();
	var selectedBody = bodyId+'_'+selectedIndex;
	$("#"+mainId).html('<div  id="'+selectedBody+'"></div>');
	$("#"+selectedBody).html(initBody);
}
function addTab(title,url,cls){
	if(ary!="")
		if(!checkItem(cls))
			return;
	tabCounts++;
	var selectedItem = itemId+"_"+selectedIndex;
	var selectedItem1 = selectedItem+"_h";
	var selectedItem2 = selectedItem+"_w";
	if(getIndex(selectedIndex) == (tabCounts-2)){
		if(tabCounts>1){
			var selectedItem3 = itemId+"_"+(getPreIndex(selectedIndex))+"_w";
			$("#"+selectedItem3).removeClass("tab_mul_unselected").addClass("tab_mul_unselected1");
		}
		$("#"+selectedItem1).removeClass("tab_selected").addClass("tab");
		$("#"+selectedItem2).removeClass("tab3").addClass("tab_mul_unselected");
	}else{
		if(getIndex(selectedIndex)>0){
			var selectedItem3 = itemId+"_"+(getPreIndex(selectedIndex))+"_w";
			$("#"+selectedItem3).removeClass("tab_mul_unselected").addClass("tab_mul_unselected1");
		}
		$("#"+selectedItem1).removeClass("tab_selected").addClass("tab");
		$("#"+selectedItem2).removeClass("tab_mul_selected").addClass("tab_mul_unselected1");
		var tempId = itemId+"_"+(getMaxValue())+"_w";
		$("#"+tempId).removeClass("tab2").addClass("tab_mul_unselected");
	}
	var nowBody = bodyId+'_'+selectedIndex;
	
	
	
	$("#"+nowBody).hide();
	selectedIndex = getMaxIndex();
	$("#"+areaId).append('<span title="'+dblClickMsg+'" ondblclick="closeTab(\''+cls+'\')" onclick="clickSupport(this)" id="tabIndex_'+(selectedIndex)+'_h" class="tab_selected">'+title+'</span><span title="'+dblClickMsg+'" ondblclick="closeTab(\''+cls+'\')" id="tabIndex_'+(selectedIndex)+'_w" class="tab3">&nbsp;</span>');
	var selectedBody = bodyId+'_'+selectedIndex;
	$("#"+mainId).append('<iframe  src='+url+' id="'+selectedBody+'" frameborder="0" width="'+initWidth+'px" height="'+initHeight+'px" ></iframe>');
	if(ary != '')
		ary += ',';
	ary += "{'"+cls+"':'tabIndex_"+(selectedIndex)+"_h'}";
	link += ','+selectedIndex;
}

function checkItem(cls){
	var json = eval('(['+ary+'])');
	var item ;
	for(var i = 0; i < json.length;i++){
		if(json[i][cls]){
			item= json[i][cls];
			break;
		}
	}
	if(item){
		clickSupport($("#"+item).get(0));
		return false;
	}
	return true;
}

function clickSupport(item,flag){
	var id = $(item).attr("id");
	var clickIndex = id.split("_")[1];
	if(clickIndex == selectedIndex)
		return;
	var selectedItem = itemId+"_"+selectedIndex;
	var selectedItem1 = selectedItem+"_h";
	var selectedItem2 = selectedItem+"_w";
	if(getIndex(selectedIndex)==tabCounts-1){
		$("#"+selectedItem2).removeClass("tab3").addClass("tab2");
	}else{
		if(getIndex(clickIndex)>getIndex(selectedIndex)){
			if(getIndex(clickIndex)-getIndex(selectedIndex)>1){
				$("#"+selectedItem2).removeClass("tab_mul_selected").addClass("tab_mul_unselected1");
			}
			else
				$("#"+selectedItem2).removeClass("tab_mul_selected").addClass("tab_mul_unselected");
		}else
			$("#"+selectedItem2).removeClass("tab_mul_selected").addClass("tab_mul_unselected1");
	}
	if(tabCounts>1&&getIndex(selectedIndex)>0){
		var selectedItem3 = itemId+"_"+(getPreIndex(selectedIndex))+"_w";
		//alert($("#"+selectedItem3).attr("class"))
		$("#"+selectedItem3).removeClass("tab_mul_unselected").addClass("tab_mul_unselected1");
		//alert($("#"+selectedItem3).attr("class"))
	}
	$("#"+selectedItem1).removeClass("tab_selected").addClass("tab");
	var nowBody = bodyId+'_'+selectedIndex;
	$("#"+nowBody).hide();
	
	var nowItem = itemId+"_"+clickIndex;
	var nowItem1 = nowItem+"_h";
	var nowItem2 = nowItem+"_w";
	
	$("#"+nowItem1).removeClass("tab").addClass("tab_selected");
	if(getIndex(clickIndex)==tabCounts-1){
		$("#"+nowItem2).removeClass("tab_mul_unselected").addClass("tab3");
		if(getIndex(clickIndex)-getIndex(selectedIndex)>1){
			var temp = itemId+"_"+(getPreIndex(clickIndex))+"_w";
			$("#"+temp).removeClass("tab_mul_unselected1").addClass("tab_mul_unselected");
		}
	}else{
		if(getIndex(clickIndex)>getIndex(selectedIndex)){
			$("#"+nowItem2).removeClass("tab_mul_unselected1").addClass("tab_mul_selected");
			if(getIndex(clickIndex)-getIndex(selectedIndex)>1){
				var temp = itemId+"_"+(getPreIndex(clickIndex))+"_w";
				$("#"+temp).removeClass("tab_mul_unselected1").addClass("tab_mul_unselected");
			}
		}else{
			if(getIndex(clickIndex)>0){
				var temp = itemId+"_"+(getPreIndex(clickIndex))+"_w";
				$("#"+temp).removeClass("tab_mul_unselected1").addClass("tab_mul_unselected");
			}
				$("#"+nowItem2).removeClass("tab_mul_unselected1").addClass("tab_mul_selected");
		}
	}
	var selectedBody = bodyId+'_'+clickIndex;
	if(flag){
		var src = $("#"+selectedBody).attr("src");
		$("#"+selectedBody).attr("src",src+(src.indexOf("?")==-1?"?":"&")+"t="+(new Date().getTime()).toString(36));
	}
	$("#"+selectedBody).show();
	selectedIndex = clickIndex
}
function closeTab(cls){	
	var json = eval('(['+ary+'])');
	var item ;
	for(var i = 0; i < json.length;i++){
		if(json[i][cls]){
			item= json[i][cls];
			break;
		}
	}
	if(item){
		var index = item.split("_")[1];
		var delItem = itemId+"_"+index;
		var delItem2 = itemId+"_"+(getPreIndex(index));
		var del1 = delItem+"_h";
		var del2 = delItem+"_w";
		var del3 = delItem2+"_w";
		var f1 = itemId+'_0_h';
		var f2 = itemId+'_0_w';
		var fMain = bodyId+'_0';
		var delMain = bodyId+'_'+index;
		$("#"+del1).remove();
		$("#"+del2).remove();
		$("#"+delMain).remove();
		if(getIndex(index)==(tabCounts-1)){
		    if(getIndex(selectedIndex) == getIndex(index)){
			  $("#"+del3).removeClass("tab_mul_unselected").addClass("tab2");
			  $("#"+f1).removeClass("tab").addClass("tab_selected");
			  if(tabCounts>2)
			  $("#"+f2).removeClass("tab_mul_unselected1").addClass("tab_mul_selected");
			  else
			  $("#"+f2).removeClass("tab_mul_unselected").addClass("tab3");
			  $("#"+fMain).show();
			  selectedIndex = 0;
		    }else if(selectedIndex == getPreIndex(index)){
		      $("#"+del3).removeClass("tab_mul_selected").addClass("tab3")
		    }
		    else{
		      	$("#"+del3).removeClass("tab_mul_unselected1").addClass("tab2")
		    }
		}else{
			if(getIndex(selectedIndex) == getIndex(index)){
			  $("#"+del3).removeClass("tab_mul_unselected").addClass("tab_mul_unselected1");
			  $("#"+f1).removeClass("tab").addClass("tab_selected");
			  if(tabCounts>2)
			  $("#"+f2).removeClass("tab_mul_unselected1").addClass("tab_mul_selected");
			  else
			  $("#"+f2).removeClass("tab_mul_unselected").addClass("tab3");
			  $("#"+fMain).show();
			  selectedIndex = 0;
		    }else if(selectedIndex == getPreIndex(index)){
		    if(tabCounts>2)
		      $("#"+del3).removeClass("tab_mul_selected").addClass("tab_mul_selected")
		      else
		      	$("#"+del3).removeClass("tab_mul_selected").addClass("tab3")
		    }else if(selectedIndex == getNextIndex(index)){
		      $("#"+del3).removeClass("tab_mul_selected1").addClass("tab_mul_selected")
		    }
		    else{
		      //	$("#"+del3).removeClass("tab_mul_unselected1").addClass("tab2")
		    }
		}
		tabCounts--;
		formatLink(index);
		delStr(cls,item);
	}else{
		//alert("页面关闭异常，请核对tab标签cls！");
	}
}

function delStr(cls,item){
	var strAry = ary.split(",");
	var str = '';
	for(var i =0; i < strAry.length; i++){
		if(strAry[i]== "{'"+cls+"':'"+item+"'}"){
			continue;
		}
		if(str != '')
			str += ","
		str += strAry[i];
	}
	ary = str;
}
function formatLink(index){
	var strAry = link.split(",");
	var str = '';
	for(var i =0; i < strAry.length; i++){
		if(strAry[i]== index){
			continue;
		}
		if(str != '')
			str += ","
		str += strAry[i];
	}
	link = str;
}
function getPreIndex(index){
	var strAry = link.split(",");
	for(var i =0; i < strAry.length; i++){
		if(index == strAry[i]){
			if(i>0)
				return strAry[i-1];
		}
	}
}
function getNextIndex(index){
	var strAry = link.split(",");
	for(var i =0; i < strAry.length; i++){
		if(index == strAry[i]){
			if((i+1)<strAry.length)
				return strAry[i+1];
		}
	}
}

function getIndex(index){
	var strAry = link.split(",");
	for(var i =0; i < strAry.length; i++){
		if(index == strAry[i]){
			return i;
		}
	}
}
function getMaxIndex(){
	var strAry = link.split(",");
	return parseInt(strAry[strAry.length-1],10)+1;
}
function getMaxValue(){
	var strAry = link.split(",");
	return parseInt(strAry[strAry.length-1],10);
}

function bulidId(cls){
	var json = eval('(['+ary+'])');
	var item ;
	for(var i = 0; i < json.length;i++){
		if(json[i][cls]){
			item= json[i][cls];
			break;
		}
	}
	return item;
}

function checkTab(cls,flag){
	var id = bulidId(cls);
	if(id){
		clickSupport(document.getElementById(id),flag);
	}
}

function checkFirst(){
	clickSupport(document.getElementById('tabIndex_0_h'));
}
