
<%@ page import="pac.Author" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-author" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-author" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'author.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="ename" title="${message(code: 'author.ename.label', default: 'Ename')}" />
					
						<g:sortableColumn property="domain" title="${message(code: 'author.domain.label', default: 'Domain')}" />
					
						<g:sortableColumn property="subject" title="${message(code: 'author.subject.label', default: 'Subject')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${authorInstanceList}" status="i" var="authorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${authorInstance.id}">${fieldValue(bean: authorInstance, field: "name")}</g:link></td>
										
						<td>${fieldValue(bean: authorInstance, field: "ename")}</td>
					
						<td>${fieldValue(bean: authorInstance, field: "domain")}</td>
					
						<td>${fieldValue(bean: authorInstance, field: "subject")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${authorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
