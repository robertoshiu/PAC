
<%@ page import="pac.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-customer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list customer">
			
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="customer.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label">
							<g:radioGroup name="type" values="[0,1,2]" value="${customerInstance?.type}" disabled="true"
								labels='["${message(code: 'customer.type.0.label')}","${message(code: 'customer.type.1.label')}","${message(code: 'customer.type.2.label')}"]' >
								${it.radio} ${it.label}
							</g:radioGroup>
						</span>
					
				</li>
			
				<g:if test="${customerInstance?.custNo}">
				<li class="fieldcontain">
					<span id="custNo-label" class="property-label"><g:message code="customer.custNo.label" default="Cust No" /></span>
					
						<span class="property-value" aria-labelledby="custNo-label"><g:fieldValue bean="${customerInstance}" field="custNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="customer.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${customerInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.division}">
				<li class="fieldcontain">
					<span id="division-label" class="property-label"><g:message code="customer.division.label" default="Division" /></span>
					
						<span class="property-value" aria-labelledby="division-label"><g:fieldValue bean="${customerInstance}" field="division"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.section}">
				<li class="fieldcontain">
					<span id="section-label" class="property-label"><g:message code="customer.section.label" default="Section" /></span>
					
						<span class="property-value" aria-labelledby="section-label"><g:fieldValue bean="${customerInstance}" field="section"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="customer.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${customerInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.fax}">
				<li class="fieldcontain">
					<span id="fax-label" class="property-label"><g:message code="customer.fax.label" default="Fax" /></span>
					
						<span class="property-value" aria-labelledby="fax-label"><g:fieldValue bean="${customerInstance}" field="fax"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="customer.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${customerInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="customer.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${customerInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.contact}">
				<li class="fieldcontain">
					<span id="contact-label" class="property-label"><g:message code="customer.contact.label" default="Contact" /></span>
					
						<span class="property-value" aria-labelledby="contact-label"><g:fieldValue bean="${customerInstance}" field="contact"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="customer.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${customerInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.createDate}">
				<li class="fieldcontain">
					<span id="createDate-label" class="property-label"><g:message code="customer.createDate.label" default="Create Date" /></span>
					
						<span class="property-value" aria-labelledby="createDate-label"><g:formatDate timeZone ="GMT+8" date="${customerInstance?.createDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="customer.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:checkBox name="enabled" value="${customerInstance?.enabled}" disabled="true" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.remark}">
				<li class="fieldcontain">
					<span id="remark-label" class="property-label"><g:message code="customer.remark.label" default="Remark" /></span>
					
						<span class="property-value" aria-labelledby="remark-label"><g:fieldValue bean="${customerInstance}" field="remark"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${customerInstance?.id}" />
					<g:link class="edit" action="edit" id="${customerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
