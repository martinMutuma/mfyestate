var bFirstCompare = true;
var CompareData = new Array();  //保存楼盘的数组
var compareTitle = "";    //区分二手房和楼盘的变量
var titleUrl = "";        //相关楼盘或者二手房的url
var compareUrl = "";      //对比跳转到二手房或者楼盘
var iCompare = 0;         //上次对比的类型：1为楼盘 2为二手房
var m_wf_cookiesNamecp = "";     //cookies的名称
var ids = "";
var haveOrnoBuilding = true;
function openCompare(title,id,pic,iCompareTitle){
	if(iCompare != 0){
		if(iCompareTitle != iCompare){   //从二手房跳转到楼盘，或从楼盘跳转到二手房
			iCompare = iCompareTitle;
			delAll();
		}
	}
	iCompare = iCompareTitle;
	var idType = "";
	switch(iCompareTitle){
		case 1:   //为楼盘
			compareTitle = "楼盘";
			titleUrl = basePath+"";
			compareUrl = basePath+"proInfo/proInfo_compareBuildings.shtml?ids=";
			m_wf_cookiesNamecp = "building_cpdlg";
			idType = "/";
			break;
		case 2:   //为二手房
			compareTitle = "二手房";
			titleUrl = "__HOUSEURL__/sale/";
			compareUrl = "/index.php?m=Salehousecompare&a=index&ids=";
			m_wf_cookiesNamecp = "Salehouse_cpdlg";
			idType = ".html";
			break;
	}
	
	$("#sTitle").html(compareTitle+"对比");
	
	if(bFirstCompare){
   	    getMsg();
    	resizeDiv();
    }else{
        
    }
	
/*	var strCookies = getCookie(m_wf_cookiesNamecp);
	if(strCookies == "" || strCookies == null){
		bFirstCompare = false;
	}else{
		var isAt_id = false;
		var strArr = strCookies.split("<->");
		for(var i=0; i<strArr.length; i++){
			var strArr_index = strArr[i].split(",");
			if(bFirstCompare){
				var url = titleUrl+strArr_index[1]+idType;
				var info = "<div class='tit01 all366C' id='d"+strArr_index[1]+"'><a href='"+url+"' target='_blank'><img src='"+strArr_index[2]+"' /></a> <a href='"+url+"' target='_blank'>"+strArr_index[0]+"</a><span class='allf60'><a href='javascript:void(0)' onclick=\"delData("+strArr_index[1]+")\">删除</a></span></div>";
				$("#ttttt").append(info);
			}
			if(id == strArr_index[1]){
				isAt_id = true;
			}
		}
		
		bFirstCompare = false;
		if(isAt_id){
			//alert("已经存在的"+compareTitle);
			return;
		}
		
		if(strArr.length > 3){
		   alert("最多只能对比4个"+compareTitle);
		   return;
		}
	}
*/
	addData(title,id,pic);
    
}

$(window).resize(resizeDiv());
window.onerror = function(){}
var divTop,divLeft,divWidth,divHeight,docHeight,docWidth,objTimer;
function getMsg()
{
	try{
		divTop = parseInt(document.getElementById("cDlg").style.top,10);
		divLeft = parseInt(document.getElementById("cDlg").style.left,10);
		divHeight = parseInt(document.getElementById("cDlg").offsetHeight,10);
		divWidth = parseInt(document.getElementById("cDlg").offsetWidth,10);
		
		docWidth = $(window).width();
		docHeight = $(window).height();
		
		$("#cDlg").css("top",docHeight - divHeight- 200 + parseInt(document.documentElement.scrollTop,10)+"px");
		$("#cDlg").css("left",docWidth - divWidth + parseInt(document.documentElement.scrollLeft,10)+"px");
		
		document.getElementById("cDlg").style.visibility="visible";
		objTimer = window.setInterval("moveDiv()",10);
	}
	catch(e){}
}

function resizeDiv()
{
	try{
		divHeight = $("#cDlg").height();
		divWidth = $("#cDlg").width()+5;
		docWidth = $(window).width();
		docHeight = $(window).height();
		$("#cDlg").css("top",docHeight - divHeight- 200 + parseInt(document.documentElement.scrollTop,10)+"px");
		$("#cDlg").css("left",docWidth - divWidth + parseInt(document.documentElement.scrollLeft,10)+"px");
	}
	catch(e){}
}

function moveDiv()
{
	try
	{
		if(parseInt(document.getElementById("cDlg").style.top,10) <= (docHeight - divHeight + parseInt(document.documentElement.scrollTop,10)))
		{
			window.clearInterval(objTimer);
			objTimer = window.setInterval("resizeDiv()",1);
		}
		divTop = parseInt(document.getElementById("cDlg").style.top,10);
		document.getElementById("cDlg").style.top = divTop - 1;
	}
	catch(e){}
}
function closeDiv()
{
	$("#cDlg").css("visibility","hidden");
	bFirstCompare = true;
	// $("#ttttt div").remove();
	// ids = '';
	if(objTimer){
		window.clearInterval(objTimer);
	}
}
function addData(title,id,pic){
	var idType = "";
	switch(iCompare){
		case 1:
			idType = "/";
			break;
		case 2:
			idType = ".html";
			break;
	}
	//alert('添加开始 '+ids)
	haveOrnoBuilding = true;
	if(ids.indexOf(',')==-1){
		if(id==ids){
			haveOrnoBuilding = false;
		}
	}else{
		for(var i=0;i<ids.split(',').length;i++){
			if(id==ids.split(',')[i]){
				haveOrnoBuilding = false;
				break;
			}
		}
	}
	if(haveOrnoBuilding){
		if(ids=='')
			ids = id;
		else
			ids+=','+id;
		var url = titleUrl+id+idType;
		var info = "<div class='tit01 all366C' id='d"+id+"'><a href='"+url+"' target='_blank'><img src='"+pic+"' /></a> <a href='"+url+"' target='_blank'>"+title+"</a><span class='allf60'><a href='javascript:void(0)' onclick=\"delData("+id+")\">删除</a></span></div>";
		$("#ttttt").append(info);
	}
	//alert('添加结束  '+ids)
	/*var strCookies = getCookie(m_wf_cookiesNamecp);
	//alert(strCookies);
	if(strCookies == "" || strCookies == null){
		strCookies = "";
	}else{
		strCookies = strCookies+"<->";
	}
	var cookieVal = strCookies+title+","+id+","+pic;
	SetCookie(m_wf_cookiesNamecp,cookieVal);
	alert(getCookie(m_wf_cookiesNamecp));
	*/
}

//删除数据
function delData(index){
    $("#d"+index).remove();
 //   alert('删除开始 '+ids)
    if(ids.indexOf(',')==-1){
		if(index==ids){
			ids = '';
		}
	}else{
	    var lengthIds = ids.split(',').length; 
	    var idss = ids;
	    ids='';
	    for(var i=0;i<lengthIds;i++){
			if(index!=idss.split(',')[i]){
				if(i==0)
					ids = idss.split(',')[i];
				else
					ids +=',' + idss.split(',')[i];
			}
		}
	}
	//alert('删除结束 '+ids)
	var strCookies = getCookie(m_wf_cookiesNamecp);
	var strArr = strCookies.split("<->");
	var cookieVal = "";
	for(var i=0; i<strArr.length; i++){
		var strArr_index = strArr[i].split(",");
		//alert(strArr_index[1]+"  "+index);
		if(strArr_index[1] == index){
			if(i == strArr.length-1){
				cookieVal = cookieVal.substr(0,cookieVal.length-3);
			}
			continue;
		}
		if(i == strArr.length-1){
			cookieVal = cookieVal+strArr[i];
		}else{
			cookieVal = cookieVal+strArr[i]+"<->";
		}
	}
	SetCookie(m_wf_cookiesNamecp,cookieVal);
	
}

//cids有值就直接对比，没有就读取COOKIES信息
function compareDatat(){
 	if(ids.split(',').length<2||ids.split(',').length>4){
	  	$.messager.alert('提示','请选择2-4个楼盘进行比较','warning',function(){
		});
		return false;
	  }
	  else
	   window.location.href = basePath+"proInfo/proInfo_compareBuildings.shtml?ids="+ids;
/*	if(ids.split){
		var url = "/index.php?m=Salehousecompare&a=index&ids="+cids;	
	}else{
		var ids = "";
		var strCookies = getCookie(m_wf_cookiesNamecp);
		var strArr = strCookies.split("<->");
		if(strArr.length < 2){
			alert(compareTitle+"个数须2--4个");
			return;
		}
		for(var i=0; i<strArr.length; i++){
			var strArr_index = strArr[i].split(",");
			if(i != strArr.length-1){
				ids += strArr_index[1] + ",";
			}else{
				ids += strArr_index[1];
			}
		}
		var url = compareUrl+ids;
	}
	window.open(url,"_blank");
	return false;
	*/
}
function delAll(){
	$('#ttttt').html("");
	ids='';
	SetCookie(m_wf_cookiesNamecp,"");
}