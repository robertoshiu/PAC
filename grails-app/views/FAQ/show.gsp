
<%@ page import="pac.FAQ" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'FAQ.label', default: 'FAQ')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-FAQ" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-FAQ" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list FAQ">
			
				<g:if test="${FAQInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="FAQ.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label">
							<g:radioGroup name="type" values="[1,2,3]" value="${FAQInstance.type}" disabled="true"
								labels='["${message(code: 'FAQ.type.1.label')}","${message(code: 'FAQ.type.2.label')}","${message(code: 'FAQ.type.3.label')}"]' >
								${it.radio} ${it.label}
							</g:radioGroup>
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${FAQInstance?.topic}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="FAQ.topic.label" default="Topic" /></span>
					
						<span class="property-value" aria-labelledby="topic-label"><g:fieldValue bean="${FAQInstance}" field="topic"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${FAQInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="FAQ.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${FAQInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${FAQInstance?.createDate}">
				<li class="fieldcontain">
					<span id="createDate-label" class="property-label"><g:message code="FAQ.createDate.label" default="Create Date" /></span>
					
						<span class="property-value" aria-labelledby="createDate-label"><g:formatDate timeZone ="GMT+8" date="${FAQInstance?.createDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${FAQInstance?.updateDate}">
				<li class="fieldcontain">
					<span id="updateDate-label" class="property-label"><g:message code="FAQ.updateDate.label" default="Update Date" /></span>
					
						<span class="property-value" aria-labelledby="updateDate-label"><g:formatDate timeZone ="GMT+8" date="${FAQInstance?.updateDate}" /></span>
					
				</li>
				</g:if>
			
				<li class="fieldcontain">
					<span id="pulished-label" class="property-label"><g:message code="FAQ.pulished.label" default="Pulished" /></span>
					
						<span class="property-value" aria-labelledby="pulished-label"><g:checkBox name="pulished" value="${FAQInstance?.pulished}" disabled="true" /></span>
					
				</li>
			
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="FAQ.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:checkBox name="enabled" value="${FAQInstance?.enabled}" disabled="true" /></span>
					
				</li>
				
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${FAQInstance?.id}" />
					<g:link class="edit" action="edit" id="${FAQInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
