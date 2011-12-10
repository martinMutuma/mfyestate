  var endTimes =  $("#tuanEndTime").val();
  if(endTimes.length>0){
  	endTimes = replaceAll(endTimes,'-','/');
  	endTimes = replaceAll(endTimes,' ',',');
  }
  
  var teEndTimes = $("#OneEndTime").val();
  if(teEndTimes.length>0){
  	teEndTimes = replaceAll(teEndTimes,'-','/');
  	teEndTimes = replaceAll(teEndTimes,' ',',');
  }
  
  function show_time(){
	 var endtime=new Date(endTimes.substring(0,19));
	 var nowtime = new Date();
	 var leftsecond=parseInt((endtime.getTime()-nowtime.getTime())/1000);
	 d=parseInt(leftsecond/3600/24);
	 h=parseInt((leftsecond/3600)%24);
	 m=parseInt((leftsecond/60)%60);
	 s=parseInt(leftsecond%60);
	 var c=new Date();
	// var q=((c.getMilliseconds())%10);
	 document.getElementById("tuan_str_time").innerHTML="<font class='fontcolor4'>"+d+"</font><font class='fontcolor3'>天 </font><font class='fontcolor4'>"+h+"</font><font class='fontcolor3'>小时 </font><font class='fontcolor4'>"+m+"</font><font class='fontcolor3'>分 </font><font class='fontcolor4'>"+s+"</font><font class='fontcolor3'>秒</font><font class='fontcolor4'>";
	 if(leftsecond<=0){
	 	 document.getElementById("tuan_end_Time").style.display='none';
		 document.getElementById("tuan_str_time").innerHTML="很遗憾，活动已经结束啦！";
		 clearInterval(vod_show);
	 }  
 } 
	show_time();
	var vod_show;
	vod_show=setInterval(show_time,1000);
	

  function te_show_time(){
	 var teEndTime=new Date(teEndTimes.substring(0,19));
	 var nowtime = new Date();
	 var leftsecond=parseInt((teEndTime.getTime()-nowtime.getTime())/1000);
	 d=parseInt(leftsecond/3600/24);
	 h=parseInt((leftsecond/3600)%24);
	 m=parseInt((leftsecond/60)%60);
	 s=parseInt(leftsecond%60);
	 var c=new Date();
	// var q=((c.getMilliseconds())%10);
	 document.getElementById("te_str_time").innerHTML="<font class='fontcolor4'>"+d+"</font><font class='fontcolor3'>天 </font><font class='fontcolor4'>"+h+"</font><font class='fontcolor3'>小时 </font><font class='fontcolor4'>"+m+"</font><font class='fontcolor3'>分 </font><font class='fontcolor4'>"+s+"</font><font class='fontcolor3'>秒</font><font class='fontcolor4'>";
	 if(leftsecond<=0){
	 	 document.getElementById("te_end_Time").style.display='none';
		 document.getElementById("te_str_time").innerHTML="<font class='fontcolor4'>很遗憾，活动已经结束啦！<font>";
		 clearInterval(te_vod_show);
	 }
 }
	te_show_time();
	var te_vod_show;
	te_vod_show=setInterval(te_show_time,1000);	
	function toMyStore(id){
		window.location.href='mem/baseinfo_toMyStore.shtml?authorId='+id+'&type=office'
	}