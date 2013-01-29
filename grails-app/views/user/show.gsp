
<%@ page import="pac.User" %>
<!DOCTYPE html>
<g:set var="functions" value="${userInstance?.authorities()}" />
<g:set var="roles" value="${userInstance?.roles()}" />
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>
					
				</li>
				</g:if>
						
				<g:if test="${userInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="user.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${userInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.createDate}">
				<li class="fieldcontain">
					<span id="createDate-label" class="property-label"><g:message code="user.createDate.label" default="Create Date" /></span>
					
						<span class="property-value" aria-labelledby="createDate-label"><g:formatDate timeZone ="GMT+8" date="${userInstance?.createDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.lastLogin}">
				<li class="fieldcontain">
					<span id="lastLogin-label" class="property-label"><g:message code="user.lastLogin.label" default="Last Login" /></span>
					
						<span class="property-value" aria-labelledby="lastLogin-label"><g:formatDate timeZone ="GMT+8" date="${userInstance?.lastLogin}" /></span>
					
				</li>
				</g:if>
						
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="user.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:checkBox name="aBooleanValue" value="${userInstance?.enabled}" disabled="true" /></span>
					
				</li>
			
				<g:if test="${roles}">
				<li class="fieldcontain">
					<span id="authorities-label" class="property-label"><g:message code="user.roles.label" default="Roles" /></span>
					
						<g:each in="${roles}" var="a">
						<span class="property-value" aria-labelledby="authorities-label"><g:link controller="role" action="show" id="${a.id}">${a?.description}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${functions}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="user.functions.label" default="Functions" /></span>
					
	<table>
		<tr>
	<td><g:checkBox name="functions" value="PERM_NEWS" disabled="true" checked="${functions?.contains('PERM_NEWS')}" />最新消息</td>
	<td><g:checkBox name="functions" value="PERM_EXPERT" disabled="true" checked="${functions?.contains('PERM_EXPERT')}" />作者簡介</td>
	<td><g:checkBox name="functions" value="PERM_CUST" disabled="true" checked="${functions?.contains('PERM_CUST')}" />客戶管理</td>
	<td><g:checkBox name="functions" value="PERM_FAQ" disabled="true" checked="${functions?.contains('PERM_FAQ')}" />Q&A管理</td>
		</tr>
		<tr>
	<td><g:checkBox name="functions" value="PERM_EXAM" disabled="true" checked="${functions?.contains('PERM_EXAM')}" />測驗管理</td>
	<td><g:checkBox name="functions" value="PERM_QUIZ" disabled="true" checked="${functions?.contains('PERM_QUIZ')}" />問卷管理</td>
	<td><g:checkBox name="functions" value="PERM_RPT" disabled="true" checked="${functions?.contains('PERM_RPT')}" />報表管理</td>
	<td><g:checkBox name="functions" value="PERM_AUTH" disabled="true" checked="${functions?.contains('PERM_AUTH')}" />權限控管</td>
		</tr>
	</table>
					
				</li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userInstance?.id}" />
					<g:link class="edit" action="edit" id="${userInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
