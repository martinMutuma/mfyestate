function g(o){
	return document.getElementById(o);
}

function searchFormSubmit(page){
        document.getElementById("page").value = page;
		document.searchForm.method="post";
		document.searchForm.submit();
}


$(function(){

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
        	  str="新闻正在发布在，请等待...";
        	}
        	$("#rankingdiv").html(str);
        })
        


})