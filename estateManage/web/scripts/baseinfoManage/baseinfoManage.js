
$(function(){
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
    url:'../baseinfo_getBaseinfoManage.shtml',
    frozenColumns:[[
	                {field:'ck',title:'选择',checkbox:true}
	                ]],
    columns:[[
			        {title:'基本信息',colspan:5},
					{field:'opt',title:'操作',width:200,align:'center', rowspan:3,
						formatter:function(value,rec){
						return '<span style="color:red"><span onclick=read("'+rec.id+'")>查看 </span><span onclick=Onmodify("'+rec.id+'")>修改</span> <span onclick=Ondelete("'+rec.id+'")>删除</span></span>';
						}
					}
				],[ 
					{field:'username',title:'用户名',width:120},
					{field:'type',title:'用户类型',width:120,formatter:function(value){
						        if(value=="1") return "经纪人";
						        if(value=="2") return "个人业主";
						        if(value=="3") return "公司业主";
						        if(value=="4") return "开发商";
						        if(value=="5") return "客户(需求方)";
						        if(value=="6") return "银行";
						        if(value=="7") return "贷款中介";
						        if(value=="8") return "评估公司";
						        if(value=="9") return "研究机构";
						        if(value=="10") return "连锁企业";
						        if(value=="11") return "其他";
						        else return value;
						}
					},
					{field:'mobile',title:'手机',width:150},
				    {field:'status',title:'用户状态',width:150,formatter:
					    function(value){
					            if(value=="0") return "正常";
							      if(value=="1") return "禁用";
							      else return value;
					    }
				    },
				    {field:'lastLoginTime',title:'登录时间',width:150}
					
				]],
				pagination:true,
				rownumbers:true,
				queryParams:{
				},
				toolbar:[{
					id:'btnadd',
					text:'增加会员',
					iconCls:'icon-add',
					handler:function(){
						$(this).attr("href",'../baseinfo_toBaseinfoInfo.shtml?flag=1');
						
					}
				},'-',{
					id:'btnsave',
					text:'删除需求',
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
                          var url1 ="../baseinfo_delete.shtml";
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
			queryParams.username=$("#username").val();
			queryParams.mobile=$("#mobile").val();
			queryParams.tbtype=$("#tbtype").val();
			queryParams.discode=$("#discode").val();
			queryParams.status=$("#status").val();
			$('#grid').datagrid("reload");
   }
    function   Ondelete(id){ 
          if(id =="undefined") {alert("此条记录已删除");
             return;
          }
          if(confirm("确定删除此条信息吗?")){
                 var url1 ="../baseinfo_delete.shtml";
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
       window.location.href="../baseinfo_toBaseinfoInfo.shtml?flag=2&id="+id;
     }
      function Onmodify(id){
       window.location.href="../baseinfo_toBaseinfoInfo.shtml?flag=3&id="+id;
     }
     

     
     