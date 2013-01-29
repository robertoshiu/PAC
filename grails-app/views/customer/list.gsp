
<%@ page import="pac.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-customer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="custNo" title="${message(code: 'customer.custNo.label', default: 'Cust No')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'customer.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'customer.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="division" title="${message(code: 'customer.division.1.label', default: 'Division')}" />
					
						<g:sortableColumn property="contact" title="${message(code: 'customer.contact.label', default: 'Contact')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'customer.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="createDate" title="${message(code: 'customer.createDate.label', default: 'Create Date')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'customer.enabled.label', default: 'Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${customerInstanceList}" status="i" var="customerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "custNo")}</g:link></td>
					
						<td>
							<g:if test="${customerInstance.type == 0}">${message(code: 'customer.type.0.label')}</g:if>
							<g:elseif test="${customerInstance.type == 1}">${message(code: 'customer.type.1.label')}</g:elseif>
							<g:else>${message(code: 'customer.type.2.label')}</g:else>
						</td>
					
						<td>${fieldValue(bean: customerInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: customerInstance, field: "division")}</td>
					
						<td>${fieldValue(bean: customerInstance, field: "contact")}</td>
					
						<td>${fieldValue(bean: customerInstance, field: "email")}</td>
					
						<td><g:formatDate timeZone ="GMT+8" date="${customerInstance.createDate}" /></td>
						
						<td><g:checkBox name="aBooleanValue" value="${customerInstance.enabled}" disabled="true" /></td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${customerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
