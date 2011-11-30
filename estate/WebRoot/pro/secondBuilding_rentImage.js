$(function () {

//init button
$("#addImg").linkbutton({
	disabled:false,
	plain:true,
	text:'添加图片',
	iconCls:'icon-add'
})
$("#saveBtn").linkbutton({
	disabled:false,
	plain:false,
	text:'保存上传图片',
	iconCls:'icon-save'
})

$("#uploadFilePanel").dialog({
		title:'上传文件',
		closed:true,
		buttons:[{
			text:'上传',
			iconCls:'icon-ok',
			handler:function(){
				var value = $("#attrchFile"+fileCount).val();
				if(value == ""){
					$.messager.alert("上传提示","请上传附件",'warning');
					return;
				}
				else if(!/(.jpg)|(.jpeg)|(.png)|(.gif)$/.exec(value)){
					$.messager.alert("上传提示","只能上传图片",'error');
					return;
				}
				$("#fileArea").append($("#attrchFile"+fileCount));
				var valueAry = value.split("\\");
				var fileName = valueAry[valueAry.length-1];
				if(fileCount == 0){
					$("#uploadFileReview").html("");
					$("#saveBtnSpan").show();
				}
				$("#uploadFileReview").append("<span id='fileShow_"+fileCount+"' style='margin-left:10px;'>"+fileName+"<span class='icon-cancel' title='删除' style='width:16px;cursor:pointer;height:16px;margin-left:10px;' onclick='del("+fileCount+")'>&nbsp;</span></span>");
				fileCount++;
				$('#uploadFilePanel').dialog('close');
			}
		},{
			text:'取消',
			handler:function(){
				$('#uploadFilePanel').dialog('close');
			}
		}]
	})
})
//上传图片数
var fileCount = 0;
function addImg(){
	var id = "attrchFile"+fileCount;
	var str = '<input id="'+id+'" name="imageFile" type="file" style="height: 20px;margin-top: 10px;"/><br/><br/>';
	$("#filecontainer").html("");
	$("#filecontainer").html(str);
	$('#uploadFilePanel').dialog('refresh');
	$('#uploadFilePanel').dialog('open');
}

//删除文件
function del(id){
	$("#fileShow_"+id).remove();
	$("#attrchFile"+id).remove();
	fileCount--;
	if(fileCount == 0){
		$("#uploadFileReview").html("<font color='red'>您还没有上传图片,请点击添加图片进行添加!</font>");
		$("#saveBtnSpan").hide();
	}
}
function saveImg(){
	$.messager.confirm('图片保存提示','保存完成后，是否返回当前页?',function(b){
		if(true)
			document.imgForm.action=document.imgForm.action+"?submitFlag=2";
		document.imgForm.submit();
	})
	
}
function deleteImg(pid,imgId){
	window.location.href = '../secondBd/delImg.shtml?tpsId='+pid+'&imgId='+imgId;
}