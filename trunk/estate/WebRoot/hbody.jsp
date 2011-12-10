<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="estateTag" prefix="estateTag" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>梦房园</title>
<meta http-equiv="keywords" content="楼盘,买房">
<meta http-equiv="description" content="梦房园是买卖、租赁房屋平台，它提供新房、二手房买卖租赁信息,也提供地产投资、海景房、旅游地产以及房产资讯">
<link rel="stylesheet" href="resource/css/whole.css" type="text/css"></link>
<link rel="stylesheet" href="resource/css/hbody.css" type="text/css"></link>
<script type="text/javascript" src="resource/js/jquery-1.4.2.js" charset="utf-8"></script>
<script type="text/javascript" src="resource/js/whole.js"></script>
<script type="text/javascript" src="resource/js/hbody.js"></script>
</head>
<body>
    <div>
	<jsp:include page="head.jsp"/>
	</div>
	<div class="panel" align="center" style="margin-top: 15px;">
		<div class="layout">
	      <div class="con_left">
	                      <div class="daohang"></div>
						  <div class="categoryNav">
								<div id="cnBody" align="center">
								<ul>
									<li><span>&middot;&nbsp;住宅</span><font style="color:#FD9FA3;font-weight: bold;">&gt;</font>
									<s:if test="#data.dhMap.a.size()>0">
									<div class="dhlist" style="Z-INDEX:999999;">
										<s:iterator value="#data.dhMap.a" var="dd" status="sta">
											<span onclick="searchByNaviga('<s:property value="dd"/>','1')">&gt;<s:property value="dd"/></span>
										</s:iterator>
									</div>
									</s:if>
									</li>
									<li><span>&middot;&nbsp;公寓</span><font style="color:#FD9FA3;font-weight: bold;">&gt;</font>
									<s:if test="#data.dhMap.b.size()>0">
									<div>
										<s:iterator value="#data.dhMap.b" var="dd" status="sta">
											<span onclick="searchByNaviga('<s:property value="dd"/>','2')">&gt;<s:property value="dd"/></span>
										</s:iterator>
									</div>
									</s:if>
									</li>
									<li><span>&middot;&nbsp;海景房</span><font style="color:#FD9FA3;font-weight: bold;">&gt;</font>
									<s:if test="#data.dhMap.c.size()>0">
									<div>
										<s:iterator value="#data.dhMap.c" var="dd" status="sta">
											<span onclick="searchByNaviga('<s:property value="dd"/>','3')">&gt;<s:property value="dd"/></span>
										</s:iterator>
									</div>
									</s:if>
									</li>
									<li><span>&middot;&nbsp;别墅</span><font style="color:#FD9FA3;font-weight: bold;">&gt;</font>
									<s:if test="#data.dhMap.d.size()>0">
									<div>
										<s:iterator value="#data.dhMap.d" var="dd" status="sta">
											<span onclick="searchByNaviga('<s:property value="dd"/>','4')">&gt;<s:property value="dd"/></span>
										</s:iterator>
									</div>
									</s:if>
									</li>
									<li><span>&middot;&nbsp;酒店式公寓</span><font style="color:#FD9FA3;font-weight: bold;">&gt;</font>
									<s:if test="#data.dhMap.e.size()>0">
									<div>
										<s:iterator value="#data.dhMap.e" var="dd" status="sta">
											<span onclick="searchByNaviga('<s:property value="dd"/>','5')">&gt;<s:property value="dd"/></span>
										</s:iterator>
									</div>
									</s:if>
									</li>
									<li><span>&middot;&nbsp;产权式酒店</span><font style="color:#FD9FA3;font-weight: bold;">&gt;</font>
									<s:if test="#data.dhMap.f.size()>0">
									<div>
										<s:iterator value="#data.dhMap.f" var="dd" status="sta">
											<span onclick="searchByNaviga('<s:property value="dd"/>','6')">&gt;<s:property value="dd"/></span>
										</s:iterator>
									</div>
									</s:if>
									</li>
									<li><span>&middot;&nbsp;写字楼</span><font style="color:#FD9FA3;font-weight: bold;">&gt;</font>
									<s:if test="#data.dhMap.g.size()>0">
									<div>
										<s:iterator value="#data.dhMap.g" var="dd" status="sta">
											<span onclick="searchByNaviga('<s:property value="dd"/>','7')">&gt;<s:property value="dd"/></span>
										</s:iterator>
									</div>
									</s:if>
									</li>
									<li style="border: 0px"><span>&middot;&nbsp;商铺</span><font style="color:#FD9FA3;font-weight: bold;">&gt;</font>
									<s:if test="#data.dhMap.h.size()>0">
									<div>
										<s:iterator value="#data.dhMap.h" var="dd" status="sta">
											<span onclick="searchByNaviga('<s:property value="dd"/>','8')">&gt;<s:property value="dd"/></span>
										</s:iterator>
									</div>
									</s:if>
									</li>
								</ul>
								</div>
							</div>
							
						<div class="clear"></div>
	                    
	                    <div id="attention" style="background: #ffffff;">
								<div class="guanzhu"></div>
								<div id="atBody" align="center">
								<ul>
									<s:iterator value="#data.attentionBulidList" status="sta">
										<s:if test="#sta.index == 0">
											<li id="atBody_s<s:property value="#sta.index"/>" style="height: 75px;line-height: 75px;">
												<table width="100%" height="75px" cellpadding="0" cellspacing="0" border="0">
													<tr>
														<td align="left"><font color="#FF0000" size="5px"><s:property value="#sta.index+1"/></font></td>
														<td>
														<img onclick="showBulid('<s:property value="id"/>')" src="<s:property value="compressUrl"/>" width="70px" height="60px"/>
														</td>
														<td>
															<span>&nbsp;<a class="bulidTile" href="javascript:showBulid('<s:property value="id"/>')"><s:property value="name"/></a></span>
															<span>&nbsp;<font class="fontcolor3">地区：<s:property value="disname"/></font></span>
															<span>&nbsp;<font class="fontcolor3">起价：</font><font class="prominentfont"><s:property value="minPrice"/> 元/㎡ </font></span>
														</td>
													</tr>
												</table>
											</li>
											<li id="atBody_t<s:property value="#sta.index"/>" class="selected_li">
											    <div style="width:110px;float:left">
											    <font color="#FF0000" size="3px"><s:property value="#sta.index+1"/></font>&nbsp;<s:property value="name"/> 
											    </div>
											    <div style="width:90px;float:right;padding-right:3px;">
											    <font class="fontcolor6">起价:<s:property value="minPrice"/>元/㎡</font>
											    </div>
											</li>
										</s:if>
										<s:else>
											<li id="atBody_s<s:property value="#sta.index"/>" class="selected_li" style="height: 75px;line-height: 75px;">
												<table width="100%" height="75px" cellpadding="0" cellspacing="0">
													<tr>
														<td align="left"><font color="#FF0000" size="5px"><s:property value="#sta.index+1"/></font></td>
														<td>
														<img   onclick="showBulid('<s:property value="id"/>')" src="<s:property value="compressUrl"/>"   width="70px" height="60px"/>
														</td>
														<td>
															<span>&nbsp;<a class="bulidTile" href="javascript:showBulid('<s:property value="id"/>')"><s:property value="name"/></a></span><br/>
															<span>&nbsp;<font class="fontcolor3">地址：<s:property value="disname"/></font></span><br/>
															<span>&nbsp;<font class="fontcolor3">起价：</font><font class="prominentfont"><s:property value="minPrice"/> 元/㎡ </font></span><br/>
														</td>
													</tr>
												</table>
											</li>
											<li id="atBody_t<s:property value="#sta.index"/>">
												<div style="width:110px;float:left">
											    <font color="#FF0000" size="3px"><s:property value="#sta.index+1"/></font>&nbsp;<s:property value="name"/> 
											    </div>
											    <div style="width:90px;float:right;padding-right:3px;">
											         <font class="fontcolor6">起价:<s:property value="minPrice"/>元/㎡</font>
											    </div>
											</li>
										</s:else>
									</s:iterator>
								</ul>
								</div>
							</div>
	                        
	                      <div class="small_div" >
											<div id="xylHead" class="title_news"><font class="headtitle">&nbsp;&nbsp;推荐二手房</font></div>
											<div class="atBody" align="center" >
												<ul>
												        <li style=" border-bottom: 0px; ">
															<span style="width:100px;"><font class="fonthead">小区</font></span>
														    <span style="width:45px;text-align:center"><font class="fonthead">区域</font></span>
														    <span style="width:50px;text-align:center"><font class="fonthead">万元</font></span>
														</li>
														<s:iterator value="#data.recommendSbList">
																<li style=" border-bottom: 0px;">
																	<span style="width:100px;text-align:left"><a href="javascript:tosecondBd('<s:property value="id"/>','3')" title="<s:property value='respDistrict'/>"><s:property value="respDistrict"/></a></span>
																    <span style="width:45px;text-align:center"><font class="fontcolor3"><s:property value="disname"/></font></span>
																    <span style="width:50px;text-align:center" class="prominentfont"><estateTag:format value='${price}'></estateTag:format></span>
																</li>
														</s:iterator>
											     </ul>
											</div>
						</div>
						
							<div class="small_div h500" >
											<div class="title_news "><font class="headtitle">&nbsp;&nbsp;经纪人信息</font></div>
											<div class="h480">
												<div id="container" class="container">
													<ul>
														<s:iterator value="#data.baseinfoList" >
														<li>
														    <div style="height: 112px; margin:11px 3px 3px 3px; border: 1px dotted #c0c0c0; overflow: hidden;">
											                   <table style="width:100%">
											                      <tr>
											                        <td width="80px" height="105px">
											                        <img style="width:80px;height:105px;border:0px;cursor: pointer;" title="点击进入该经纪人商铺" onclick="toMyStore('<s:property value="id"/>')"  src="imageFloder/<s:property value="headUrl"/>" alt="点击进入该经纪人商铺" />
											                        </td>
											                        <td class="news_title" valign="top">
											                        <br/>
																	 <a href="javascript:toMyStore('<s:property value="id"/>')" ><span title="点击进入<s:property value="realName"/>的商铺"><font class="fontcolor3"><b><s:property value="realName"/></b></font></span><br/></a>
																	<span title="<s:property value="company"/>"><font class="fontcolor3">公司名：<s:property value="company"/></font></span><br/>
																	<span title="<s:property value="disname"/>"><font class="fontcolor3">区域：<s:property value="disname"/></font></span><br/>
																	</td>
											                      </tr>
											                   </table>
											                </div>
														</li>
														</s:iterator>
													</ul>
												</div>
									        </div>
					      </div>
					      <div class="gg2">
					       <img src="resource/images/gg2.gif" >
					      </div>
	      </div>
	      
	       <div class="con_center">
						<div class='img-swith-main'>
											<div class="img-switch">
												<ul id="IMG_UL_LIST_1" >
													<li>
														<img src="resource/images/4.gif" />
													</li>
													<li>
														<img src="resource/images/2.gif" />
													</li>
													<li>
														<img src="resource/images/3.gif" />
													</li>
													<li>
														<img src="resource/images/1.gif" />
													</li>
												</ul>
											</div>
											<div class='img-switch-index'>
												<ul id="IMG_INDEX_UL_LIST_1">
													<li id="li_index_default" style="background-color: #aaa;">
														01
													</li>
													<li>
														02
													</li>
													<li>
														03
													</li>
													<li>
														04
													</li>
												</ul>
											</div>
									<div class='img-switch-clear'>
								</div>
					</div>
						<div class="centerTrend">
											<div id="xylHead" class="title_news w225"><font class="headtitle">&nbsp;&nbsp;地产动态</font></div>
											<div class="estase_news" >
														<s:iterator value="#data.estateNews">
															<div class="news_title">
																&middot; <a href="javascript:window.location.href='news/news_toNewsInfo.shtml?type=7&id=<s:property value='id'/>'"
																	title="<s:property value='title'/>" ><font class="fontcolor3"><s:property value='title' /></font>
																</a>
															</div>
															<div class="clear"></div>
											</s:iterator>
								           </div>
						</div>
							<div class="clear"></div>
				<div class="active mtop">
				   <div id="tuan" class="active_over" onmouseover="tuanshow()">本期团购</div>
				   <div id="te" class="active_out" onmouseover="teshow()">特价 1 套</div>	
				   <input type="hidden" id="tuanEndTime" value="${data.tpSpecialsTuan.endTime}">
					<input type="hidden" id="OneEndTime" value="${data.tpSpecialstOne.endTime}">
				   <div id="tuanmain" class="activemain">
						    <div class="activeimg">
						      <img src="<s:property value='#data.tpSpecialsTuan.imgOne'/>" />
						    </div>
						    <div class="activecontent">
						      <div class="activetitle"><a href="javascript:window.location.href='tuan.shtml'"><s:property value='#data.tpSpecialsTuan.descr'/></a></div>
						      <div class="pd10">
						      <span><font class="fontcolor3">梦房园独家优惠：</font><font class="activefontb"><s:property value='#data.tpSpecialsTuan.specialsMes'/></font></span><br/>
						      <span id="tuan_end_Time"><font class="fontcolor3">报名仅剩有：</font></span>
							  <span id="tuan_str_time"></span><br/>
						      <span class="ac"><img style="height:30px" src="resource/images/tuan/li_can.png" onclick="window.location.href='tuan.shtml'"/></span>
						      </div>
						    </div>
				    		<div class="clear"></div>
				   </div>
				   <div id="temain" class="activemain hid" >
						        <div class="activeimg">
						      <img src="<s:property value='#data.tpSpecialstOne.imgOne'/>" />
						    </div>
						    <div class="activecontent">
						      <div class="activetitle"><a href="javascript:window.location.href='special.shtml'"><s:property value='#data.tpSpecialstOne.descr'/></a></div>
						       <div class="pd10">
						      <span><font class="fontcolor3">梦房园独家优惠：</font><font class="activefontb"><s:property value='#data.tpSpecialstOne.specialsMes'/></font></span><br/>
						      <span id="te_end_Time"><font class="fontcolor3">报名仅剩有：</font></span>
							  <span id="te_str_time"></span><br/>
						      <span class="ac"><img style="height:30px" src="resource/images/tuan/li_can.png"  onclick="window.location.href='special.shtml'"/></span>
						     </div>
						    </div>
				    		<div class="clear"></div>
				   </div>
				</div>
				<div class="centerTrend mtop">
											<div id="xylHead" class="title_news w225"><font class="headtitle">&nbsp;&nbsp;我们一直努力着</font></div>
											<div class="estase_news" >
														<s:iterator value="#data.xylNewsList">
															<div class="news_title">
																&middot; <a href="javascript:window.location.href='news/news_toNewsInfo.shtml?type=7&id=<s:property value='id'/>'"
																	title="<s:property value='title'/>" ><font class="fontcolor3"><s:property value='title' /></font>
																</a>
															</div>
															<div class="clear"></div>
											</s:iterator>
								           </div>
				</div>
				<!-- 打折楼盘 -->
				<div class="discount mtop">
				                  <div class="discountHead"></div>
										<s:iterator value="#data.specialsList" status="status">
										              <div class="sm_show" <s:if test='#status.index % 3 != 0'>style="margin-left: 23px;"</s:if>>
										                <div class="sm_div1"><img onclick="showBulid('<s:property value="id"/>')" src="<s:property  value="compressUrl"/>" /></div>
														<div class="sm_div2">[<s:property  value="disname"/>]<a class="bulidTile" href="javascript:showBulid('<s:property value="id"/>')" title="<s:property value='name'/>"><s:property  value="name"/></a></div>
														<div class="sm_div2"><font class="prominentfont">起价：<estateTag:format value="${minPrice}"/>元/㎡ </font></div>
														<div class="sm_div2"><font class="fontcolor3">折扣：<s:property value="specials"/></font></div>
									                  </div>
									   </s:iterator>
									<div class="clear"></div>
				</div>
				<div class="fr">
				    	<div class="small_div w225" >
											<div class="title_ad"><font class="headtitle">&nbsp;&nbsp;出租房</font></div>
											<div class="atBody "  >
												<ul style="width:210px;  padding-left:6px;">
												        <li style=" border-bottom: 0px;width:210px;">
															<span style="width:90px;"><font class="fonthead">小区</font></span>
														    <span style="width:45px;text-align:center;"><font class="fonthead">区域</font></span>
														    <span style="width:50px;text-align:center;"><font class="fonthead">元/月</font></span>
														</li>
														<s:iterator value="#data.recommendRentList">
																<li style=" border-bottom: 0px;width:210px;">
																	<span style="width:90px;text-align:left"><a href="javascript:tosecondBd('<s:property value="id"/>','4')" title="<s:property value='respDistrict'/>"><s:property value="respDistrict"/></a></span>
																    <span style="width:45px;text-align:center"><s:property value="disname"/></span>
																    <span style="width:50px;text-align:center" class="prominentfont"><estateTag:format value='${price}'></estateTag:format></span>
																</li>
														</s:iterator>
											     </ul>
											</div>
						</div>
						   	
					<div class="gg1">
					    <img src="resource/images/gg1.gif" >
					</div>
					<div class="clear"></div>
				</div>
				 <!-- 最新楼盘 -->
				 <div class="newb mtop">
				 		<div class="newbHead"></div>
										<s:iterator value="#data.bulidList" status="status">
										              <div class="newb_show" <s:if test='#status.index % 3 != 0'>style="margin-left: 37px;"</s:if>>
										                <div class="newb_div1"><img onclick="showBulid('<s:property value="id"/>')" src="<s:property  value="compressUrl"/>" /></div>
														<div class="newb_div3"><font class="fontcolor3">[<s:property  value="disname"/>]</font><a class="bulidTile" href="javascript:showBulid('<s:property value="id"/>')" title="<s:property value='respDistrict'/>"><s:property  value="name"/></a></div>
														<hr class="hr1" />
														<div class="newb_div2"><font class="prominentfont">起价：<s:property value="minPrice"/>元/㎡ </font></div>
														<div class="newb_div2"><font class="fontcolor3">地址：<s:property value="address"/></font></div>
														<div class="newb_div2"><font class="fontcolor3">开盘日期：<s:date name="openDate" format="yyyy-MM-dd"/></font></div>
									                  </div>
									   </s:iterator>
						<div class="clear"></div>
				 
				</div>
				 <!-- 地产行天下 -->
				 <div class="newb mtop">
				 		<div class="dcxtxHead">
				 		    <ul class="red">
								<li><a href="javascript:officeShow()" id="officeA" class="current">
								<span></span>&nbsp;写&nbsp;字&nbsp;楼&nbsp;</a></li>
								<li><a href="javascript:shopShow()" id="shopA">
								<span></span>&nbsp;&nbsp;商&nbsp;&nbsp;铺&nbsp;&nbsp;</a></li>
							</ul>
						</div>
						<div id="officeDiv" >
						<s:subset source="#data.officeList" start="0" count= "6" >
							         <s:iterator status = "counts" > 
										              <div class="newb_show" <s:if test='#counts.index % 3 != 0'>style="margin-left: 37px;"</s:if>>
										                <div class="newb_div1"><img  onclick="showOffice('<s:property value="id"/>',0)" src="<s:property  value="compressUrl"/>" /> 	</div>
														<div class="newb_div3"><font class="fontcolor3">[<s:property  value="disname"/>]</font><a class="bulidTile" href="javascript:showOffice('<s:property value="id"/>',0)" title="<s:property value='title'/>"><s:property  value="title"/></a></div>
														<hr class="hr1" />
														<div class="newb_div2"><font class="prominentfont"><estateTag:convertCode codeType="租金售价" code="${flag}"></estateTag:convertCode>：<estateTag:format value='${price}' /><estateTag:convertCode codeType="租售单位" code="${flag}" /></font></div>
														<div class="newb_div2"><font class="fontcolor3">地址：<s:property value="address"/></font></div>
														<div class="newb_div2"><font class="fontcolor3">发布日期：<s:date name="createTime" format="yyyy-MM-dd"/></font></div>
									                  </div>
									   </s:iterator>
						</s:subset>
						</div>	
						<div id="shopDiv" class="hid">
							<s:subset source="#data.shopList" start="0" count= "6" >
							         <s:iterator status = "counts" > 
										              <div class="newb_show" <s:if test='#counts.index % 3 != 0'>style="margin-left: 37px;"</s:if>>
										                <div class="newb_div1"><img onclick="showdcxtx('<s:property value="id"/>',1)" src="<s:property  value="compressUrl"/>" /></div>
														<div class="newb_div3"><font class="fontcolor3">[<s:property  value="disname"/>]</font><a class="bulidTile" href="javascript:showOffice('<s:property value="id"/>',0)" title="<s:property value='respDistrict'/>"><s:property  value="name"/></a></div>
														<hr class="hr1" />
														<div class="newb_div2"><font class="prominentfont"><estateTag:convertCode codeType="租金售价" code="${flag}"></estateTag:convertCode>：<estateTag:format value='${bursary}'></estateTag:format> <estateTag:convertCode codeType="租售单位" code="${flag}" /> </font></div>
														<div class="newb_div2"><font class="fontcolor3">地址：<s:property value="address"/></font></div>
														<div class="newb_div2"><font class="fontcolor3">发布日期：<s:date name="createTime" format="yyyy-MM-dd"/></font></div>
									                  </div>
									   </s:iterator>
						</s:subset>
						</div>		   
						<div class="clear"></div>
				</div>
            </div>
	    </div>
	    
	<div class="clear">
	</div>  
	  <!--liu cheng start -->
            <div class="clearfix">
            	<img style="width:960px" src="resource/images/zhifu.jpg">
            </div>
            
            <!--liu cheng end -->
	
	
	<div style="padding-top: 15px;text-algin:center;">
		<jsp:include page="copyright.jsp"/>
		</div>
	</div>
	
	
</body>
<!-- 倒计时 -->
<script type="text/javascript" src="resource/js/countdown.js"></script>
<!-- 经纪人滚动 -->
<script type="text/javascript" src="resource/js/mfy.auto.roll.js"></script>
</html>