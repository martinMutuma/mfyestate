/*******************************************************************************
 * auto_roll Copyright (C) 2006-2011 chao Fu.
 * 
 * @author Roddy <fc19861011@gmail.com>
 * @site http://www.mymfy.com/
 * @licence
 * @version 1.0 (2011-11-28)
 ******************************************************************************/

(function(undefined) {
	if (window.AutoRoll != undefined)
		return;
	var AR = {};
	AR.stack = {};
	AR.scriptPath = (function() {
		var elements = document.getElementsByTagName('script');
		for (var i = 0, len = elements.length; i < len; i++) {
			var src = elements[i].src;
			if (src && src.match(/mfy_auto_roll[\w\-\.]*\.js/)) {
				return src.substring(0, src.lastIndexOf('/') + 1);
			}
		}
		return '';
	})();
	AR.browser = (function() {
		var ua = navigator.userAgent.toLowerCase();
		return {
			VERSION : ua.match(/(msie|firefox|webkit|opera)[\/:\s](\d+)/)
					? RegExp.$2
					: '0',
			IE : (ua.indexOf('msie') > -1 && ua.indexOf('opera') == -1),
			GECKO : (ua.indexOf('gecko') > -1 && ua.indexOf('khtml') == -1),
			WEBKIT : (ua.indexOf('applewebkit') > -1),
			OPERA : (ua.indexOf('opera') > -1)
		};
	})();
	AR.CONSTANT = {
		SLOW_SPEED : 200,
		NORMAL_SPEED : 100,
		FAST_SPEED : 5,
		UP : 'up',
		DOWN : 'down',
		LEFT : 'left',
		RIGHT : 'right'
	}
	AR.setting = {
		id : '',
		topModel : false,// 置顶模式是否开启
		topStore : null,// 置顶数据源
		topCount : 1,// 置顶数
		container : '',// 容器
		rowCount : 1,// 滚动区行数
		colCount : 1,// 滚动区列数
		stagnation : 2000,// 停滞时间
		speed : AR.CONSTANT.NORMAL_SPEED,
		roll_type : AR.CONSTANT.UP,
		roll_mode : true
	}

	AR.event = {
		add : function(el, type, fn, id) {
			if (el.addEventListener) {
				el.addEventListener(type, fn, false);
			} else if (el.attachEvent) {
				el.attachEvent('on' + type, fn);
			}
		},
		ready : function(func, win, doc, id) {
			var win = win || window;
			var doc = doc || document;
			var loaded = false;
			var readyFunc = function() {
				if (loaded)
					return;
				loaded = true;
				func();
			};
			if (doc.addEventListener) {
				this.add(doc, "DOMContentLoaded", readyFunc, id);
			} else if (doc.attachEvent) {
				this.add(doc, "readystatechange", function() {
					if (doc.readyState == "complete")
						readyFunc();
				}, id);
				if (doc.documentElement.doScroll
						&& typeof win.frameElement == "undefined") {
					var ieReadyFunc = function() {
						if (loaded)
							return;
						try {
							doc.documentElement.doScroll("left");
						} catch (e) {
							window.setTimeout(ieReadyFunc, 0);
							return;
						}
						readyFunc();
					};
					ieReadyFunc();
				}
			}
			this.add(win, 'load', readyFunc, id);
		}

	};

	AR.each = function(obj, func) {
		for (var key in obj) {
			if (obj.hasOwnProperty(key))
				func(key, obj[key]);
		}
	};

	AR.init = function(args) {
		var stack = AR.stack[args.container] = args;
		AR.each(AR.setting, function(key, val) {
			stack[key] = (typeof args[key] == 'undefined') ? val : args[key];
		});
	}

	AR.roll = {
		up : function(id) {
			var stack = AR.stack[id];
			var roll_mode = stack.roll_mode;
			if (roll_mode) {
				var elementAry = stack.elementArray;
				var showStart = stack.showStart;
				var rowCount = stack.rowCount;
				var obj = stack.containerObject;
				var obj_start = elementAry[showStart];
				var endIndex = (showStart+rowCount)>(elementAry.length-1)?(showStart+rowCount-elementAry.length):(showStart+rowCount);
				var obj_end = elementAry[endIndex];
				var height = obj_start.style.height + "";
				height = parseInt(height.substring(0, height.length - 2))
				height = height - 1;
				var height1 = obj_end.style.height + "";
				height1 = parseInt(height1.substring(0, height1.length - 2))
				height1 = height1 + 1;
				if (height >= 0) {
					obj_start.style.height = (height) + "px";
					obj_end.style.height = (height1) + "px";
					setTimeout("AR.roll.up('" + id + "')", stack.speed)
				} else {
					if (stack.showId == elementAry.length) {
						var firstElement = document
								.getElementById(elementAry[0]);
						var feHeight = 0;
						// while(stack.cheight > feHeight){
						// firstElement.style.height = (feHeight+5) + "px";
						// }
						firstElement.style.height = stack.cheight + "px";
						for (var i = 1; i < elementAry.length; i++) {
							document.getElementById(elementAry[i]).style.height = stack.cheight
									+ "px";
						}
						stack.showId = 1;
					} else {
						stack.showId += 1;
					}
					setTimeout("AR.roll.up('" + id + "')", stack.stagnation);
				}
			}
		}

	}

	AR.create = function(id) {
		var stack = AR.stack[id];
		var container = id;
		var containerObject = document.getElementById(container);
		if (stack.topModel) {
		} else {
			var containerOuterHeight = containerObject.offsetHeight;
			var containerOuterWidth = containerObject.offsetWidth;
			var containerInnerHeight = containerObject.clientHeight;
			var containerInnerWidth = containerObject.clientWidth;
			var containerScrollHeight = containerObject.scrollHeight;
			var containerScrollWidth = containerObject.scrollWidth;
			stack.cwidth = containerInnerWidth;
			stack.cheight = containerInnerHeight;
			var elementObjs = containerObject.getElementsByTagName("li");
			var elementArray = new Array();
			for (var i = 0, length = elementObjs.length; i < length; i++) {
				elementArray[i] = elementObjs[i].innerHTML.toDom()[0];
				alert(elementArray[i].innerHTML)
			}
			stack.elementArray = elementArray;
			var container_0 = "<div style='width:" + containerInnerWidth
					+ ";height:" + containerInnerHeight
					+ ";overflow:hidden;border:1px solid red;' id='"
					+ container + "_0' align='center'></div>";
			containerObject.innerHTML = container_0;
			stack.containerObject = document.getElementById(container + "_0");
			stack.showStart = 0;
			var rowCount = stack.rowCount;
			var elementCount = elementArray.length;
			var elementObjArray = new Array();
			if (rowCount >= elementCount) {
				stack.roll_mode = false;
				for (var i = 0; i < elementArray.length; i++) {
					stack.containerObject.appendChild(elementArray[i]);
				}
			} else {
				try{
				for (var i = 0; i < rowCount; i++) {
					stack.containerObject.appendChild(elementArray[i]);
				}
				elementArray[rowCount].style.height = '0px';
				stack.containerObject.appendChild(elementArray[rowCount]);
				}catch(e){alert(e)}
			}
			alert(stack.containerObject.innerHTML)
			// for (var i = 0; i < elementAry.length; i++) {
			// if (stack.showId != (i + 1))
			// document.getElementById(elementAry[i]).style.display = "none";
			// }
			// if (stack.roll_type == AR.CONSTANT.LEFT
			// || stack.roll_type == AR.CONSTANT.RIGHT) {
			// for (var i = 0; i < elementAry.length; i++) {
			// var objtemp = document.getElementById(elementAry[i]);
			// objtemp.style.float = "left";
			// }
			// }
			setTimeout("AR.roll.up('" + id + "')", stack.stagnation);
		}
	}

	AR.start = function(args) {
		AR.init(args);
		AR.event.ready(function() {
			AR.create(args.container);
		});
	};

	if (window.AR == undefined)
		window.AR = AR;
	window.AutoRoll = AR;
})();

function roll_up(objId, speed) {

}

function roll_init_panel(elementDiv, containerId, stack) {
	elementDiv.innerHTML += "<div style='width:" + stack.cwidth + ";height:"
			+ stack.cheight + ";overflow:hidden' align='center' id='"
			+ containerId + "'></div>";
}
// (function(AR, undefined) {
// alert(AR)
// })(AutoRoll);

function stack() {
	if (this.top == undefined) { // 初始化堆栈的顶部指针和数据存放域
		this.top = 0;
		this.unit = new Array();
	}
	this.push = function(pushvalue) { // 定义压入堆栈的方法
		this.unit[this.top] = pushvalue;
		this.top += 1;
	}
	this.readAllElements = function() { // 定义读取所有数据的方法
		if (this.top == 0) {
			alert("当前栈空，无法读取数据");
			return ("");
		}
		var count = 0;
		var outStr = "";
		for (count = 0; count < this.top; count++) {
			outStr += this.unit[count] + ",";
		}
		return (outStr);
	}
	this.pop = function() { // 定义弹出堆栈的法子
		if (this.top == 0) {
			alert("当前栈空，无法弹出数据");
			return ("");
		}
		var popTo = this.unit[this.top - 1];
		this.top--;
		return (popTo); /*
						 * 从堆栈弹出数据，顶部指针减一，不过这里没有做到资源的开释，也
						 * 即是说数据仍旧保存于this.unit的数组中，只不过无法访候罢了。目下当今 我也没料到好的办法办理。
						 */
	}
}
//TODO: childNodes浏览器兼容   
String.prototype.toDom = function(){
	 var objE = document.createElement("div"); 
　　 objE.innerHTML = this; 
	   var childAry = objE.childNodes;
	   for(var i = 0; i < childAry.length; i++){
	   		if(childAry[i].)
	   }
　　 return objE.childNodes; 
}
