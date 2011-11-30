<#if dynamicAttributes.data?exists>
<#list dynamicAttributes.data?keys as key>
<#assign text = dynamicAttributes.data[key]>
<#if text?exists>
<label><#rt/>
<input type="radio"<#rt/>
<#include "/${uiTempleteUrl}/element-common.ftl" /><#rt/> 
 <#include "/${uiTempleteUrl}/scripting-events.ftl" /><#rt/>
value="${key?trim}"<#rt/>
<#if value?exists>
<#if value==key>
 checked="checked"<#rt/>
</#if>
</#if>
><#rt/>${text?trim}
</label>
</#if>
</#list>
</#if>
