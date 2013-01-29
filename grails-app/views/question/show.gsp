
<%@ page import="pac.Question" %>
<!DOCTYPE html>
<g:set var="exams" value="${questionInstance?.exams()}" />

<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-question" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list question">
			
				<g:if test="${questionInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="question.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label">
							<g:radioGroup name="type" values="[0,1,2,3]" value="${questionInstance.type}" disabled="true"
								labels='["${message(code: 'question.type.level.label')}","${message(code: 'question.type.single.label')}","${message(code: 'question.type.multiple.label')}","${message(code: 'question.type.matrix.label')}"]' >
								${it.radio} ${it.label}
							</g:radioGroup>
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.quiz}">
				<li class="fieldcontain">
					<span id="quiz-label" class="property-label"><g:message code="question.quiz.label" default="Quiz" /></span>
					
						<span class="property-value" aria-labelledby="quiz-label">${questionInstance.quiz}</span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.imageQuiz}">
				<li class="fieldcontain">
					<span id="imageQuiz-label" class="property-label"><g:message code="question.imageQuiz.label" default="Image Quiz" /></span>
					
						<span class="property-value" aria-labelledby="imageQuiz-label">
							<img src="<g:createLink controller='question' action='renderImage' id='${questionInstance.id}'/>" /><br>
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.options}">
				<li class="fieldcontain">
					<span id="options-label" class="property-label"><g:message code="question.options.label" default="Options" /></span>
					
						<span class="property-value" aria-labelledby="options-label">
							<ol>
								<g:each in="${questionInstance.options}">
									<li>${it}</li>
								</g:each>
							</ol>
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.correctAnswer}">
				<li class="fieldcontain">
					<span id="correctAnswer-label" class="property-label"><g:message code="question.correctAnswer.label" default="Correct Answer" /></span>
					
						<span class="property-value" aria-labelledby="correctAnswer-label"><g:fieldValue bean="${questionInstance}" field="correctAnswer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.value}">
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="question.value.label" default="Value" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${questionInstance}" field="value"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${exams}">
				<li class="fieldcontain">
					<span id="exams-label" class="property-label"><g:message code="question.exams.label" default="Exams" /></span>
					
						<g:each in="${exams}" var="a">
						<span class="property-value" aria-labelledby="exams-label"><g:link controller="exam" action="show" id="${a.id}">${a?.name}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${questionInstance?.id}" />
					<g:link class="edit" action="edit" id="${questionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
