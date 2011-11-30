/**
 * 动态给span加载元素
 * @param {} el 目标id
 * @param {} data	  json数据格式数据 string
 * @param {} colNum	  每行显示数 int
 * @param {} type 1:checkbox 2:radio 
 * @param {} name 元素名
 * @param {} cellAlign 显示位置
 * @param {} initValue 初始值
 * @param {} width 宽度
 * @param {} initValue 宽度

 panelId,jsondata,count,type,elementName,defaultValue,align */
function fillPanel(settings){
	var panelId = settings.el;
	var jsondata = settings.data;
	var elementName = settings.name;
	var colNum = settings.colNum;
	var width = settings.width;
	if(undefined == width)
		width = '100%';
	if(undefined==colNum)
		colNum = 3;
	var type = settings.type;
	if(undefined==type)
		type = '1';
	var defaultValue = settings.defaultValue;
	if(undefined==defaultValue)
		defaultValue = '';
	var cellAlign = settings.cellAlign;
	if(undefined==cellAlign)
		cellAlign = 'left';
	var initValue = settings.initValue;
	if(undefined==initValue)
		initValue = '';
	if(defaultValue == '')
		defaultValue= initValue;
	var json;
   	try{
		json = eval('('+jsondata+')');
	}catch(e){
		json = jsondata;
	}
	var index=1;
	var str = "<table width='"+width+"' ><tr>";
	$("#"+panelId).empty();
	for(key in json){
		var code = key;
		var name = json[key];
		if(type == "1"){
			str += "<td style='text-align:"+cellAlign+"'><label><input type='checkbox' name='"+elementName+"' value='"+code+"'";
			if((","+defaultValue.replace(/(\s*)/g, "")+",").indexOf(","+code.replace(/(\s*)/g, "")+",")!=-1)
				str += "checked='checked'";
			str += "/> "+name+"</label></td>";
		}else {
			str += "<td style='text-align:"+cellAlign+"'><label><input type='radio' name='"+elementName+"' value='"+code+"'";
			if(defaultValue==code)
				str += "checked='checked'";
			str += "/> "+name+"</label></td>";
		}
		if(index == colNum){
			str += "</tr><tr>";
			index = 0;
		}
		index++;
	}
	str +="</table>";
	$("#"+panelId).html(str);
}

