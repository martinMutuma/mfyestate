$(function(){
	var sc = $(".search_column");
	for(var i = 0; i < sc.length; i++){
		$(sc[i]).html("<label><input type='checkbox' onclick='srClick(this)'>"+sc[i].innerHTML+"</label>")
	}
	$(".search_column").hover(function(){
			$(this).css({border:'1px solid #ECECEC'})
	},function(){
		$(this).css({border:'1px solid #FFFFFF'})
	})
	$(".search_column_selected").find("input").attr("checked",true);
	$("#bulidSearch").click(function(){
			
	})
})
function srClick(obj){
	var sc = $(obj).parent().parent();
	var scsArea = sc.parent();
	var firstSc = scsArea.children();
	if(firstSc[0].id == sc.attr("id")){
		$(firstSc[0]).addClass("search_column_selected");
		for(var i = 1; i < firstSc.length; i++){
				$(firstSc[i]).removeClass("search_column_selected").find("input").attr("checked",false);
		}
	}else{
		$(firstSc[0]).removeClass("search_column_selected").find("input").attr("checked",false);
		if(obj.checked)
			sc.addClass("search_column_selected");
		else
			sc.removeClass("search_column_selected");
	}
	
}