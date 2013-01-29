
<%@ page import="pac.FAQ" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'FAQ.label', default: 'FAQ')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-FAQ" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-FAQ" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="topic" title="${message(code: 'FAQ.topic.label', default: 'Topic')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'FAQ.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="createDate" title="${message(code: 'FAQ.createDate.label', default: 'Create Date')}" />
					
						<g:sortableColumn property="updateDate" title="${message(code: 'FAQ.updateDate.label', default: 'Update Date')}" />
					
						<g:sortableColumn property="pulished" title="${message(code: 'FAQ.pulished.label', default: 'Pulished')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'FAQ.enabled.label', default: 'Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${FAQInstanceList}" status="i" var="FAQInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${FAQInstance.id}">${fieldValue(bean: FAQInstance, field: "topic")}</g:link></td>
					
						<td>
							<g:if test="${FAQInstance.type == 2}">${message(code: 'FAQ.type.2.label')}</g:if>
							<g:elseif test="${FAQInstance.type == 3}">${message(code: 'FAQ.type.3.label')}</g:elseif>
							<g:else>${message(code: 'FAQ.type.1.label')}</g:else>
						</td>

						<td><g:formatDate timeZone ="GMT+8" date="${FAQInstance.createDate}" /></td>

						<td><g:formatDate timeZone ="GMT+8" date="${FAQInstance.updateDate}" /></td>
					
						<td><g:checkBox name="pulished" value="${FAQInstance.pulished}" disabled="true" /></td>					
					
						<td><g:checkBox name="enabled" value="${FAQInstance.enabled}" disabled="true" /></td>
						
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${FAQInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
