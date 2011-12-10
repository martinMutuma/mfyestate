jQuery.fn.tip=function tip(configuration,htmlStr,type){
	var _height = $(this).outerHeight(true);
	var position = $(this).position();
	var _left = position.left;
	var _top = position.top;
	var tipId = $(this).id+"_tipShow";
	$(this).focus(function(){
		if($("#"+tipId)){
			$("#"+tipId).remove();
		}
			$('<div style="border:1px solid #B3A065;position:absolute;background-color: #FCFFC9" id="'+tipId+'"></div>').appendTo("body");
			$("#"+tipId).css(configuration).html(htmlStr);
			if(type=="1")
				$("#"+tipId).css({left:_left+'px',top:(_top+_height)+'px'});
			else
				$("#"+tipId).css({left:_left+'px',top:(_top-$("#"+tipId).outerHeight(true))+'px'});
	})
	
	$(this).blur(function(){
		if($("#"+tipId)){
			$("#"+tipId).remove();
		}
	})
}