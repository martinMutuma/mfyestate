function g(o){
	return document.getElementById(o);
}

function searchFormSubmit(page){
        document.getElementById("page").value = page;
		document.searchForm.method="post";
		document.searchForm.submit();
}


// 去掉字符串的头空格（左空格）
    function LTrim(str){ 
        var i;
        for(i=0;i<str.length; i++) {
            if(str.charAt(i)!=" ") break;
        }
        str = str.substring(i,str.length);
        return str;
    }
    
    // 去掉字符串的尾空格（右空格）
    function RTrim(str){
        var i;
        for(i=str.length-1;i>=0;i--){
            if(str.charAt(i)!=" ") break;
        }
        str = str.substring(0,i+1);
        return str;
    }
    
    // 去掉字符串的头尾空格（左右空格）
    function Trim(str){
        return LTrim(RTrim(str));
    }







   
        var hotspoturl =  basePath+"news/news_getHotspot.shtml";
        $.get(hotspoturl,function(res){
        	if(res != 1){
        	var json = res;
        	var str = "";
        	for (var one in json)
			    {   
			        str += "<div  class=\"it_title\"><div class=\"f-left\"><img src=\"img/head-mark3.gif\" align=\"middle\" class=\"img-vm\" border=\"0\"/> <a href=\"news_toNewsInfo.shtml?type="+json[one].columnType+"&id="+json[one].id+"\" title=\""+json[one].title+"\" target=\"_blank\"><span >"
			        +json[one].title+"</span></a></div><div class=\"f-right\">"+json[one].createTime+"</div><div class=\"clear\"></div></div>";
			    }
        	}else{
        	  str="新闻正在发布中，请等待...";
        	}
        	$("#hotspotdiv").html(str);  
        })
        var recommendurl =  basePath+"news/news_getRecommend.shtml";
        $.get(recommendurl,function(res){
        	if(res != 1){
        	var json = res;
        	var str = "";
        	for (var one in json)
			    {   
			        str += "<div  class=\"it_title\"><div class=\"f-left\"><img src=\"img/head-mark3.gif\" align=\"middle\" class=\"img-vm\" border=\"0\"/> <a href=\"news_toNewsInfo.shtml?type="+json[one].columnType+"&id="+json[one].id+"\" title=\""+json[one].title+"\" target=\"_blank\"><span >"
			        +json[one].title+"</span></a></div><div class=\"f-right\">"+json[one].createTime+"</div><div class=\"clear\"></div></div>";
			    }
        	}else{
        	  str="新闻正在发布中，请等待...";
        	}
        	$("#recommenddiv").html(str);  
        })
        
        for(var i = 3; i<=6 ;i++){
          getTypeNews(i);
        }
        
        
     
        var rankingurl =  basePath+"news/news_getRanking.shtml";
        $.get(rankingurl,function(res){
        	if(res != 1){
        	var json = res;
        	var str = "";
        	for (var one in json)
			    {   
			        
			        str += "<a href=\"news_toNewsInfo.shtml?type="+json[one].columnType+"&id="+json[one].id+"\" title=\""+json[one].title+"\" target=\"_blank\">"+json[one].title+" </a> <br />";
			    }
        	}else{
        	  str="新闻正在发布中，请等待...";
        	}
        	$("#rankingdiv").html(str);
        })



function getTypeNews(i) {
     var projecturl =  basePath+"news/news_getTypeNews.shtml?type="+i;
           $.get(projecturl,function(res){
        	if(res != 1){
        	var json = res;
        	var str = "";
        	for (var one in json)
			    {   
			        str += "<div class=\"it_title\"><div class=\"f-left\">&middot; <a href=\"news_toNewsInfo.shtml?type="+json[one].columnType+"&id="+json[one].id+"\" title=\""
			        +json[one].title+"\" target=\"_blank\"><span>"+json[one].title+"</span></a></div><div class=\"f-right\">"+json[one].createTime+"</div><div class=\"clear\"></div></div>";
			    }
        	}else{
        	  str="新闻正在发布中，请等待...";
        	}
        	if(i==3)$("#projectdiv").html(str);
        	if(i==4)$("#personagediv").html(str);
        	if(i==5)$("#landedEstatediv").html(str);
        	if(i==6)$("#commentdiv").html(str);
        })

}