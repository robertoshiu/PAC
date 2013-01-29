
<%@ page import="pac.Order" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-order" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-order" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list order">
			
				<g:if test="${orderInstance?.orderNo}">
				<li class="fieldcontain">
					<span id="orderNo-label" class="property-label"><g:message code="order.orderNo.label" default="Order No" /></span>
					
						<span class="property-value" aria-labelledby="orderNo-label"><g:fieldValue bean="${orderInstance}" field="orderNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.agreeNo}">
				<li class="fieldcontain">
					<span id="agreeNo-label" class="property-label"><g:message code="order.agreeNo.label" default="Agree No" /></span>
					
						<span class="property-value" aria-labelledby="agreeNo-label"><g:fieldValue bean="${orderInstance}" field="agreeNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.exam}">
				<li class="fieldcontain">
					<span id="exam-label" class="property-label"><g:message code="order.exam.label" default="Exam" /></span>
					
						<span class="property-value" aria-labelledby="exam-label"><g:link controller="exam" action="show" id="${orderInstance?.exam?.id}">${orderInstance?.exam?.name}</g:link></span>
					
				</li>
				</g:if>
			
				<li class="fieldcontain">
					<span id="examType-label" class="property-label"><g:message code="order.examType.label" default="Exam Type" /></span>
					
						<span class="property-value" aria-labelledby="examType-label">
						<g:radioGroup name="examType" values="[0,1,2]" value="${orderInstance.examType}" disabled="true"
							labels='["${message(code: 'order.examType.0.label')}","${message(code: 'order.examType.1.label')}","${message(code: 'order.examType.2.label')}"]' >
							${it.radio} ${it.label}
						</g:radioGroup>
						</span>
					
				</li>

				<g:if test="${orderInstance?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="order.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${orderInstance}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.emailCount}">
				<li class="fieldcontain">
					<span id="emailCount-label" class="property-label"><g:message code="order.emailCount.label" default="Email Count" /></span>
					
						<span class="property-value" aria-labelledby="emailCount-label"><g:fieldValue bean="${orderInstance}" field="emailCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.closeCount}">
				<li class="fieldcontain">
					<span id="closeCount-label" class="property-label"><g:message code="order.closeCount.label" default="Close Count" /></span>
					
						<span class="property-value" aria-labelledby="closeCount-label"><g:fieldValue bean="${orderInstance}" field="closeCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="order.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate timeZone ="GMT+8" format="yyyy-MM-dd" date="${orderInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.dueDate}">
				<li class="fieldcontain">
					<span id="dueDate-label" class="property-label"><g:message code="order.dueDate.label" default="Due Date" /></span>
					
						<span class="property-value" aria-labelledby="dueDate-label"><g:formatDate timeZone ="GMT+8" format="yyyy-MM-dd" date="${orderInstance?.dueDate}" /></span>
					
				</li>
				</g:if>
			
				<li class="fieldcontain">
					<span id="printType-label" class="property-label"><g:message code="order.printType.label" default="Print Type" /></span>
					
						<span class="property-value" aria-labelledby="printType-label">
						<g:radioGroup name="printType" values="[0,1,2]" value="${orderInstance.printType}" disabled="true"
							labels='["${message(code: 'order.printType.0.label')}","${message(code: 'order.printType.1.label')}","${message(code: 'order.printType.2.label')}"]' >
							${it.radio} ${it.label}
						</g:radioGroup>
						</span>
					
				</li>
			
				<g:if test="${orderInstance?.createDate}">
				<li class="fieldcontain">
					<span id="createDate-label" class="property-label"><g:message code="order.createDate.label" default="Create Date" /></span>
					
						<span class="property-value" aria-labelledby="createDate-label"><g:formatDate timeZone ="GMT+8" date="${orderInstance?.createDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.creator}">
				<li class="fieldcontain">
					<span id="creator-label" class="property-label"><g:message code="order.creator.label" default="Creator" /></span>
					
						<span class="property-value" aria-labelledby="creator-label"><g:fieldValue bean="${orderInstance}" field="creator"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.customer}">
				<li class="fieldcontain">
					<span id="customer-label" class="property-label"><g:message code="customer.custNo.label" default="Customer Number" /></span>
					
						<span class="property-value" aria-labelledby="customer-label"><g:link controller="customer" action="show" id="${orderInstance?.customer?.id}">${orderInstance?.customer?.custNo}</g:link></span>
					
				</li>
				</g:if>
			
				<li class="fieldcontain">
					<span id="readable-label" class="property-label"><g:message code="order.readable.label" default="Readable" /></span>
					
						<span class="property-value" aria-labelledby="readable-label"><g:checkBox name="enabled" value="${orderInstance?.readable}" disabled="true" /></span>
					
				</li>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${orderInstance?.id}" />
					<g:link class="edit" action="edit" id="${orderInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
