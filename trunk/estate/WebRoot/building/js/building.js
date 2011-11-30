function attention(obj){
$("#attentioncount").html(obj);
    alert("您已关注成功!");
}

function notLogged(){
alert('您还没有登录，请您登录后再关注！');
}


function hasattention(){
alert('您已关注过该楼盘！');
}

function hasshowing(){
alert('您已参加过该楼盘的看房团，感谢您的参与！');
}




function check_validate1(value){        
    var reg = /^d+$/;    
    if( value.constructor === String ){    
        var re = value.match( reg );    
        return true;    
    }    
    return false;    
}

function checkMail(mail){
     var filter  = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
     if (filter.test(mail)){
        return true;
     }
     else {
        return false;
     }
}
function joinTuan(name,tel,email){
    if(name==""){
		$("#joinTuanTips_name").html('*姓名不能为空');
        return false;
    }
    if(tel==""){
		$("#joinTuanTips_tel").html('*手机号码不能为空');
        return false;
    }
	var reg = /^13[0-9]{1}[0-9]{8}$|15[0189]{1}[0-9]{8}$|18[0-9]{1}[0-9]{8}|152[0-9]{8}$/;
	if(!reg.test(tel)){
		$("#joinTuanTips_tel").html('*请输入正确的手机号');
		return false;
	}
	
    if(email != ""){
        if(!checkMail(email)){
			$("#joinTuanTips").html('请输入正确的邮箱');
           return false;
        }        
    }
    var type = 1;
    document.showingsForm.method="post";
	document.showingsForm.submit();
	$('#submitBt').html("<div style='margin:30px 0px 0px 110px;'>处理中，请稍后...</div>");
}


function chechShowings(obj){
            switch(obj){
                case 1:
					$("#joinTuanTips").html("您已报名参加了该楼盘的看房团，不能重复报名！");
                    break;
                case 9:
					$("#joinTuanTips").html("看房团参加失败,请与客服联系");
                    break;
                case 2:
				    $("#tuan2").show();
                    $("#tuan1").hide();
					$("#checkUserId").hide();
					var showingsnum = parseInt($("#newshowingsnum").val())+1;
					$("#newshowingsnum").val(showingsnum);
					$("#showingsnum2").html("<font class=\"C0 f30\">"+showingsnum+"</font>人 <a href=\"#tuan\"><img src=\"images/join_tuan.gif\" title=\"参加免费看房团\"/></a>");
					$("#showingsnum3").html(showingsnum);
					$("#showingsnum1").html(showingsnum);
                    break;
            }
			$('#submitBt').html("<input id=\"joinTuanBt\" type=\"button\" class=\"j_bu\" onclick=\"joinTuan($('#tname').val(),$('#ttel').val(),$('#temail').val(),'tsex')\" />");
}






function checkTuan(){
    $("#tuan1").show();
	$("#joinTuanTips").html("");
    $("#tuan2").hide();
}

$(function(){
	if("" != ""){
		$("#tname").val("");
		$("#ttel").val("");
		$("#temail").val("");
		
		$('[name="tsex"]:radio').each(function() {
			if (this.value == "")
			{
				this.checked = true;
			}
		}); 
	}
	
	$("#tname").focus(function(){
		$("#joinTuanTips_name").html("");
		$("#joinTuanTips").html("");
	});
	
	$("#ttel").focus(function(){
		$("#joinTuanTips_tel").html("(请填写真实手机，方便置业顾问联系您)");
		$("#joinTuanTips").html("");
	});
	
	$("#email").focus(function(){
		$("#joinTuanTips").html("");
	});
})


function changcss(obj){
   $("#li"+obj).addClass("kkOn");
}

