$(function(){
$('#endTime').datebox({
formatter:function(date){
	return date.getYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
}
});
$('#startTime').datebox({
formatter:function(date){
	return date.getYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
}
});
$("#searchid").linkbutton({
	 text:'查询',
	 iconCls:'icon-search'
});
 $('#grid').datagrid({

    width:'100%',
    height:400,
    nowrap: false,
	striped: true,
	collapsible:false,
    url:'../suggestion_getSuggestionManage.shtml',
    frozenColumns:[[
	                {field:'ck',title:'选择',checkbox:true}
	                ]],
    columns:[[
			        {title:'基本信息',colspan:4},
					{field:'opt',title:'操作',width:100,align:'center', rowspan:2,
						formatter:function(value,rec){
						return '<span onclick=Onmodify("'+rec.id+'")>处理</span> <span onclick=Ondelete("'+rec.id+'")>删除</span></span>';
						}
					}
				],[ 
					{field:'title',title:'主题',width:400},
					{field:'createtime',title:'创建时间',width:120},
					{field:'comObject',title:'投诉对象',width:160},
				    {field:'state',title:'处理状态',width:60,formatter:
				       function(value){
				        if(value=="0") return "未处理";
				        if(value=="1") return "处理中";
				        if(value=="2") return "处理完";
				        else return value;
				       }
				    }
				]],
				pagination:true,
				rownumbers:true,
				queryParams:{
				},
				toolbar:[{
					id:'btnsave',
					text:'删除',
					iconCls:'icon-save',
					handler:function(){
					    var  records= $('#grid').datagrid("getSelections");
					      var ids = '';
					    if(null==records || records==""){
					       alert('请选择要删除的记录');
					       return ;
					    }
					     for (var i = 0; i < records.length; i++) {
                        ids += records[i].id;
                        ids += ',';
                       }
                          var url1 ="../suggestion_delete.shtml";
                 $.ajax({
                   url: url1,
                   data: "idString="+ids.substring(0,ids.length-1),
                 success: function(msg){
                     
                     var obj=eval('('+msg+')');
                     var result=obj[0]["message"];
                     alert(result);
                     window.location.reload();
                    }
                  });
					}
				 }]
				}
				
		
              
);
    	 var page = $("#grid").datagrid("getPager").pagination("options");
			page.beforePageText = '第';
		  page.afterPageText = '页,共{pages}页';

			page.displayMsg = '显示从 {from} 至 {to} / {total} 的数据';
});
   

   function   onSearch(){
            var queryParams =$('#grid').datagrid("options").queryParams;
			queryParams.startTime=$("#stime").val();
			queryParams.endTime=$("#etime").val();
			queryParams.state=$("#state").val();
			$('#grid').datagrid("reload");
   }
    function   Ondelete(id){ 
          if(id =="undefined") {alert("此条记录已删除");
             return;
          }
          if(confirm("确定删除此条信息吗?")){
                 var url1 ="../suggestion_delete.shtml";
             $.ajax({
                   url: url1,
                   data: "id="+id,
                 success: function(msg){
                     var obj=eval('('+msg+')');
                     var result=obj[0]["message"];
                     alert(result);
                     window.location.reload();
                 }
                });
          }
     }
     
      function Onmodify(id){
       window.location.href="../suggestion_toTpSuggestionInfo.shtml?id="+id;
     }