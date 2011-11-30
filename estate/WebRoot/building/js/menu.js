// JavaScript Document
var m_fenxiaoTel = '0898-66668989';  //分销电话
//获取秘书电话
function getMishuTel(tel){
	var saleTel = tel;
	var arrFuhao = new Array();
	var isOne = true; //只含有一个电话
	arrFuhao[0] = "、";
	arrFuhao[1] = ",";
	arrFuhao[2] = "，";
	arrFuhao[3] = " ";
	arrFuhao[4] = ".";
	if(saleTel != ""){
		for(var i=0; i<arrFuhao.length; i++){
			var arrTel = saleTel.split(arrFuhao[i]);
			if(arrTel.length>=2){
				//document.write(arrTel[0]);
				m_fenxiaoTel = arrTel[0];
				isOne = false;
			}
		}
		if(isOne){
			//document.write(saleTel);
			m_fenxiaoTel = saleTel;
		}
	}else{
		//document.write("暂无");
		m_fenxiaoTel = "暂无";
	}
}

function faseSearch(num,onnum,onCsn){
	 for (i=0;i<=num;i++){
		 $('#fss'+i).hide();
		 $('#fs'+i).removeClass(); 
	 }
	$('#fss'+onnum).show(); 
	$('#fs'+onnum).addClass(onCsn); 	
}

function myTab(titStr,boxStr,num,onnum,Csn,onCsn)
 {
	 for (i=1;i<=num;i++){
		 document.getElementById((boxStr+i)).style.display="none";
		 document.getElementById((titStr+i)).className=Csn; 
	 }
	 
	document.getElementById((boxStr+onnum)).style.display="block"; 
	document.getElementById((titStr+onnum)).className=onCsn; 	
	
 }
 
 //加入关注
function addConcern(buildingId,buildingName,type,obj){
   $.get("/index.php?m=Buildinginfo&a=AjaxAddGuanz&",{buildingId:buildingId,type:type,buildingName:buildingName},function(data){																													        //alert(data);
		switch(data){
			case "-2":
					alert("关注失败");
				break;
			case "-1":    //已经存在的
					//$(obj).attr({"display":"none"});
				    alert("已关注的楼盘，不能重复关注");
				break;
			case "0":    //不是用户 跳转到登陆界面
					if(confirm("您尚未登陆，不能对此楼盘添加关注，是否需要登录")){
						var url="http://www.mymfy.com/member/login.jsp";
						window.open(url,"_blank");
					}
				break;
			default:
					alert("关注成功");
					if(obj != ""){
						$("#"+obj).html(data);
					}
				break;
		}
   });
}

//urltype: 0 为图片小图 1为大图 
function getXMLData(buildingId,ptype,urltype,urlPre){
	buildingId = parseInt(buildingId);
	var fileNum = parseInt(buildingId/1000)+1;

	var XMLurl = "/app/Lang/zh-cn/imgseehouse/imgseehouse"+fileNum+".xml";
	var xmlDoc;
	var is_IE = false;
	
	if (window.ActiveXObject)
	{
		is_IE = true;
		xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
	}
	else if (document.implementation.createDocument)
	{
		xmlDoc=document.implementation.createDocument("","",null);
	}
	else
	{
		alert('浏览器不支持XML的读取,请使用IE浏览器');
	}
	xmlDoc.async=false;
	xmlDoc.load(XMLurl);
	
	var x=xmlDoc.getElementsByTagName('building');
	var bs=new Array();
	bs['allimg']='全部图片';
	bs['hx']='户型图';
	/*bs['xq']='小区概貌';
	bs['zb']='周边环境';
	bs['pt']='配套环境';
	bs['other']='其他';
	bs['yb']='样板间';*/
	bs['xg']='效果图';
	bs['jt']='交通图';
	bs['sj']='实景图';
	bs['zb']='周边配套';
	bs['other']='其他';
	bs['yb']='样板间';
	var styClass = "";
	//alert(x.length);
	for (var i=0;i<x.length;i++)
	{
		var bid = x[i].childNodes[0].text != undefined ? x[i].childNodes[0].text:x[i].childNodes[0].textContent;
		if(bid == buildingId){
			for(var j=x[i].childNodes.length-1; j>=1; j--){
				var picCount = x[i].childNodes[j].text != undefined ? x[i].childNodes[j].text:x[i].childNodes[j].textContent;
				var type = x[i].childNodes[j].nodeName;
				if(type == "hx"){
					continue;
				}
				if(type == ptype){
					styClass = "class='kkOn'";
				}else{
					styClass = "class='kkOff'";
				}
				if(urltype == 0){
					//var url = "/index.php?m=Buildinginfo&a=showImg&id="+buildingId+"&ptype="+type;
					var url = urlPre+buildingId+"-photo-"+type+"/"; 
				}else{
					//var url = "/index.php?m=Buildinginfo&a=showDetailimg&id="+buildingId+"&ptype="+type;
					var url = urlPre+buildingId+"-photo-"+type+"-0.html";
				}
				$("#imgTitle").append("<li "+styClass+"><a href='"+url+"'>"+bs[x[i].childNodes[j].nodeName]+"("+picCount+")</a></li>");
			}
			break;
		}
	}
}

//保存cookies
function SetCookie(name,value)//两个参数，一个是cookie的名子，一个是值
{
    var Days = 3; //此 cookie 将被保存 3 天
    var exp  = new Date();    //new Date("December 31, 9998");
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

//取cookies函数
function getCookie(name)           
{
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
     if(arr != null) return unescape(arr[2]); return null;

}
function TejiaTime(){
	var today=new Date();
	today = Date.parse(today)/1000;
		
	var oldTime = $("#TejiaEndTime").val();
	var time = oldTime - today;
	
	if(time <= 0){
		//$('#d_time_'+i).html("<span style='color:red;'>团购已结束</span>,到<a href='###'>"+$('#url_mc_'+i).html()+"</a>看看详情");
		$("#ShowTejiaEndTime").html("<font color='red'>本期活动已结束，期待下一期</font>");
	}else{
		var day = Math.floor(time/(60*60*24));
		if(day <= 9) day = '0'+day;
		var hours = Math.floor(time/(60*60))%24;
		if(hours <= 9) hours = '0'+hours;
		var Minutes = Math.floor(time/60)%60;
		if(Minutes <= 9) Minutes = '0'+Minutes;
		var seconds = Math.floor(time)%60;
		if(seconds <= 9) seconds = '0'+seconds;
		var text = "报名仅剩：<span class=\"bold f20\">"+day+"</span> 天<span class=\"bold f20\">"+hours+"</span> 小时<span class=\"bold f20\">"+Minutes+"</span> 分<span class=\"bold f20\">"+seconds+"</span> 秒";
		//var text = day+"天"+hours+"小时"+Minutes+"分"+seconds+"秒";
		$("#ShowTejiaEndTime").html(text);
	}
	setTimeout("TejiaTime()",1000);
}
//删除cookie
function delCookie(name)
{
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}

//bid为楼盘ID
function getSuggestion(fun,page,url,id,bid){
	//alert(bid);
	$("#"+id).html("数据加载中,请稍后.....");
	$.post(url,{page:page,fun:fun,url:url,plid:id,bid:bid},function(data){
		//alert(data);
		$("#"+id).html(data);
		if(page != 1){
			location.href = "#"+id;
		}
	});
}

function checkbrowse() {
    var ua = navigator.userAgent.toLowerCase();
    var is = (ua.match(/\b(chrome|opera|safari|msie|firefox)\b/) || ['', 'mozilla'])[1];
    var r = '(?:' + is + '|version)[\\/: ]([\\d.]+)';
    var v = (ua.match(new RegExp(r)) || [])[1];
    jQuery.browser.is = is;
    jQuery.browser.ver = v;
    return {
        'is': jQuery.browser.is,
        'ver': jQuery.browser.ver
    }
}

function tuanTime(temp){
	var today=new Date();
	today = Date.parse(today)/1000;
		
	var oldTime = $("#endTime").val();
	var time = oldTime - today;
	
	if(time <= 0){
		//$('#d_time_'+i).html("<span style='color:red;'>团购已结束</span>,到<a href='###'>"+$('#url_mc_'+i).html()+"</a>看看详情");
		$("#ShowEndTime").html("<font color='red'>本期活动已结束，期待下一期</font>");
	}else{
		var day = Math.floor(time/(60*60*24));
		var hours = Math.floor(time/(60*60))%24;
		var Minutes = Math.floor(time/60)%60;
		var seconds = Math.floor(time)%60;
		
		var CDay= day;
		if(CDay <= 9) CDay = '0'+CDay;
        var CHour= hours % 24;   
		if(CHour <= 9) CHour = '0'+CHour;
        var CMinute= Minutes % 60;   
		if(CMinute <= 9) CMinute = '0'+CMinute;
        var CSecond= seconds % 60; 
		if(CSecond <= 9) CSecond = '0'+CSecond;
		//var text = day+"天"+hours+"小时"+Minutes+"分"+seconds+"秒";
		var text = "报名仅剩：<span class=\"bold f20\">"+CDay+"</span> 天<span class=\"bold f20\">"+CHour+"</span> 小时<span class=\"bold f20\">"+CMinute+"</span> 分<span class=\"bold f20\">"+CSecond+"</span> 秒";
		if(temp == 1){
			$("#ShowEndTime").html("<strong class=\"f20\">"+CDay+"</strong> 天 <strong class=\"f20\">"+CHour+"</strong> 小时 <strong class=\"f20\">"+CMinute+"</strong> 分 <strong class=\"f20\">"+CSecond+"</strong> 秒");
		}else{
			$("#ShowEndTime").html(text);
			temp = "";
		}
		
	}
	setTimeout("tuanTime('"+temp+"')",1000);
}

startList = function() {
	if (document.all&&document.getElementById) {
		navRoot = document.getElementById("kindnav");
		for (i=0; i<navRoot.childNodes.length; i++) {
			node = navRoot.childNodes[i];
			if (node.nodeName=="LI") {
				node.onmouseover=function() {
					this.className+=" over";
				}
				node.onmouseout=function() {
					this.className=this.className.replace(" over", "");
				}
			}
		}
	}
}

function wfStartList(id){
	if (document.all&&document.getElementById) {
		navRoot = document.getElementById(id);
		for (i=0; i<navRoot.childNodes.length; i++) {
			node = navRoot.childNodes[i];
			if (node.nodeName=="LI") {
				node.onmouseover=function() {
					this.className+=" over";
				}
				node.onmouseout=function() {
					this.className=this.className.replace(" over", "");
				}
			}
		}
	}
}

//手机号码验证
function t_checkTel(mobile){     
	if (mobile != ""){      
		var reg0 = /^13\d{9}$/;   
		var reg1 = /^153\d{8}$/;   
		var reg2 = /^159\d{8}$/;   
		var reg3 = /^16\d{9}$/; 
		var reg4 = /^150\d{8}$/;
		var reg5 = /^158\d{8}$/;
		var reg6 = /^15\d{9}$/;
		var reg7 = /^18\d{9}$/; 
		var my = false;   
		if (reg0.test(mobile))my=true;   
		if (reg1.test(mobile))my=true;   
		if (reg2.test(mobile))my=true;   
		if (reg3.test(mobile))my=true; 
		if (reg4.test(mobile))my=true;   
		if (reg5.test(mobile))my=true;   
		if (reg6.test(mobile))my=true;
		if (reg7.test(mobile))my=true;
		if (!my){ 
			return false;   
		}   
		return true;   
	}
}

function btn_send_submit(id,msg){
	tkeys = $("#tkeys_"+id);
	if(tkeys.val() == '' || tkeys.val() == msg){
		alert('请填写订阅的手机号码！');
		tkeys.val('');
		tkeys.focus();
	}else if(!t_checkTel(tkeys.val())){
		alert('手机号码格式错误！');
		tkeys.val('');
		tkeys.focus();
	}else{
		type = MODULE;
		$.post('/index.php?g=Home&m=Buildingspecial&a=telSub',{tkeys:tkeys.val(),type:type},function(data){
			if(data == 'repeat'){
				alert('该手机号码已参与订阅！');
				tkeys.val('');
				tkeys.focus();	
			}else if(data == 'error'){
				alert('订阅失败,请稍候再试...');
				tkeys.focus();
			}else if(data == 'success'){
				alert('订阅成功！');
				tkeys.val('');
			}
		});	
	}	
}


function btn_tuan_tejia_submit(){
	var type = MODULE;
	//alert($("#form").serialize());
	var reg = /^13[0-9]{1}[0-9]{8}$|15[0189]{1}[0-9]{8}$|18[0-9]{1}[0-9]{8}|152[0-9]{8}$/;
	var name = $("input[name=name]").val();
	var tel = $("input[name=tel]").val();
	if(name == ""){
		$("#nameTips").html("<font color='red'>* 请告诉我们,如何称呼您</font>");
		return;
	}
	if(tel == ""){
		$("#telTips").html("<font color='red'>* 请告诉我们,如何联系您</font>");
		return;
	}
	if(!reg.test(tel)){
		$("#telTips").html("<font color='red'>* 请输入正确的手机号码</font>");
		return;
	}
	if(!$("#ckbox").attr("checked")){
		if(type == 'Buildingspecial'){
			$("#tuanwf").html("请先阅读并同意《我房特价1套服务条款》");
		}else if(type == 'Buildingtuan'){
			$("#tuanwf").html("请先阅读并同意《我房团购服务条款》");
		}
		return;
	}
	
	$.post('/index.php?g=Home&m=Buildingtuan&a=joinbm',
		   $("#form").serialize(),
		   function(data){
		switch(data){
			case "-1":
				if(type == 'Buildingspecial'){
					window.location.href = '/special/jointerror_'+$("input[name=id]").val()+'.html';	
				}else{
					window.location.href = '/tuan/jointerror_'+$("input[name=id]").val()+'.html';
				}
				//$("#tuanwf").html("报名失败，请稍后在试");
				break;
			case "0":
				if(type == 'Buildingspecial'){
					$("#tuanwf").html("该手机号码已经报名过该特价活动");
				} else if(type == 'Buildingtuan'){
					$("#tuanwf").html("该手机号码已经报名过此团购楼盘");
				}
				break;
			case "1":
				if(type == 'Buildingspecial'){
					window.location.href = '/special/jointsuccess_'+$("input[name=id]").val()+'.html';	
				}else{
					window.location.href = '/tuan/jointsuccess_'+$("input[name=id]").val()+'.html';
				}
				//$("#tuanwf").html("报名已成功");
				break;
		}
	})
}


function zhiyeDlg(url){
    //var DlgUrl = "{:U(DlgHouseNeed)}";
    ymPrompt.win({title:'',width:670,height:500,fixPosition:true,iframe:{id:'myId',name:'myName',src:url}});
}

function delCompare(id){
    var ids = document.getElementById("ids").value;
    var iSeek = ids.indexOf(",");
    var new_ids = "";
    var bFirst = true;
    while(iSeek != -1){
        if(ids.substr(0,iSeek) != id){
            if(bFirst == true){
                bFirst = false;
                new_ids = ids.substr(0,iSeek);
            }else{
                new_ids = new_ids+","+ids.substr(0,iSeek);
            }
        }
        ids = ids.substr(iSeek+1,ids.length);
        iSeek = ids.indexOf(",");
    }
    if(ids != id){
        if(new_ids != ""){
            new_ids = new_ids+","+ids;
        }else{
            new_ids = ids;
        }
            
    }
    var url = "/index.php?m=Buildingcompare&a=index&ids="+new_ids;
    window.location.href = url;
}

function addConcern_com(buildingId,buildingName,type,obj){
	var tipId = "";
	var tipText = "";
	switch(type){
		case "2":   //关注
			tipId = buildingId+"gz"+"Tips";
			tipText = "关注";
			break;
		case "6":    //备选
			tipId = buildingId+"bx"+"Tips";
			tipText = "备选";
			break;  
	}
	var url = "/index.php?m=Buildinginfo&a=AjaxAddGuanz";
    $.get(url,{buildingId:buildingId,type:type,buildingName:buildingName},function(data){
		switch(data){
			case "-2":
					$("#"+tipId).html(tipText+"失败");			
				break;
			case "-1":    //已经存在的
				    $(obj).attr({"disabled":"disabled"});
					$("#"+tipId).html("已"+tipText+"的楼盘");
				break;
			case "0":    //不是用户 跳转到登陆界面
					var url = "/index.php?g=Home&m=Popular&a=login";
					window.open(url);
				break;
			default:
					$(obj).attr({"disabled":"disabled"});
					$("#"+tipId).html(tipText+"成功");
					$("#"+tipId+"C").html(data);
				break;
		}
   });
}


function jumpUrlTuan(id){
	var url = "/index.php?m=Buildinginfo&a=index&id="+id+"#tuan";
	window.open(url);
}