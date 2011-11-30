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
    url:'../news_getNewsManage.shtml',
    frozenColumns:[[
	                {field:'ck',title:'选择',checkbox:true}
	                ]],
    columns:[[
			        {title:'基本信息',colspan:9},
					{field:'opt',title:'操作',width:150,align:'center', rowspan:3,
						formatter:function(value,rec){
						return '<span style="color:red"><span onclick=read("'+rec.id+'")>查看 </span><span onclick=Onmodify("'+rec.id+'")>修改</span> <span onclick=Ondelete("'+rec.id+'")>删除</span></span>';
						}
					}
				],[ 
					{field:'title',title:'标题',width:200},
					{field:'createTime',title:'发布时间',width:150},
				    {field:'columnType',title:'栏目类型',width:80,formatter:
				       function(value){
				        if(value=="1") return "今日头条";
				        if(value=="2") return "行业动态";
				        if(value=="3") return "项目动态";
				        if(value=="4") return "企业动态";
				        if(value=="5") return "地产金融";
				        if(value=="6") return "评论观察";
				        if(value=="7") return "吸引力动态";
				        else return value;
				       }
				    },
				    {field:'stressFlag',title:'重点新闻',width:60,formatter:function(value){if(value=="0") return "是";else return "否"}},
				     {field:'recommendFlag',title:'推荐',width:60,formatter:function(value){if(value=="0") return "是";else return "否"}},
				      {field:'imgFlag',title:'精彩图文',width:60,formatter:function(value){if(value=="0") return "是";else return "否"}},
				      {field:'clickNum',title:'点击数',width:60},
				      {field:'creator',title:'创建人',width:80}
					
				]],
				pagination:true,
				rownumbers:true,
				queryParams:{
				},
				toolbar:[{
					id:'btnadd',
					text:'添加新闻',
					iconCls:'icon-add',
					handler:function(){
						$(this).attr("href",'../news_toNewsInfo.shtml?flag=1');
						
					}
				},'-',{
					id:'btnsave',
					text:'删除新闻',
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
                          var url1 ="../news_delete.shtml";
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
			queryParams.title=$("#title").val();
			queryParams.startTime=$("#stime").val();
			queryParams.endTime=$("#etime").val();
			queryParams.columnType=$("#columnType").val();
			queryParams.stressFlag=$("#stressFlag").val();
			queryParams.recommendFlag=$("#recommendFlag").val();
			queryParams.creator=$("#creator").val();
			queryParams.imgFlag=$("#imgFlag").val();
			$('#grid').datagrid("reload");
   }
    function   Ondelete(id){ 
          if(id =="undefined") {alert("此条记录已删除");
             return;
          }
          if(confirm("确定删除此条信息吗?")){
                 var url1 ="../news_delete.shtml";
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
     
     function read(id){
       window.location.href="../news_toNewsInfo.shtml?flag=2&id="+id;
     }
      function Onmodify(id){
       window.location.href="../news_toNewsInfo.shtml?flag=3&id="+id;
     }