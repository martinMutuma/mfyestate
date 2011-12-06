<#--
/*
 * $Id: Action.java 502296 2007-02-01 17:33:39Z niallp $
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
-->
<#if onclick?exists>
 onclick="${parameters.onclick?html}"<#rt/>
</#if>
<#if ondblclick?exists>
 ondblclick="${ondblclick?html}"<#rt/>
</#if>
<#if onmousedown?exists>
 onmousedown="${onmousedown?html}"<#rt/>
</#if>
<#if onmouseup?exists>
 onmouseup="${onmouseup?html}"<#rt/>
</#if>
<#if onmouseover?exists>
 onmouseover="${onmouseover?html}"<#rt/>
</#if>
<#if onmousemove?exists>
 onmousemove="${onmousemove?html}"<#rt/>
</#if>
<#if onmouseout?exists>
 onmouseout="${onmouseout?html}"<#rt/>
</#if>
<#if onfocus?exists>
 onfocus="${onfocus?html}"<#rt/>
</#if>
<#if onblur?exists>
 onblur="${onblur?html}"<#rt/>
</#if>
<#if onkeypress?exists>
 onkeypress="${onkeypress?html}"<#rt/>
</#if>
<#if onkeydown?exists>
 onkeydown="${onkeydown?html}"<#rt/>
</#if>
<#if onkeyup?exists>
 onkeyup="${onkeyup?html}"<#rt/>
</#if>
<#if onselect?exists>
 onselect="${onselect?html}"<#rt/>
</#if>
<#if onchange?exists>
 onchange="${onchange?html}"<#rt/>
</#if>