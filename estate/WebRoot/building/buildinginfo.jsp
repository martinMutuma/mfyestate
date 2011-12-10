<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="estateTag" prefix="estateTag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
		<title>楼盘信息</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="css/index.css" rel="stylesheet" type="text/css" />
		<link href="css/house.css" rel="stylesheet" type="text/css" />
		<link href="css/style.css" type="text/css" rel="stylesheet" />
		<link href="css/ymPrompt.css" rel="stylesheet" type="text/css" />
		<link href="css/common.css" type="text/css" rel="stylesheet" />
		<link href="css/cpdlg.css" type="text/css" rel="stylesheet" />
		<link rel="stylesheet" href="../resource/css/whole.css"
			type="text/css"></link>
		<script type="text/javascript" src="../resource/js/whole.js"></script>
		<script src="js/jquery-1.4a2.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/menu.js"></script>
		<script type="text/javascript" src="js/building.js"></script>
		<script type="text/javascript" src="js/cpdlg.js"></script>
		<script type="text/javascript" src="js/common_top.js"></script>
		<script type="text/javascript" src="js/swith.js"></script>

		<script type="text/javascript" language="javascript">
function hv(Str){document.getElementById(Str).style.visibility="visible"};
function hh(Str){document.getElementById(Str).style.visibility="hidden"};
</script>

		<script type="text/javascript">
		 var basePath = "<%=basePath%>";
</script>
		<script src="js/jquery.KinSlideshow-1.2.1.min.js"
			type="text/javascript"></script>

</head>
<body >
<center>
    <!--主导航结束-->
    <jsp:include page="../head.jsp"></jsp:include>
  <!--head end-->
  <div class="l_loca">
    	<span class="left lo_le">您当前的位置：<a href="#">梦房园</a> <a href="#">楼盘信息</a> <s:property value="tpBulding.name"/></span>
        <span class="clear"></span>
    </div>
    <!--位置-->
    <!--楼盘信息-->
<div class="house_x">
    <div class="house_x_dt">
                <div class="xxxx_top">
                    <div class="left hs_tit">
                        <h1><s:property value="tpBulding.name"/></h1>
                        <p class="ico_xx">
                          <!--  <img src="images/ic2.gif" alt="优惠" title="优惠楼盘" />    -->         </p>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="house_nav">
                    <div id="house_nav">
                        <a href="toBuidingInfo.shtml?id=<s:property value='tpBulding.id'/>" class="nav_housOn"  >楼盘主页</a> 
                        <a href="#news" >最新动态</a> 
                        <a href="buildingimages.shtml?pid=<s:property value="tpBulding.id"/>&page=0&type=9"  >图片看房</a> 
                        <a href="housetype.shtml?pid=<s:property value="tpBulding.id"/>&page=0"  >户型</a> 
                        <a href="#knav1"  >楼盘详情</a> 
                        <a href="#kn1" >生活配套</a> 
                    </div>
                </div>
       		 </div>
 <div class="house_x_dd">
  <!--dd left-->
    <div class="hdd_L">
      <dl class="hdl_sw bdc5">
        <dt>
        <div id="KinSlideshow" style="visibility:hidden; text-align:left;">
          <s:iterator value="effectList">
            <a href="showimage.shtml?pid=<s:property value='tpBulding.id'/>&type=9&imgid=<s:property value='id'/>" target="_blank"><img src="../<s:property value='imgUrl'/>" title="<s:property value='imgName'/>" alt="<s:property value='imgName'/>" width="310" height="232"/></a>
           </s:iterator>
          </div>
          <span class="re_xiao"></span> 
        </dt>
        <dd>
        </dd>
      </dl>
      <dl class="bdc5 jia_g mad_b15">
        <dt> <span class="fbo14 qv_s">价格走势</span> </dt>
        <dd style=" padding:0 10px;">
            <div class="go_way be5">
                <div class="left w050">
                    <span class="gw_tit fbo14 l26">价格走势</span>
                    <span class="l20">本月：暂无数据</span><span class="l20">上月：暂无数据</span>
                </div>
                <div class="fen_s"></div>
                <div class="right w050">
                    <span class="gw_tit fbo14 l26">历史走势</span>
                    <span class="l20">最高价：<s:property value="tpBulding.maxPrice"/>元/㎡</span><span class="l20">最低价：<s:property value="tpBulding.minPrice"/>元/㎡</span>
                </div>
                <div class="kanfang" id="showingsnum2"><font class="C0 f30"><s:property value="tpBulding.showingsnum"/></font>人 <a href="#tuan"><img src="images/join_tuan.gif" title="参加免费看房团"/></a></div>
            </div>
        </dd>
      </dl>      <div class="clear"></div>
    </div>
    <!--dd left-->
    <!--dd right-->
    <div class="hous_list">
      <ul class="xxbox be5">
      	<li>
        	<div class="left w4 all366C">
            	<span>楼盘名称：</span><s:property value="tpBulding.name"/>            </div>
            <div class="left">
               </div>
            <div class="clear"></div>
        </li>
        <li>
        	<div class="left w4 all366C">
            	<span>楼盘类型：</span>
            	
               <script>
				switch(parseInt('<s:property value="tpBulding.buildingType"/>')){
				    case 0 : document.write('住宅 ');
				    case 1 : document.write('公寓 ');
				    case 2 : document.write('海景房 ');
				    case 3 : document.write('别墅 ');
				    case 4 : document.write('酒店式公寓 ');
				    case 5 : document.write('产权式公寓 ');
				}
            </script>            </div>
            <div class="left all366C">
            	<span>项目特色：</span>
                  <script>
				switch(parseInt('<s:property value="tpBulding.features"/>')){
				    case 0 : document.write('特色别墅 ');
				    case 1 : document.write('养老居所 ');
				    case 2 : document.write('高档小区 ');
				    case 3 : document.write('景观居所 ');
				    case 4 : document.write('宜居生态 ');
				    case 5 : document.write('花园洋房 ');
				    case 6 : document.write('投资地产 ');
				    case 7 : document.write('创意地产 ');
				    case 8 : document.write('水景地产 ');
				}
            </script>
                     </div>
            <div class="clear"></div>
        </li>
        <li>
        	<div class="left w4 all366C">
                <span>起&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：</span><font class='bold cFF7'><s:property value="tpBulding.minPrice"/>元/㎡</font>           </div>
            <div class="left">
            	<span>装修状况：</span>
            	<estateTag:convertCode codeType="装修状况" code="${tpBulding.fitCondition}"></estateTag:convertCode>
                </div>
            <div class="clear"></div>
        </li>
        <li>
       		 <div class="left w4 all366C">
            	<span>所在区域：</span>
                <s:property value="tpBulding.disname"/> </div>
            <div class="left">
            	<span>楼盘地址：</span>
                <s:property value="tpBulding.address"/></div>
            <div class="clear"></div>
        </li>
        <li>
        	<div class="left w4 all366C">
            	<span>开盘日期：</span>
                <s:date name="tpBulding.openDate" format="yyyy-MM-dd"/> 
            </div>
            <div class="left all366C">
            	<span>入住日期：</span>
                 <s:date name="tpBulding.checkDate" format="yyyy-MM-dd"/> 
            </div>
            <div class="clear"></div>
        </li>
        <li>
        	<div class="left w4 all366C">
            	<span>绿 化 率：</span>
                <s:property value="tpBulding.greenRate"/>%            </div>
            <div class="left">
            	<span>容 积 率：</span>
                  <s:property value="tpBulding.capacityRate"/>%           </div>
            <div class="clear"></div>
        </li>
        <li>
        	<div class="left w4 all366C">
            	<span>物 业 费：</span>
                 <s:property value="tpBulding.propertyManagement"/> 元/㎡·月            </div>
            <div class="left">
            	<span>物业公司：</span>
                <s:property value="tpBulding.propertyCompany"/>  </div>
            <div class="clear"></div>
        </li>
        <li>
            <span>开 发 商：</span>
           <s:property value="tpBulding.businessDevelopment"/>      </li>
        <li>
          　　
        </li>
      </ul>	
       <ul class="xxbox be5">
        <li>
        	<div class="left pad_t3">浏览人数：<s:if test="tpBulding.views==null">0</s:if><s:else><s:property value="tpBulding.views"/></s:else> 人浏览</div>
            <div class="left mad_L" id="concernNum">关注人数：<em id="gzCount"><span id="attentioncount"><s:if test="tpBulding.attentionNum==null">0</s:if><s:else><s:property value="tpBulding.attentionNum"/></s:else> </span></em>人 
                    <a href="attention.shtml?id=<s:property value='tpBulding.id'/>&attentioncount=<s:property value="tpBulding.attentionNum"/>" title="关注楼盘" rel="nofollow"  target="tempF">
                        <img src="images/guan_z.gif" alt="关注楼盘" />
                    </a>
                </div>
             <div class="left mad_L" id="tuanNum"><span id = "showingsnum1">报名人数：<s:property value="tpBulding.showingsnum"/></span> 人<a href="#tuan" title="参加看房团" rel="nofollow"><img src="images/joi_t.gif" alt="参加看房团" /></a></div>  
         </li>
      </ul>
    <!--dd right-->
    <div class="clear"><iframe name="tempF" style="display: none"></iframe></div>
  </div>
</div>
<!--楼盘信息-->
<div class="w960 fafoot_con">
  <!--左边-->
  <div class="ffot_L">

     <dl class="left_dl madt w238">
        <dt>
        	 <div class="left_tit fbo14"><a href="#">同区域楼盘</a></div>
        </dt>
        <dd>
          <div class="ph">
           <s:iterator value="districtBulidList" status="sta">
           <div class="ph0 bE4E">
               <p class="sp_l"><font class="numbb"><s:property value='#sta.index+1'/></font><s:property value='name'/> </p>
              <p class="sp_r">起价：<font class='bold cFF7'><s:property value='minPrice'/>元/㎡</font></p>
                            <i class="right"> </i> </div>
            <div class="ph1 bE4E">              
              <div class="kkbd L59" style='font-size:14px' ><s:property value='#sta.index+1'/></div>
                <ul class="em_ad">
                    <li class="pssad"><a href="toBuidingInfo.shtml?id=<s:property value='id'/>" title="<s:property value='name'/>"><img src="../<s:property value='compressUrl'/>" title="<s:property value='name'/>"/></a></li>
                   	 <li>
                        <ol class="aas_ol">
                            <li class="bold">
                            <a href="toBuidingInfo.shtml?id=<s:property value='id'/> "><s:property value='name'/></a>
                            <font class="c99 nom">（<s:property value='disname'/>）
                              </font>
                              </li>
                            <li>起价：<font class='bold cFF7'><s:property value='minPrice'/>元/㎡ </font></li>
                            <li>
                                <font class="left guan_z allf60"><a href="attention.shtml?id=<s:property value='id'/>&attentioncount=<s:property value='attentionNum'/>" target="tempF">关注</a></font>
                            </li>
                        </ol>
                    </li>
               </ul>
              </div>  
              </s:iterator>  
          </div>
        </dd>
      </dl>
      
      
 <dl class="left_dl madt w238">
        <dt>
          <div class="left_tit fbo14"><a href="#" >同价位楼盘</a></div>
        </dt>
        <dd>
          <div class="ph">
            <s:iterator value="averagePriceList"  status="sta">
           <div class="ph0 bE4E">
               <p class="sp_l"><font class="numbb"><s:property value='#sta.index+1'/></font><s:property value='name'/> </p>
              <p class="sp_r">起价：<font class='bold cFF7'><s:property value='minPrice'/>元/㎡</font></p>
                            <i class="right"> <font class="allf60"><a href="attention.shtml?id=<s:property value='id'/>&attentioncount=<s:property value='attentionNum'/>" target="tempF">关注</a></font></i> </div>
            <div class="ph1 bE4E">              
              <div class="kkbd L59" style='font-size:14px' ><s:property value='#sta.index+1'/></div>
                <ul class="em_ad">
                    <li class="pssad"><a href="toBuidingInfo.shtml?id=<s:property value='id'/> " title="<s:property value='name'/>"><img src="../<s:property value='compressUrl'/>" title="<s:property value='name'/>"/></a></li>
                   	 <li>
                        <ol class="aas_ol">
                            <li class="bold">
                            <a href="toBuidingInfo.shtml?id=<s:property value='id'/> "><s:property value='name'/></a>
                            <font class="c99 nom">（<s:property value='disname'/>）
                              </font>
                              </li>
                            <li>起价：<font class='bold cFF7'><s:property value='minPrice'/>元/㎡ </font></li>
                            <li>
                                <font class="left guan_z allf60"><a href="attention.shtml?id=<s:property value='id'/>&attentioncount=<s:property value='attentionNum'/>" target="tempF">关注</a></font>
                            </li>
                        </ol>
                    </li>
               </ul>
              </div>  
              </s:iterator> 
          </div>
        </dd>
      </dl>            
    
  </div>
  <!--左边-->
  <!--右边-->
  <div class="house_right borde">
    <div class="fff_con">
      <!--最新动态开始-->
      <dl class="kk_right w669">
        <dt> <span class="kk_title" id="news">最新动态</span> <span class="all366C fan_H"><a href="#" rel="nofollow">返回顶部</a></span></dt>
                  <dd class="pad_t"> 

              <div class="ds_dt">
                <ul class="ds_data p_data_02">
                    <li class="c66 allf60"> 
                        <span class="left bold">  <s:property value="tpBulding.trends" escape="false"/> </span>
                        <span class="right"></span>
                    </li>
                    <li class="Y"></li>
                </ul>
              </div>
             </dd><dd class="pad_t"> 
             </dd>      </dl>
      <!--楼盘简介开始-->
      <dl class="kk_right w669">
        <dt>
          <ul>
            <li class="kkOn" id="knav1" onmouseover="myTab('knav','knavcon',3,1,'kkOff','kkOn');">项目介绍</li>
            <li class="kkOff" id="knav2" onmouseover="myTab('knav','knavcon',3,2,'kkOff','kkOn');">基本信息</li>
            <li class="kkOff" id="knav3" onmouseover="myTab('knav','knavcon',3,3,'kkOff','kkOn');">相关信息</li>
          </ul>
          <span class="all366C fan_H"><a href="#" rel="nofollow">返回顶部</a></span></dt>
        <dd> <span id="knavcon1">
          <div class="jbxx_box madt10">
          <div style="width:660px;height:320px;overflow-y:scroll; border:0px;">
          <p><s:property value="tpBulding.projectIns" escape="false"/></p>
          </div>
          </div>
          

          
          
          </span> <span id="knavcon2" class="disnon">
          <ul class="messs_house madt10">
            <li class="w4"><span>项目名称：</span><s:property value="tpBulding.name"/></li>
            <li class="w4"><span>销售状态：</span>
            <script>
				switch(parseInt('<s:property value="tpBulding.salesStatus"/>')){
				    case 0 : document.write('待售');break;
				    case 1 : document.write('预售');break;
				    case 2 : document.write('在售');break;
				    case 3 : document.write('尾盘');break;
				    case 4 : document.write('售完');break;
				}
            </script>
            </li>
            <li class="w4"><span>楼盘类型：</span>
              <script>
				switch(parseInt('<s:property value="tpBulding.buildingType"/>')){
				    case 0 : document.write('住宅 ');
				    case 1 : document.write('公寓 ');
				    case 2 : document.write('海景房 ');
				    case 3 : document.write('别墅 ');
				    case 4 : document.write('酒店式公寓 ');
				    case 5 : document.write('产权式公寓 ');
				}
            </script>
            
            </li>
            <li class="w4"><span>项目特色：</span>
              <script>
				switch(parseInt('<s:property value="tpBulding.features"/>')){
				    case 0 : document.write('特色别墅 ');
				    case 1 : document.write('养老居所 ');
				    case 2 : document.write('高档小区 ');
				    case 3 : document.write('景观居所 ');
				    case 4 : document.write('宜居生态 ');
				    case 5 : document.write('花园洋房 ');
				    case 6 : document.write('投资地产 ');
				    case 7 : document.write('创意地产 ');
				    case 8 : document.write('水景地产 ');
				}
            </script>
             </li>
            <li class="w4"><span>所在区域：</span><s:property value="tpBulding.disname"/></li>
            <li class="w4"><span>楼盘地址：</span><s:property value="tpBulding.address"/></li>
            <li class="w4"><span>主力户型：</span><s:property value="tpBulding.mainUnit"/></li>
            <li class="w4"><span>装修状况：</span><estateTag:convertCode codeType="装修状况" code="${tpBulding.fitCondition}"></estateTag:convertCode></li>
            <li class="w9"><span>楼盘状况：</span><div style="width:80%; overflow:visible;"><s:property value="tpBulding.buildStatus"/></div></li>
            <li class="w4"><span>开盘日期：</span><s:date name="tpBulding.openDate" format="yyyy-MM-dd"/></li>
            <li class="w4"><span>入住日期：</span><s:date name="tpBulding.checkDate" format="yyyy-MM-dd"/></li>
            <li class="w4"><span>楼盘起价：</span><s:property value="tpBulding.minPrice"/>元/㎡</li>
            <li class="w4"><span>楼盘均价：</span><s:property value="tpBulding.averagePrice"/>元/㎡</li>
            <li class="w4"><strong class="c66">楼盘最高价：</strong><s:property value="tpBulding.maxPrice"/>元/㎡</li>
            <li class="w4 all366C"><span>现房期房：</span>
              <script>
				switch(parseInt('<s:property value="tpBulding.isForward"/>')){
				    case 0 : document.write('现房 ');
				    case 1 : document.write('期房 ');
				}
            </script>
            </li>
            <li class="w4"><span>总栋数：</span><s:property value="tpBulding.buildingCount"/>栋</li>
            <li class="w4"><span>总套数：</span><s:property value="tpBulding.unitCount"/>套</li>
            <li class="w4"><span>占地面积：</span><s:property value="tpBulding.area"/>㎡</li>
            <li class="w4"><span>建筑面积：</span><s:property value="tpBulding.constructionArea"/>㎡</li>
            <li class="w4 all366C"><span>容 积 率：</span><s:property value="tpBulding.capacityRate"/>% <a href="http://baike.baidu.com/view/77324.htm" target="_blank" rel="nofollow">什么是容积率</a></li>
            <li class="w4 all366C"><span>绿 化 率：</span><s:property value="tpBulding.greenRate"/>% <a href="http://baike.baidu.com/view/77999.htm" target="_blank" rel="nofollow">什么是绿化率</a></li>
            <li class="w4"><span>外  墙：</span><s:property value="tpBulding.outterWall"/></li>
            <li class="w4"><span>结  构：</span><s:property value="tpBulding.structure"/></li>
            <li class="w4"><span>承 建 商：</span><s:property value="tpBulding.contractors"/></li>
          </ul>
          </span> <span id="knavcon3" class="disnon">
          <ul class="messs_house madt10">
            <li class="w4"><span>车 位：</span><s:property value="tpBulding.carPat"/>个</li>
            <li class="w4"><span>物 业 费：</span><s:property value="tpBulding.propertyManagement"/>元/㎡·月</li>
            <li class="w1"><span>物业公司：</span><s:property value="tpBulding.propertyCompany"/></li>
            <li class="w4"><span>供 水：</span><s:property value="tpBulding.waterSupply"/></li>
            <li class="w4"><span>供 暖：</span><s:property value="tpBulding.heatingSupply"/></li>
            <li class="w1"><span>开发商：</span><s:property value="tpBulding.businessDevelopment"/></li>
            <li class="w1"><span>投资商：</span><s:property value="tpBulding.investors"/></li>
            <li class="w1"><strong class="c66">预售许可证：</strong><s:property value="tpBulding.preLicense"/></li>
          </ul>
          </span></dd>
      </dl>
      <!--楼盘简介结束-->
      <dl class="suppt w669">
        <dt>
          <ul>
            <li class="kkOn" id="kn1" onclick="myTab('kn','kkcon',1,1,'kkOff','kkOn');">生活配套</li>
          </ul>
          <span class="all366C fan_H"><a href="#" rel="nofollow">返回顶部</a></span> </dt>
        <dd>
          <div id="kkcon1">
            <ul class="box_supp">
              		  
              <li><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="tpBulding.lifeSupport"/></em></li>              <li class="fbo14 l32 padl18">小区配套</li>              <li><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="tpBulding.neighborhoods"/></em></li>
              <li class="fbo14 l32 padl18">交通状况</li>                                          <li><span>其他：</span><em><s:property value="tpBulding.traffic"/></em></li>            </ul>
          </div>
        </dd>
      </dl>
      <dl class="kk_right w669">
        <dt>
          <ul>
            <li class="kkOn" id="kknav1" onmouseover="myTab('kknav','kcon',3,1,'kkOff','kkOn');">精选户型</li>
            <li class="kkOff" id="kknav2" onmouseover="myTab('kknav','kcon',3,2,'kkOff','kkOn');">一居</li><li class="kkOff" id="kknav3" onmouseover="myTab('kknav','kcon',3,3,'kkOff','kkOn');">二居</li>          </ul>
          <span class="all366C fan_H"><a href="#" rel="nofollow">返回顶部</a></span> </dt>
        <dd>
          <ul id="kcon1" class="choose_x">
              <s:iterator value="selectedUnitList">
	               <li class="w122">
		                <p class="k_pic"><a href="showimage.shtml?pid=<s:property value='tpBulding.id'/>&type=9&imgid=<s:property value='id'/>" target="_blank" title=""><img src="../<s:property value='imgUrl'/>" alt="<s:property value='desr'/>"/></a></p>
		                <p class="k_tit"><s:property value='imgName'/></p>
	               </li>
			  </s:iterator>
          </ul>
          <ul id="kcon2" class="disnon choose_x">
               <s:iterator value="aHomeList">
               <li class="w122">
                <p class="k_pic"><a href="showimage.shtml?pid=<s:property value='tpBulding.id'/>&type=9&imgid=<s:property value='id'/>" target="_blank" title=""><img src="../<s:property value='imgUrl'/>" alt="<s:property value='desr'/>"/></a></p>
                <p class="k_tit"><s:property value='imgName'/></p>
              </li>
			</s:iterator>   
          </ul>
              
              <ul id="kcon3" class="disnon choose_x">
              <s:iterator value="twoHomeList">
               <li class="w122">
                <p class="k_pic"><a href="http://www.wofang.com/building/1586-photo-hx-58809.html#seehcon1" target="_blank" title=""><img src="../<s:property value='imgUrl'/>" alt="<s:property value='desr'/>"/></a></p>
                <p class="k_tit"><s:property value='imgName'/></p>
              </li>
			</s:iterator>   
              </ul>      
         </dd>
      </dl>
      
       <!--团购问题点-->

<div class="h_hR"></div>
<dl class="apply" id="tuan1">
    <dt>
        <div class="ap_t fbo14" id="tuan">
            <span class="fp_left"> <s:property value="tpBulding.name"/> 免费看房团</span>
            <span class="fp_right"></span>
        </div>
        <span class="tuan_j"></span>
    </dt>
    <dd>
    <div class="join_buy">
            <div class="jan"><img src="images/lis.gif" /> 大家一起组团旅游看房</div>
            <form id="showingsForm" name="showingsForm" action="showings.shtml" method="post" class="j_form" target="tempF">
                <div class="div"><label><font class="C0">*</font> 姓名：</label><input id="tname" name="tpShowings.name" type="text" class="j_butt01" /> <input name="tpShowings.sex" type="radio" checked="checked" value="1"/> 先生 <input name="tpShowings.sex" type="radio" value="2"/> 女士 <span id="joinTuanTips_name" style="color:red; font-weight:bold;"></span></div>
                <div class="div"><label><font class="C0">*</font> 手机号码：</label><input id="ttel" name="tpShowings.tel" type="text" class="j_butt" /> <font class="c66"><span id="joinTuanTips_tel" style="color:red; font-weight:bold;">(请填写真实手机，方便置业顾问联系您)</span></font></div>
                <div class="div">
                    <div class="left"><label>电子邮箱：</label><input id="temail" type="text" class="j_butt" /><br /><span id="joinTuanTips_email" style="color:red; font-weight:bold;"></span><span id="submitBt"><input id="joinTuanBt" name="" type="button" class="j_bu" onclick="joinTuan($('#tname').val(),$('#ttel').val(),$('#temail').val())" value =""/></span></div>
                     <input type="hidden" name="tpShowings.pid" value='<s:property value="tpBulding.id"/>'/>
                     <input type="hidden" name="tpShowings.pname" value='<s:property value="tpBulding.name"/>'/>
                     <input type="hidden" id="newshowingsnum" value='<s:property value="tpBulding.showingsnum"/>'/>
                    <div class="left tit">更多优惠及服务请致电置业顾问<br />
                    <span>
                    ----------</span></div>
                </div>
            </form>
            <div id="joinTuanTips" style="padding-left:20px; color:#F00; font-weight:bold;"></div>
        </div>
        <div class="hui_con">
            <p class="hcn_tit C0">梦房园服务：</p>
            <p>置业顾问专业服务</p>
            <p>免费专车接机</p>
            <p>免费旅游看房</p>
            <p class="pad_t23"><font class="C0 f30"><span id= "showingsnum3"><s:property value="tpBulding.showingsnum"/></span></font>人报名</p>
        </div>
    </dd>
  </dl>

<div class="h_hR"></div>
<div class="yqts_box" id="tuan2" style="clear: both; display: none;">
	<h3>参加看房团成功</h3>
    <div class="yqts all366C f14">
		<span class="tit"><img src="images/accept.png" />谢谢您的参与，您已成功报名参加了<span style="color:#F30"><s:property value="tpBulding.name"/></span>的免费看房团！置业顾问将在第一时间内和您联系。</span>
        <div class="h_hR"></div>
        <div class="pad_t"><input type="button" value=" 关 闭 " class="cur" onclick="checkTuan()"/></div>
		<div class="ts_gb"><a class="cf30" style="cursor:pointer" onclick="checkTuan()">X关闭</a></div>
  	</div>
</div>
    </div>
  </div>
  <div class="clear"></div>
</div>
</div>


<div id="fullbg"></div>

<div id="send_dlg">
<div id="send_dlg_content">

</div>
</div>
   		<div style="padding-top: 15px;text-algin:center;">
		<jsp:include page="../copyright.jsp"/>
		</div>
</center>

</body>
</html>
