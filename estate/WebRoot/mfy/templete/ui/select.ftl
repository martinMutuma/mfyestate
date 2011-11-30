<select<#rt/>
<#include "/${uiTempleteUrl}/element-common.ftl" />
<#if multiple?default(false)>
 multiple="multiple"<#rt/>
</#if>
<#include "/${uiTempleteUrl}/scripting-events.ftl" />
><#rt/>
<#if (dynamicAttributes.headValue?exists)>
<option value="${dynamicAttributes.headKey?default("")?trim?html}"><#rt/>
${dynamicAttributes.headValue?trim?html}<#rt/>
</option><#rt/>
</#if>
<#if dynamicAttributes.data?exists>
<#list dynamicAttributes.data?keys as key>
<#assign text = dynamicAttributes.data[key]>
<#if text?exists>
 <option value="${key?trim}"<#rt/> 
<#if value?exists>
<#if value==key>
 selected = "selected"<#rt/> 
 </#if>
</#if>
><#rt/>
${text?trim}<#rt/>
</option>
</#if>
</#list>
</#if>
</select>
