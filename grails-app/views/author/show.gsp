
<%@ page import="pac.Author" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-author" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-author" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list author">
			
				<g:if test="${authorInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="author.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${authorInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${authorInstance?.ename}">
				<li class="fieldcontain">
					<span id="ename-label" class="property-label"><g:message code="author.ename.label" default="Ename" /></span>
					
						<span class="property-value" aria-labelledby="ename-label"><g:fieldValue bean="${authorInstance}" field="ename"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${authorInstance?.photo}">
				<li class="fieldcontain">
					<span id="photo-label" class="property-label"><g:message code="author.photo.label" default="Photo" /></span>
					
						<span class="property-value" aria-labelledby="photo-label">
							<img src="<g:createLink controller='author' action='renderPhoto' id='${authorInstance.id}'/>" /><br>
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${authorInstance?.subject}">
				<li class="fieldcontain">
					<span id="subject-label" class="property-label"><g:message code="author.subject.label" default="Subject" /></span>
					
						<span class="property-value" aria-labelledby="subject-label"><g:fieldValue bean="${authorInstance}" field="subject"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${authorInstance?.domain}">
				<li class="fieldcontain">
					<span id="domain-label" class="property-label"><g:message code="author.domain.label" default="Domain" /></span>
					
						<span class="property-value" aria-labelledby="domain-label"><g:fieldValue bean="${authorInstance}" field="domain"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${authorInstance?.career}">
				<li class="fieldcontain">
					<span id="career-label" class="property-label"><g:message code="author.career.label" default="Career" /></span>
					
						<span class="property-value" aria-labelledby="career-label">${authorInstance.career}</span>
					
				</li>
				</g:if>
			
				<g:if test="${authorInstance?.diploma}">
				<li class="fieldcontain">
					<span id="diploma-label" class="property-label"><g:message code="author.diploma.label" default="Diploma" /></span>
					
						<span class="property-value" aria-labelledby="diploma-label">${authorInstance.diploma}</span>
					
				</li>
				</g:if>
			
				<g:if test="${authorInstance?.wording}">
				<li class="fieldcontain">
					<span id="wording-label" class="property-label"><g:message code="author.wording.label" default="Wording" /></span>
					
						<span class="property-value" aria-labelledby="wording-label">${authorInstance.wording}</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${authorInstance?.id}" />
					<g:link class="edit" action="edit" id="${authorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
