<%@ page import="pac.User" %>
<%@ page import="pac.Role" %>

<g:set var="functions" value="${userInstance?.authorities()}" />

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${userInstance?.username}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:passwordField name="password" value="${userInstance?.password}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${userInstance?.email}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${userInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />
</div>

<div class="fieldcontain">
	<label for="authorities">
		<g:message code="user.roles.label" default="Authorities" />
		
	</label>
	<g:select name="roles" from="${Role.list()}" optionKey="id" optionValue="description" multiple="true" size="5" value="${userInstance?.roles}" class="many-to-many"/>
</div>

<div class="fieldcontain">
	<label for="functions">
		<g:message code="user.functions.label" default="Functions" />
		
	</label>
	<table>
		<tr>
	<td><g:checkBox name="functions" value="PERM_NEWS" checked="${functions?.contains('PERM_NEWS')}" />最新消息</td>
	<td><g:checkBox name="functions" value="PERM_EXPERT" checked="${functions?.contains('PERM_EXPERT')}" />作者簡介</td>
	<td><g:checkBox name="functions" value="PERM_CUST" checked="${functions?.contains('PERM_CUST')}" />客戶管理</td>
	<td><g:checkBox name="functions" value="PERM_FAQ" checked="${functions?.contains('PERM_FAQ')}" />Q&A管理</td>
		</tr>
		<tr>
	<td><g:checkBox name="functions" value="PERM_EXAM" checked="${functions?.contains('PERM_EXAM')}" />測驗管理</td>
	<td><g:checkBox name="functions" value="PERM_QUIZ" checked="${functions?.contains('PERM_QUIZ')}" />問卷管理</td>
	<td><g:checkBox name="functions" value="PERM_RPT" checked="${functions?.contains('PERM_RPT')}" />報表管理</td>
	<td><g:checkBox name="functions" value="PERM_AUTH" checked="${functions?.contains('PERM_AUTH')}" />權限控管</td>
		</tr>
	</table>
</div>

