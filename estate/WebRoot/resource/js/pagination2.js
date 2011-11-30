var pageno_warning_text = 'input value is not a number!'
//totalRecords,pageNo,limit,id
function pagination(config){
	if(config){
		var totalRecords = parseInt(config.totalRecords,10);
		var pageNo = parseInt(config.pageNo,10);
		var pageSize = parseInt(config.limit,10);
		var totalPages = parseInt((totalRecords + pageSize - 1) / pageSize);
		var showPages = 10;
		if(typeof config.showPages != 'undefined')
			showPages = parseInt(config.showPages,10);
		var uri = '';
		if(typeof config.uri!='undefined'){
			uri = config.uri;
		}
		var id = config.id;
		var width = 85;
		var nationStr = '<div id="pagenation_bar" class="pagenation"><span class="total_records">共'+totalRecords+'条记录</span>';
		if(totalPages <= showPages){
			if(pageNo > 1){
				nationStr += '<span onmouseover="this.className=this.className.replace(\'page_out\',\'\');this.className+=\' page_over\'" onmouseout="this.className=this.className.replace(\'page_over\',\'\');this.className+=\' page_out\'"  class="next"><a href="javascript:dealUri('+(pageNo-1)+','+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')">&lt;&lt;</a></span>';
				width += 40;
			}
			for(var i = 1; i <= totalPages; i++){
				nationStr += '<span class="page ';
				if(pageNo == i)
					nationStr += 'page_checked ">'+i;
				else
					nationStr += '" onmouseover="this.className=this.className.replace(\'page_out\',\'\');this.className+=\' page_over\'" onmouseout="this.className=this.className.replace(\'page_over\',\'\');this.className+=\' page_out\'" ><a href="javascript:dealUri('+i+','+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')">'+i+'</a>';
				nationStr += '</span>';
				width += 30;
			}
			if(totalPages > 1&&pageNo<totalPages){
				nationStr += '<span onmouseover="this.className=this.className.replace(\'page_out\',\'\');this.className+=\' page_over\'" onmouseout="this.className=this.className.replace(\'page_over\',\'\');this.className+=\' page_out\'"  class="next"><a href="javascript:dealUri('+(pageNo+1)+','+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')">&gt;&gt;</a></span>';
				width += 40;
			}
		}else{
			if(pageNo < 4){
				if(pageNo > 1){
					nationStr += '<span onmouseover="this.className=this.className.replace(\'page_out\',\'\');this.className+=\' page_over\'" onmouseout="this.className=this.className.replace(\'page_over\',\'\');this.className+=\' page_out\'"  class="next"><a href="javascript:dealUri('+(pageNo-1)+','+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')">&lt;&lt;</a></span>';
					width += 40;
				}
				for(var i = 1; i <= showPages; i++){
					nationStr += '<span class="page ';
					if(pageNo == i)
						nationStr += 'page_checked ">'+i;
					else
						nationStr += '" onmouseover="this.className=this.className.replace(\'page_out\',\'\');this.className+=\' page_over\'" onmouseout="this.className=this.className.replace(\'page_over\',\'\');this.className+=\' page_out\'" ><a href="javascript:dealUri('+i+','+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')">'+i+'</a>';
					nationStr += '</span>';
					width += 30;
				}
				nationStr += '<span onmouseover="this.className=this.className.replace(\'page_out\',\'\');this.className+=\' page_over\'" onmouseout="this.className=this.className.replace(\'page_over\',\'\');this.className+=\' page_out\'"  class="next"><a href="javascript:dealUri('+(pageNo+1)+','+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')">&gt;&gt;</a></span>';
				width += 40;
				nationStr += '<span onmouseover="this.className=this.className.replace(\'page_out\',\'\');this.className+=\' page_over\'" onmouseout="this.className=this.className.replace(\'page_over\',\'\');this.className+=\' page_out\'"  class="next"><a href="javascript:dealUri('+totalPages+','+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')">... '+totalPages+'</a></span>';
				width += 40;
			}else{
				nationStr += '<span onmouseover="this.className=this.className.replace(\'page_out\',\'\');this.className+=\' page_over\'" onmouseout="this.className=this.className.replace(\'page_over\',\'\');this.className+=\' page_out\'"  class="next"><a href="javascript:dealUri(1,'+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')">1 ...</a></span>';
				width += 40;
				nationStr += '<span onmouseover="this.className=this.className.replace(\'page_out\',\'\');this.className+=\' page_over\'" onmouseout="this.className=this.className.replace(\'page_over\',\'\');this.className+=\' page_out\'"  class="next"><a href="javascript:dealUri('+(pageNo-1)+','+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')">&lt;&lt;</a></span>';
				width += 40;
				if((totalPages - pageNo + 1) > (showPages - 2)){
					for(var i = pageNo - 2; i <= pageNo+(showPages-3); i++){
						nationStr += '<span class="page ';
						if(pageNo == i)
							nationStr += 'page_checked ">'+i;
						else
							nationStr += '" onmouseover="this.className=this.className.replace(\'page_out\',\'\');this.className+=\' page_over\'" onmouseout="this.className=this.className.replace(\'page_over\',\'\');this.className+=\' page_out\'" ><a href="javascript:dealUri('+i+','+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')">'+i+'</a>';
						nationStr += '</span>';
						width += 30;
					}
					nationStr += '<span onmouseover="this.className=this.className.replace(\'page_out\',\'\');this.className+=\' page_over\'" onmouseout="this.className=this.className.replace(\'page_over\',\'\');this.className+=\' page_out\'"  class="next"><a href="javascript:dealUri('+(pageNo+1)+','+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')">&gt;&gt;</a></span>';
					width += 40;
					nationStr += '<span onmouseover="this.className=this.className.replace(\'page_out\',\'\');this.className+=\' page_over\'" onmouseout="this.className=this.className.replace(\'page_over\',\'\');this.className+=\' page_out\'"  class="next"><a href="javascript:dealUri('+totalPages+','+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')">... '+totalPages+'</a></span>';
					width += 40;
				}
				else{
					for(var i = totalPages - (showPages-1); i <= totalPages; i++){
						nationStr += '<span class="page ';
						if(pageNo == i)
							nationStr += 'page_checked ">'+i;
						else
							nationStr += '" onmouseover="this.className=this.className.replace(\'page_out\',\'\');this.className+=\' page_over\'" onmouseout="this.className=this.className.replace(\'page_over\',\'\');this.className+=\' page_out\'" ><a href="javascript:dealUri('+i+','+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')">'+i+'</a>';
						nationStr += '</span>';
						width += 30;
					}
					if(pageNo != totalPages){
						nationStr += '<span onmouseover="this.className=this.className.replace(\'page_out\',\'\');this.className+=\' page_over\'" onmouseout="this.className=this.className.replace(\'page_over\',\'\');this.className+=\' page_out\'"  class="next"><a href="javascript:dealUri('+(pageNo+1)+','+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')">&gt;&gt;</a></span>';
						width += 40;
					}
				}
			}
			nationStr += '<span class="goto">第 <input onblur="dealUri(this.value,'+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')" onkeydown="if(event.keyCode == 13)dealUri(this.value,'+pageSize+','+((typeof uri == 'string')?'\''+uri+'\'':uri)+')"/> 页</span>';
			width += 100;
		}
		document.getElementById(id).innerHTML = nationStr;
		//document.getElementById('pagenation_bar').style.width = width + 'px';
	}
}



function dealUri(pageno,limit,uri){
	if(isNaN(pageno)){
		alert(pageno_warning_text);
		return;
	}
	if(typeof uri == 'string'){
		uri += (uri.indexOf('?')==-1?"?":"&")+"pageNo="+pageno+"&limit="+limit;
		window.location.href = uri;
	}
	else{
		uri(pageno,limit);
	}
}