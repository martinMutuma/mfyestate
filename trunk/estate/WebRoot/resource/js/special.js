String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
}
function checkNull(obj) {
	if (obj.value.trim().length == 0)
		return true;
	else
		return false;
}

function checkLength(obj, len) {
	if (obj.value.length > len)
		return true;
	else
		return false;
}
$(function(){var imgAry;
var imgAll = $("#imgOne").val()+","+$("#imgTwo").val()+","+$("#imgThree").val()+","+$("#imgFour").val();
imgAry = imgAll.split(",");
var imgCount = imgAry.length;
for (var i = 0; i < imgCount; i++) {
	if(""==imgAry[i])
		continue;
	$("#IMG_UL_LIST_1").append("<li><img src='../../estate/" + imgAry[i] + "'/></li>");
	if (i == 0) {
		$("#IMG_INDEX_UL_LIST_1").append("<li id=\"li_index_default\" style=\"background-color: #aaa;\">01</li>");
	} else {
		$("#IMG_INDEX_UL_LIST_1").append("<li>0" + (i + 1) + "</li>");
	}
}
if(",,,"!=imgAll)
InitSwitchObj();
})


function InitSwitchObj() {
	IMGLIST = $("#IMG_UL_LIST_1");
	IMGINDEX = $("#IMG_INDEX_UL_LIST_1");
	MAXINDEX = IMGLIST.find("li").length;
	currIndex = 0;
	currImgIndex = IMGINDEX.find("li:eq(" + currIndex + ")");
	currImgLi = IMGLIST.find("li:eq(" + currIndex + ")");
	currImgLi.show();
	interValTime = 3000;
	fadeInTime = 800;
	fadeOutTime = 1000;
	ImageAutoSwitch();
	ImageManualSwitch();
	ImageStopSwitch();
}
        //執行時間
var interValTime = 0;
        //下一張圖片顯示時間
var fadeInTime = 0;
        //上一張圖片的消失時間
var fadeOutTime = 0;
        //保存當前圖片定時的對象
var imageTimer = null;
        //當前的索引
var currIndex = null;
        //當前圖片的所以
var currImgIndex = null;
        //當前圖片
var currImgLi = null;
        //記錄需要切換的圖片集合
var IMGLIST = null;
        //記錄需要切換的圖片集合的索引。
var IMGINDEX = null;
        //最大圖片個數
var MAXINDEX = null;
        //自動定時切換。
function ImageAutoSwitch() {
	if (imageTimer != null) {
		clearInterval(imageTimer);
	}
	imageTimer = setInterval("IntervalImage()", interValTime);
}
        //手動切換圖片
function ImageManualSwitch() {
	IMGINDEX.find("li").each(function (i) {
		$(this).hover(function () {
			if (imageTimer != null) {
				clearInterval(imageTimer);
			}
			currIndex = i;
			ImageSwitchChange();
		}, function () {
			ImageAutoSwitch();
		});
	});
}
        //鼠標放到圖片上的換，停止切換
function ImageStopSwitch() {
	IMGLIST.find("li").each(function () {
		$(this).hover(function () {
			if (imageTimer != null) {
				clearInterval(imageTimer);
			}
		}, function () {
			ImageAutoSwitch();
		});
	});
}
        //自动切换图片
function IntervalImage() {
	currIndex = parseFloat(currIndex);
	currIndex = currIndex + 1;
            //如果切換到最大數量的時候則從頭開始
	if (currIndex >= MAXINDEX) {
		currIndex = 0;
	}
            //將原來的現實圖片索引的背景透明
	ImageSwitchChange();
}
        //切換圖片的時候，響應的圖片要實現漸變效果
function ImageSwitchChange() {
	if (currImgIndex != null) {
		currImgIndex.css({"background-color":"transparent"});
	}
	currImgIndex = IMGINDEX.find("li:eq(" + currIndex + ")");
	imgLi = IMGLIST.find("li:eq(" + currIndex + ")");
	currImgIndex.css({"background-color":"#999999"});
	if (currImgLi != null) {
		currImgLi.fadeOut(fadeOutTime, function () {
			imgLi.fadeIn(fadeInTime);
		});
	}
	currImgLi = imgLi;
}
//验证保存
function  checform(){
    var name =document.getElementById("name");
	if (checkNull(name)) {
		alert("请填写姓名");
		name.focus();
		return false;
	}
	if (checkLength(name, 15)) {
		alert("名字长度应小于15个字");
		name.focus();
		return false;
	}
    	var mobile = document.getElementById("mobile");
	  if(checkNull(mobile)){
                alert('请填写手机号码');
                mobile.focus();
                return false;
           }
           if( !(validatemobile(mobile.value)) ){
                 alert('请填写正确手机号码格式');
                mobile.focus();
                return false;
           }
    var  cboxArry=document.getElementsByName("ckbox");
    if(!cboxArry[0].checked){
         alert('请阅读服务团款并同意');
         return false;
    }
    return  true;
}
  function validatemobile(mobile)　　//验证手机号码 
       { 
        if(mobile.length==0) 
        { 
           return false; 
        }    
        if(mobile.length!=11) 
        { 
            return false; 
        } 
        
        var myreg = /^(((1[3-5]{1}[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
        if(!myreg.test(mobile)) 
        { 
            return false; 
        } 
          
         return true; 
       } 
       function  changePicture(){
     document.getElementById("pic").src="member/yanzhengma.jsp?date="+new Date();
}