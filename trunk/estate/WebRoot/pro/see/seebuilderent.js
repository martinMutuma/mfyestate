/**
 * 修改写字楼信息验证
 */
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
// 判断是否是正实数
function isUnsignedNumeric(obj) {
	var reg = /^\d+(\.\d+)?$/
	if (reg.test(obj.value)) {
		return true;
	} else {
		return false;
	}
}
// 判断是否是非正浮动数
function isFloat(obj) {
	var reg = /^((-\d+(\.\d+)?)|(0+(\.0+)?))$/
	if (reg.test(obj.value)) {
		return true;
	} else {
		return false;
	}
}
// 判断是正实数 不是则用空字符串代替
function isNum(obj) {
	if (isNaN(obj.value)) {
		obj.value = "";
	}
	if (isFloat(obj)) {
		obj.value = "";
	}

}
function checkImage(obj) {
	if (/(.gif)|(.png)|(.jpg)|(.jpeg)|(.ico)$/.exec(obj.value))
		return true;
	else
		return false;
}

function check() {
	var name = document.getElementById("name");
	if (checkNull(name)) {
		alert('请填写写字楼名称');
		name.focus();
		return false;
	}
	if (checkLength(name, 50)) {
		alert("写字楼名字长度应小于50");
		name.focus();
		return false;
	}
	var price = document.getElementById("price");
	if (price.value == 0.0)
		price.value = ""
	if (checkNull(price)) {
		alert('请填写写字楼租金单价');
		price.focus();
		return false;
	}
	if (!isUnsignedNumeric(price)) {
		alert('写字楼租金单价应为正实数');
		price.focus();
		return false;
	}
	var area = document.getElementById("area");
	if (area.value == 0.0)
		area.value = ""
	if (checkNull(area)) {
		alert('请填写写字楼建筑面积');
		area.focus();
		return false;
	}
	if (!isUnsignedNumeric(area)) {
		alert('写字楼建筑面积应为正实数');
		area.focus();
		return false;
	}
	var successPre = document.getElementById("successPre");
	if (successPre.value == 0.0)
		successPre.value = ""
	if (!checkNull(successPre)) {
		if (!isUnsignedNumeric(successPre)) {
			alert('写字楼得房率应为正实数');
			successPre.focus();
			return false;
		}
		if (successPre.value > 100) {

			alert('写字楼得房率应为小于等于100');
			successPre.focus();
			return false;
		}
	}
	var title = document.getElementById("title");
	if (checkNull(title)) {
		alert('请填写写字楼案源标题');
		title.focus();
		return false;
	}
	if (checkLength(title, 50)) {
		alert("写字楼案源标题长度应小于50");
		title.focus();
		return false;
	}
      if (!KE.util.isEmpty('content')) document.getElementById("content").value=KE.util.getData('content');
	if (confirm("确认修改写字楼信息吗?"))
		return true;
	return false;
}
$(function() {
	function format(value) {
		if (value != "3200000000")
			return "&nbsp;&nbsp;&nbsp;&nbsp;" + value;
		return value;
	}
	var columnModel = [{
				id : 'name',
				width : '100px',
				height : '40px',
				align : 'center',
				header : '名称',
				dataIndex : 'name'
			}, {
				id : 'address',
				width : '220px',
				height : '40px',
				align : 'center',
				header : '地址',
				dataIndex : 'address',
				css : '',
				renderer : format
			}, {
				id : 'propertyFees',
				width : '180px',
				height : '40px',
				align : 'center',
				header : '物业管理费',
				dataIndex : 'propertyFees',
				css : '',
				renderer : format
			},
    {id:'disname',
   width:'180px',
   height:'40px',
   align:'center',
   header:'地区名字',
   dataIndex:'disname',
   css:''
   },
   {id:'district',
   width:'180px',
   height:'40px',
   align:'center',
   header:'地区编码',
   dataIndex:'district',
   css:''
   }
			];
	$("#name").dataGridTip('../floor/search.shtml', '', {
				height : '400px',
				width : '400px'
			}, {
				cm : columnModel,
				tipName : '请选择楼盘',
				extraColumn : '<div align=center onclick=addFloor()><font color=red>新增物业</font></div>'
			}, function(data) {
				$("#name").val(data.name);
				$("#add1").val(data.address);
				$("#propertyManagement").val(data.propertyFees);
				$("#address").text(data.address);
				$("#propertyFees").text(data.propertyFees);
                 $("#discode").val(data.district);
                 $("#disname").val(data.disname);
			})
});
function addFloor() {
	window
			.open(
					'floor.jsp',
					'新增楼盘',
					'height=900, width=1000, top=0, left=0,menubar=no,scrollbars=yes, resizable=no,location=no')

}
