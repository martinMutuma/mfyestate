$(function(){
	var sc = $(".search_column");
	for(var i = 0; i < sc.length; i++){
		$(sc[i]).html("<label><input type='checkbox'>"+sc[i].innerHTML+"</label>")
	}
	$(".search_column").hover(function(){
			$(this).css({border:'1px solid #ECECEC'})
	},function(){
		$(this).css({border:'1px solid #FFFFFF'})
	})
	
})