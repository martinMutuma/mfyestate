$(function(){
	KE.show({
		id : 'introduction',
		loadStyleMode : false,
		resizeMode : 0,
		allowUpload:true, //允许上传图片 
		imageUploadJson:'../comutil/upload.shtml',
		shadowMode: true,autoSetDataMode: true,allowPreviewEmoticons: true, 
		items : [
		'fontname', 'fontsize', '|', 'fullscreen','|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
		'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
		'insertunorderedlist', '|','image']
	});
})
function setHeight(height){
	$("#infoFrame").css({height:height+'px'});
}
function closeTab(cls){
	parent.closeTab(cls);
}
function onlyNum()
{
    if (!((event.keyCode >= 48 && event.keyCode <= 57 )
		|| (event.keyCode >= 96 && event.keyCode <= 105)
		|| (event.keyCode >= 37 && event.keyCode <= 40)))
    //考虑小键盘上的数字键
        if (event.keyCode != 8&&event.keyCode != 13)event.returnValue = false;
    //  return false;
}
function openUrl(title,url,cls){
	parent.addTab(title,url,cls);
}