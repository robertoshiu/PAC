
<%@ page import="pac.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-question" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="type" title="${message(code: 'question.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="correctAnswer" title="${message(code: 'question.correctAnswer.label', default: 'Correct Answer')}" />
										
						<g:sortableColumn property="quiz" title="${message(code: 'question.quiz.label', default: 'Quiz')}" />
					
						<g:sortableColumn property="value" title="${message(code: 'question.value.label', default: 'Value')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${questionInstanceList}" status="i" var="questionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${questionInstance.id}">
							<g:if test="${questionInstance.type == 0}">${message(code: 'question.type.level.label')}</g:if>
							<g:elseif test="${questionInstance.type == 1}">${message(code: 'question.type.single.label')}</g:elseif>
							<g:elseif test="${questionInstance.type == 2}">${message(code: 'question.type.multiple.label')}</g:elseif>
							<g:elseif test="${questionInstance.type == 3}">${message(code: 'question.type.matrix.label')}</g:elseif>
						</g:link></td>
					
						<td>
							${fieldValue(bean: questionInstance, field: "correctAnswer")}
						</td>
					
						<td>${questionInstance?.quiz}</td>
					
						<td>${fieldValue(bean: questionInstance, field: "value")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${questionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
