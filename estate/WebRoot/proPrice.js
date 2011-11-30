$(function(){
	if(document.getElementById("pagenation")){
		pagination({
			totalRecords: $("#totalRecords").val(),
			pageNo: $("#pageNo").val(),
			limit: $("#limit").val(),
			showPages: 8,
			id:'pagenation',
			uri:function(pageno,limit){
				searchByPrice($("#minValue").val(),$("#maxValue").val(),$("#searchType").val(),$("#proType").val(),pageno);
			}
		})
	}
})