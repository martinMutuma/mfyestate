<select>
<#if data?exists>
	<#list data?keys as keyValue>
		<#assign text = data[keyValue]>
		<#if text?exists>
		<option value="${keyValue?html}">
			${text?html}
		</option>
		</#if>
	</#list>
</#if>
</select>