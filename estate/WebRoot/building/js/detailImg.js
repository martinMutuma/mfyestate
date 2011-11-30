//切换图片
function setPage(ic){
	page = 1;
	$('#con_list'+ic).animate({top:0},'slow');
}
var page = 1;
var it = 3;
function changeImg(sid,img,c){   //img第几个，sid是第几个DIV
    var lilen = $('#'+c+' li').length;
    $("#aimg").css("display","none");
	for(var i=0;i<lilen;i++){
		$("#aimg"+i+sid).css("display","none");
	}
	
	$("#aimg"+img+sid).css("display","");
}

function beginimg(sid,c,id){
    var lilen = $('#'+c+' li').length;
	for(var i=0;i<lilen;i++){
		$("#aimg"+i+sid).css("display","none");
	}
	if(id==''){
	     $("#aimg"+0+sid).css("display",""); 
	}
}


function prev(id,idl){
    var conheight = $('#'+id).height()-8;
    var lilen = $('#'+idl+' li').length;
    var len = Math.ceil(lilen/it);
	if( page == 1 ) {
		 if(len == 1){  //只有一页不翻转
			 return;
		 }
		 $('#'+idl).animate({top:'-=' + conheight*(1)},'slow');
		 page++;
		 
		 if(page == len){
			 $("#prev img").attr("src","images/see_top01.gif");
			 $("#prev").css({"cursor":"default"});
		 }
		 if(page >= 2){
			 $("#next img").attr("src","images/see_foot.gif");
			 $("#next").css({"cursor":"pointer"});
	     }
	}else{
		if(page >= len){
			return;  //最后一页不能滚动了
		}
		$('#'+idl).animate({top:'-=' + conheight},'slow');
		page++;
		if(page == len){
			$("#prev img").attr("src","images/see_top01.gif");
			$("#prev").css({"cursor":"default"});
		}	
	}
}

function next(id,idl){
    var conheight = $('#'+id).height()-8;
    var lilen = $('#'+idl+' li').length;
    var len = Math.ceil(lilen/it);
	
	if( page == len ) {
		if(len == 1){  //只有一页不翻转
			 return;
		 }
		 $('#'+idl).animate({top:'+=' + conheight},'slow');
		 page--;
		 if(page >= 1){
			$("#prev img").attr("src","images/see_top.gif"); 
			$("#prev").css({"cursor":"pointer"});
		 }
		 if(page == 1){
			$("#next img").attr("src","images/see_foot01.gif");
			$("#next").css({"cursor":"default"});
		 }
	}else{
		 if(page == 1){
			  return;
		  }
		 $('#'+idl).animate({top:'+=' + conheight},'slow');
		 page--;
		 if(page == 1){
			$("#next img").attr("src","images/see_foot01.gif");
			$("#next").css({"cursor":"default"});
		 }
	}
}