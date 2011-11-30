// JavaScript Document

    //加入收藏 

function AddFavorite(sURL, sTitle) 
{ 
    try 
    { 
        window.external.addFavorite(sURL, sTitle); 
    } 
    catch (e) 
    { 
        try 
        { 
            window.sidebar.addPanel(sTitle, sURL, ""); 
        } 
        catch (e) 
        { 
            alert("加入收藏失败，请使用Ctrl+D进行添加"); 
        } 
    } 
} 

//设为首页 
function SetHome(obj,vrl){ 
        try{ 
                obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl); 
        } 
        catch(e){ 
                if(window.netscape) { 
                        try { 
                                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
                        } 
                        catch (e)  { 
                                alert("此操作被浏览器拒绝！请在浏览器地址栏输入\"about:config\"并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
                        } 
                        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch); 
                        prefs.setCharPref('browser.startup.homepage',vrl); 
                 } 
        } 
} 


function jumpUrl(url){
	$.get("/index.php?g=Home&m=Reg&a=isLogin",null,function(data){
		if(data == 'notlogin') {
			window.location.href = WWWURL + "/login.html";
		}else if(data == 'login'){
			window.location.href = url;	
		}
	});	
}

$(function(){
	$("#inviteFlash").attr('src','');
	$("#quit").click(function(){
		$.get("/index.php?g=User&m=Public&a=logout",null,function(data){
			url = WWWURL; //当前的url
			if(data == 1) {
				alert('欢迎您下次再来,谢谢！')
				window.location.href = url;
			}
		});	
	});
});

//头部搜索按钮事件
function btn_search(id){
	kw = $("#kw_"+id);
	if(kw.val() == '请输入要搜索的信息'){
		kw.val('');	
	}
	istp = $("#istp_"+id).val();
	switch(istp){
		case 'building':
			if(kw.val() == ''){
				url = WWWURL + '/buildingsearch';
			}else{
				url = WWWURL + '/buildingsearch/kw_'+kw.val();
			}
			break;
		case 'Salehouse':
			if(kw.val() == ''){
				url = HOUSEURL + '/salesearch';
			}else{
				url = HOUSEURL + '/salesearch/kw_'+kw.val();
			}
			break;
		case 'News':
			if(kw.val() == ''){
				url = NEWSURL + '/search';
			}else{
				url = NEWSURL + '/search/'+kw.val();
			}
			break;
	}
	window.location.href = url;
}