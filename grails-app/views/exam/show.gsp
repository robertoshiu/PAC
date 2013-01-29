
<%@ page import="pac.Exam" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'exam.label', default: 'Exam')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-exam" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-exam" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list exam">
			
				<g:if test="${examInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="exam.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${examInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${examInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="exam.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${examInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="exam.guideType.label" default=" Guide Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label">
							<g:radioGroup name="guideType" values="[0,1,2]" value="${examInstance.guideType}" disabled="true"
								labels='["${message(code: 'exam.guideType.none.label')}","${message(code: 'exam.guideType.text.label')}","${message(code: 'exam.guideType.image.label')}"]' >
								${it.radio} ${it.label}
							</g:radioGroup>
						</span>
					
				</li>
			
				<g:if test="${examInstance?.guideline}">
				<li class="fieldcontain">
					<span id="guideline-label" class="property-label"><g:message code="exam.guideline.label" default="Guideline" /></span>
					
						<span class="property-value" aria-labelledby="guideline-label">${examInstance.guideline}</span>
					
				</li>
				</g:if>
			
				<g:if test="${examInstance?.imageGuide}">
				<li class="fieldcontain">
					<span id="imageGuide-label" class="property-label"><g:message code="exam.imageGuide.label" default="Image Guide" /></span>
					
						<span class="property-value" aria-labelledby="imageGuide-label">
							<img src="<g:createLink controller='exam' action='renderImage' id='${examInstance.id}'/>" /><br>
						</span>
				</li>
				</g:if>
			
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="exam.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:checkBox name="enabled" value="${examInstance?.enabled}" disabled="true" /></span>
					
				</li>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${examInstance?.id}" />
					<g:link class="edit" action="edit" id="${examInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
