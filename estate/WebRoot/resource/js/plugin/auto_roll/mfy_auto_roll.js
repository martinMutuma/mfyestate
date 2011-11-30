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
		SLOW_SPEED : 5,
		NORMAL_SPEED : 10,
		FAST_SPEED : 20,
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
		speed : AR.CONSTANT.NORMAL_SPEED,
		roll_type : AR.CONSTANT.UP
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
		AR.each(AR.setting, function(key, val) {
			AR.setting[key] = (typeof args[key] == 'undefined')
					? val
					: args[key];
		});
	}

	AR.create = function(id) {
		var container = AR.setting.container;
		var containerObject = document.getElementById(container);
		if (AR.setting.topModel) {
		} else {
			var containerOuterHeight = containerObject.offsetHeight
			var containerOuterWidth = containerObject.offsetWidth;
			var containerInnerHeight = containerObject.clientHeight;
			var containerInnerWidth = containerObject.clientWidth;
			var containerScrollHeight = containerObject.scrollHeight;
			var containerScrollWidth = containerObject.scrollWidth;
			var elementObjs = containerObject.getElementsByTagName("li");
			var elementArray = new Array();
			for(var i = 0, length = elementObjs.length; i < length; i++){
				elementArray[i] = elementObjs[i].innerHTML;
			}
			var container_0 = "<div style='width:"+containerInnerWidth+";height:"+containerInnerHeight+";overflow:hidden;border:1px solid red;' id='"+container+"_0' align='left'>" +
					"<div style='width:"+containerInnerWidth+";height:"+containerInnerHeight+";position:absolute' align='center' id='"+container+"_1'></div></div>";
			containerObject.innerHTML = container_0;
			var elementDiv = document.getElementById(container+"_1");
			
			for(var i = 0, length = elementArray.length; i < length; i++){
				elementDiv.innerHTML += elementArray[i];
			}
//			setTimeout("roll_up()",1000)
		}
	}

	AR.start = function(args) {
		AR.init(args);
		AR.event.ready(function() {
			AR.create(args.id);
		});
	};

	if (window.AR == undefined)
		window.AR = AR;
	window.AutoRoll = AR;
})();

function roll_up(){
	var obj = document.getElementById(AR.setting.container+"_1");
	obj.style.top = obj.offsetTop-10+"px";
	setTimeout("roll_up()",100)
}

// (function(AR, undefined) {
// alert(AR)
// })(AutoRoll);


