
<%@ page import="pac.Role" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-role" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-role" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list role">
			
				<g:if test="${roleInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="role.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${roleInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${roleInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="role.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${roleInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${roleInstance?.functions}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="role.functions.label" default="Functions" /></span>
					
	<table>
		<tr>
	<td><g:checkBox name="functions" value="PERM_NEWS" disabled="true" checked="${roleInstance?.functions?.contains('PERM_NEWS')}" />最新消息</td>
	<td><g:checkBox name="functions" value="PERM_EXPERT" disabled="true" checked="${roleInstance?.functions?.contains('PERM_EXPERT')}" />作者簡介</td>
	<td><g:checkBox name="functions" value="PERM_CUST" disabled="true" checked="${roleInstance?.functions?.contains('PERM_CUST')}" />客戶管理</td>
	<td><g:checkBox name="functions" value="PERM_FAQ" disabled="true" checked="${roleInstance?.functions?.contains('PERM_FAQ')}" />Q&A管理</td>
		</tr>
		<tr>
	<td><g:checkBox name="functions" value="PERM_EXAM" disabled="true" checked="${roleInstance?.functions?.contains('PERM_EXAM')}" />測驗管理</td>
	<td><g:checkBox name="functions" value="PERM_QUIZ" disabled="true" checked="${roleInstance?.functions?.contains('PERM_QUIZ')}" />問卷管理</td>
	<td><g:checkBox name="functions" value="PERM_RPT" disabled="true" checked="${roleInstance?.functions?.contains('PERM_RPT')}" />報表管理</td>
	<td><g:checkBox name="functions" value="PERM_AUTH" disabled="true" checked="${roleInstance?.functions?.contains('PERM_AUTH')}" />權限控管</td>
		</tr>
	</table>
					
				</li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${roleInstance?.id}" />
					<g:link class="edit" action="edit" id="${roleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
