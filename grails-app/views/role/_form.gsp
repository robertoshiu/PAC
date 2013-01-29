<%@ page import="pac.Role" %>



<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="role.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${roleInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="role.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${roleInstance?.description}" />
</div>

<div class="fieldcontain">
	<label for="functions">
		<g:message code="adminUser.functions.label" default="Functions" />
		
	</label>
	<table>
		<tr>
	<td><g:checkBox name="functions" value="PERM_NEWS" checked="${roleInstance?.functions?.contains('PERM_NEWS')}" />最新消息</td>
	<td><g:checkBox name="functions" value="PERM_EXPERT" checked="${roleInstance?.functions?.contains('PERM_EXPERT')}" />作者簡介</td>
	<td><g:checkBox name="functions" value="PERM_CUST" checked="${roleInstance?.functions?.contains('PERM_CUST')}" />客戶管理</td>
	<td><g:checkBox name="functions" value="PERM_FAQ" checked="${roleInstance?.functions?.contains('PERM_FAQ')}" />Q&A管理</td>
		</tr>
		<tr>
	<td><g:checkBox name="functions" value="PERM_EXAM" checked="${roleInstance?.functions?.contains('PERM_EXAM')}" />測驗管理</td>
	<td><g:checkBox name="functions" value="PERM_QUIZ" checked="${roleInstance?.functions?.contains('PERM_QUIZ')}" />問卷管理</td>
	<td><g:checkBox name="functions" value="PERM_RPT" checked="${roleInstance?.functions?.contains('PERM_RPT')}" />報表管理</td>
	<td><g:checkBox name="functions" value="PERM_AUTH" checked="${roleInstance?.functions?.contains('PERM_AUTH')}" />權限控管</td>
		</tr>
	</table>
</div>

