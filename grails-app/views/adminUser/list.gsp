
<%@ page import="pac.AdminUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'adminUser.label', default: 'AdminUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-adminUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-adminUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'adminUser.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="createDate" title="${message(code: 'adminUser.createDate.label', default: 'Create Date')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'adminUser.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="lastLogin" title="${message(code: 'adminUser.lastLogin.label', default: 'Last Login')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${adminUserInstanceList}" status="i" var="adminUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${adminUserInstance.id}">${fieldValue(bean: adminUserInstance, field: "name")}</g:link></td>
					
						<td><g:formatDate date="${adminUserInstance.createDate}" /></td>
					
						<td>${fieldValue(bean: adminUserInstance, field: "email")}</td>
					
						<td><g:formatDate date="${adminUserInstance.lastLogin}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${adminUserInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
