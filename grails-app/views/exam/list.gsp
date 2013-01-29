
<%@ page import="pac.Exam" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'exam.label', default: 'Exam')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-exam" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-exam" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'exam.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'exam.name.label', default: 'Name')}" />

						<g:sortableColumn property="guideType" title="${message(code: 'exam.guideType.label', default: 'Guide Type')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'exam.enabled.label', default: 'Enabled')}" />
										
					</tr>
				</thead>
				<tbody>
				<g:each in="${examInstanceList}" status="i" var="examInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${examInstance.id}">${fieldValue(bean: examInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: examInstance, field: "name")}</td>
					
						<td>
							<g:if test="${examInstance.guideType == 1}">${message(code: 'exam.guideType.text.label')}</g:if>
							<g:elseif test="${examInstance.guideType == 2}">${message(code: 'exam.guideType.image.label')}</g:elseif>
							<g:else>${message(code: 'exam.guideType.none.label')}</g:else>
						</td>

						<td><g:checkBox name="enabled" value="${examInstance.enabled}" disabled="true" /></td>
											
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${examInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
