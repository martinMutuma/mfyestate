
function showfilediv() {
	if (document.getElementById("imgFlag0").checked == true) {
		document.getElementById("filediv").style.display = "block";
		if(document.getElementById("imgurl").value !="" ){
		  document.getElementById("imgdiv").style.display = "block";
		}
	} else {
		document.getElementById("filediv").style.display = "none";
	}
}


function showimg(url){
  			document.getElementById("imgdiv").style.display = "block";
			document.getElementById("img").src = url;
			document.getElementById("imgurl").value = url;
}



 $(function() {
           $("#imgBtn").click(function() {
					var txt = '<form  action="news_preview.shtml"'
							+ 'method="post" enctype="multipart/form-data" target="tempF">'
							+ '<input name="imageFile" id="imageFile" type="file" /><input id="sub" type="submit" style="display: none" /></form>';
					function mysubmitfunc(v, m, f) {
						if(!/(.gif)|(.png)|(.jpg)|(.jpeg)|(.ico)$/.exec($("#imageFile").val())){
							 $.prompt('请上传图片格式文件',{show:'slideDown',buttons:{OK:true}})
							 return false;
						}
						$("#sub").click();
						return true;
					}
					$.prompt(txt, {
								submit : mysubmitfunc,
								buttons : {
									Ok : true
								}
							});
				})
				
        });