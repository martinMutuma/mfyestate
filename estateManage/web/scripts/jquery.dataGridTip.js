/**
*简单搜索提示框
*以grid形式展示
*configuration:json格式的css配置
*url:数据地址(json数据格式)
*showType:1：以树型展示 2：普通Grid展示
*mappingConfig json数据格式，定义数据列
*    cm:
*	{ id:'code', -- cell  id
*     width:'100px', --cell 宽度
*     height:'40px', --cell 高度(高度以同一行中cell高度最高为准)
*     align:'center',--cell 内容对齐方式
*     header:'编码',  --列名称
*     dataIndex:'code',--cell 对应json数据中的key
*     css:'',         --自定义cell css样式
*     renderer:format -- 对cell的值进行格式化，参数(cell中的值，该行的json对象)
*	},
*	tipName:弹出层名称,
*   keyNmae:接收父元素值默认ws
*	extraColumn:额外扩展列的html文本
*clickFun 行单击函数
*/
jQuery.fn.dataGridTip=function dataGridTip(url,showType,configuration,mappingConfig,clickFun){
	var id = $(this).attr("id");
	var conventerId = id+'_tip';
	var contentId = id+'_content';
	var tabId = id+'_tab';
	var _height = $(this).outerHeight(true);
	var urlTemp = url;
	var timeoutId;
	var columns = mappingConfig.cm.length;
	var position = $(this).position();
	var tipName = mappingConfig.tipName;
	var extraColumn = "";
	if(undefined!=mappingConfig.extraColumn && null != mappingConfig.extraColumn)
		extraColumn = mappingConfig.extraColumn;
	var keyName = "ws";
	if(undefined!=mappingConfig.keyNmae && null != mappingConfig.keyNmae)
		keyName = mappingConfig.keyNmae;
	var this_focus = false;
	var conventer_focus = false;
	
	/**
	*init cell config
	*/
	var cellWidth,cellHeight,cellAlign,cellId,cellCss,cellFun,cellValue
	for(var i = 0; i < columns; i++){
		cellWidth = mappingConfig.cm[i].width;
		if(undefined==cellWidth||null == cellWidth)
			cellWidth = "";
		cellHeight = mappingConfig.cm[i].height;
		if(undefined==cellHeight || null == cellHeight)
			cellHeight = "";
		cellAlign = mappingConfig.cm[i].align;
		if(undefined==cellAlign || null == cellAlign)
			cellAlign = "left";
		cellId = mappingConfig.cm[i].id;
		if(undefined==cellId || null == cellId)
			cellId = mappingConfig.cm[i].dataIndex;
		cellCss = mappingConfig.cm[i].css;
		if(undefined==cellCss || null == cellCss)
			cellCss = "";
		cellFun = mappingConfig.cm[i].renderer;
	}
	
/*	document.onmousemove=function(e){
		var event = $.event.fix(e);
		var x = event.pageX-$(this).offset().left;
		var y = event.pageY-$(this).offset().top-_height;
		if(x>configuration.width||x<0||y<0||y>configuration.height)
			this_focus = false;
	}*/
	$(this).blur(function(e){
		
	})
	$(this).focus(function(){
		this_focus = true;
	})
	$(this).keyup(function(event){
		/* 处理文本框中的键盘事件 */
		var myEvent = event || window.event;
		var keyCode = myEvent.keyCode;
		/* 如果输入的是字母，退格，delete，空格或者数字键，应该将文本框中的最新信息发送给服务器,其中，空格键和数字键的加入使得输入中文也能支持~~*/
		if ((keyCode >= 65 && keyCode <= 90)
				|| (keyCode >= 48 && keyCode <= 57)
				|| (keyCode >= 96 && keyCode <= 105) || keyCode == 46
				|| keyCode == 8 || keyCode == 32) {
				/* 获取文本框的内容 */
			var wordText = $(this).val();
			if (wordText != "" && wordText.length >= 2) {
				closeGridTip(conventerId,contentId);
				/* 将文本框中的内容发送到服务器端 */
				/* 对上次未完成的延时操作进行取消 */
				clearTimeout(timeoutId);
				timeoutId = setTimeout(function() {
					url = urlTemp;
					if(url.indexOf('?')!=-1)
						url += '&'+keyName+'='+encodeURIComponent(wordText)+'&t='+(new Date().getTime().toString(36));
					else
						url += '?'+keyName+'='+encodeURIComponent(wordText)+'&t='+(new Date().getTime().toString(36));
					$.getJSON(url,function(data){
						$('<div  id="'+conventerId+'" style="position:absolute;left:'+position.left+'px;top:'+(position.top+_height)+'px;"><table id='+tabId+' border="0" width="100%" height="30" cellpadding="0" cellspacing="0" style="background-color:#CAD9EA;font-size:15px;"><tr><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;'+tipName+'</td><td align="right"><span style="cursor:pointer;" title="关闭" onclick="closeGridTip(\''+conventerId+'\',\''+contentId+'\')">【关闭】</span></td></tr></table><div style="background:white;border-color:white #CAD9EA #CAD9EA #CAD9EA;border-style:solid;border-width:2px;overflow:auto" id="'+contentId+'">正在加载... ...</div></div>').appendTo("body");
						$("#"+conventerId).css(configuration);
						$("#"+contentId).css("height",($("#"+conventerId).height()-34)+"px");
						if(!document.all){
							$("#"+contentId).css("width",($("#"+conventerId).width()-4)+"px");
						}
						var str = "";
						str += "<table cellpadding='0' cellspacing='0'>";
						str += "<tr style='background-color:#CAEDFD'>"
						for(var i = 0; i < columns; i++){
							var columName = mappingConfig.cm[i].header;
							if(undefined==columName || null == columName)
								columName = "";
							var cellAlign = mappingConfig.cm[i].align;
							if(undefined==cellAlign || null == cellAlign)
								cellAlign = "left";
							str += "<th align='"+cellAlign+"' style='border-bottom:1px solid #CAD9EA;border-right:1px solid #CAD9EA;height:28px;'>"+columName+"</th>";
						}
						str += "</tr>";
						$.each(eval(data.jsonString),function(idx,item){
							var jsonString = '{';
							var numTemp = 0;
							for(var key in item){
								if(numTemp > 0)
									jsonString += ',';
								jsonString += key+':\"'+item[key]+'\"';
								numTemp ++;
							}
							jsonString += '}';
							
							str += "<tr onmouseover='mouseOver(this)' onmouseout='mouseOut(this)' ";
							if(undefined!=clickFun && null != clickFun)
								str += "onclick=_globalClick("+clickFun+",'"+jsonString+"','"+conventerId+"','"+contentId+"')";
							str += ">";
							for(var i = 0; i < columns; i++){
								cellValue = item[mappingConfig.cm[i].dataIndex]
								if(undefined!=cellFun && null != cellFun)
									cellValue = cellFun(cellValue,item)
								str += "<td id='"+cellId+"' align='"+cellAlign+"' style='border-bottom:1px solid #CAD9EA;border-right:1px solid #CAD9EA;"+cellCss+"' width='"+cellWidth+"' height='"+cellHeight+"'>"+cellValue+"</td>";
							}
							str += "</tr>";
						})
						if(extraColumn!="")
							str += '<tr><td colspan="'+columns+'">'+extraColumn+'</td></tr>';
						str += "</table>";
						
						$("#"+contentId).html(str);
						$("select").hide();
					})
				}, 500)
			}
			else {
				$("#"+conventerId).remove();
				$("#"+contentId).remove();
				$("select").show();
			}
		}
	})
	return $(this);
}

function mouseOver(obj){
	$(obj).css("background-color","#4DB5E4")
}

function mouseOut(obj){
	$(obj).css("background-color","white")
}

function gridTiproperty(){
	this.clickFunction;
	this.timeOutFlag;
}

function setClickFunction(fun){
	this.clickFunction = fun;
}

function getClickFunction(obj,conventerId,contentId){
	$("#"+conventerId).remove();
	$("#"+contentId).remove();
	$("select").show();
	var json = (new Function("return " + obj))();
	return this.clickFunction(json);
}

function setTimeOutFlag(timeOutFlag){
	this.timeOutFlag = timeOutFlag;
}

function getTimeOutFlag(){
	return this.timeOutFlag;
}

gridTiproperty.prototype.setClickFunction=setClickFunction;
gridTiproperty.prototype.getClickFunction=getClickFunction;
gridTiproperty.prototype.setTimeOutFlag=setTimeOutFlag;
gridTiproperty.prototype.getTimeOutFlag=getTimeOutFlag;


function closeGridTip(conventerId,contentId){
	$("select").show();
	var conventerObj = $("#"+conventerId);
	if(null != conventerObj && undefined != conventerObj)
		conventerObj.remove();
	var contentObj = $("#"+contentId);
	if(null != contentObj && undefined != contentObj)
		contentObj.remove();
}

function _globalClick(func,data,conventerId,contentId){
	closeGridTip(conventerId,contentId);
	if(null!=func&&undefined!=func){
		var json = (new Function("return " + data))();
		func(json);
	}
}

/*firefox
function __firefox(){
    HTMLElement.prototype.__defineGetter__("runtimeStyle", __element_style);
    window.constructor.prototype.__defineGetter__("event", __window_event);
    Event.prototype.__defineGetter__("srcElement", __event_srcElement);
}
function __element_style(){
    return this.style;
}
function __window_event(){
    return __window_event_constructor();
}
function __event_srcElement(){
    return this.target;
}
function __window_event_constructor(){
    if(document.all){
        return window.event;
    }
    var _caller = __window_event_constructor.caller;
    while(_caller!=null){
        var _argument = _caller.arguments[0];
        if(_argument){
            var _temp = _argument.constructor;
            if(_temp.toString().indexOf("Event")!=-1){
                return _argument;
            }
        }
        _caller = _caller.caller;
    }
    return null;
}
if(window.addEventListener){
    __firefox();
}
end firefox*/
