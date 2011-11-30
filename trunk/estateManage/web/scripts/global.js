$(function(){
	$("#contentList tr").hover(function(){
		$(this).css("background-color","#4DB5E4")
	},
	function(){
		$(this).css("background-color","#eafefe")
	})
	try{
	$("#checkAll").click(function(){
		$("input[name='checkbox']").attr("checked",$(this).attr("checked"));
		if($(this).attr("checked")==true){
		  $("input[name='orderNum']").css("display","block");
		}else{
		  $("input[name='orderNum']").css("display","none");
		}
	})}catch(e){}
})