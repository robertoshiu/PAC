
<%@ page import="pac.Order" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
		<g:set var="custName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-order" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" controller="customer" action="list"><g:message code="default.list.label" args="[custName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-order" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="orderNo" title="${message(code: 'order.orderNo.label', default: 'Order No')}" />

						<g:sortableColumn property="agreeNo" title="${message(code: 'order.agreeNo.label', default: 'Agree No')}" />
					
						<g:sortableColumn property="exam.code" title="${message(code: 'exam.code.label', default: 'Exam Code')}" />
					
						<g:sortableColumn property="exam.name" title="${message(code: 'exam.name.label', default: 'Exam Name')}" />

						<g:sortableColumn property="quantity" title="${message(code: 'order.quantity.label', default: 'Quantity')}" />
						
						<g:sortableColumn property="createDate" title="${message(code: 'order.createDate.label', default: 'Create Date')}" />
										
					</tr>
				</thead>
				<tbody>
				<g:each in="${orderInstanceList}" status="i" var="orderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${orderInstance.id}">${fieldValue(bean: orderInstance, field: "orderNo")}</g:link></td>
					
						<td>${fieldValue(bean: orderInstance, field: "agreeNo")}</td>
					
						<td>${orderInstance.exam.code}</td>
					
						<td>${orderInstance.exam.name}</td>
					
						<td>${fieldValue(bean: orderInstance, field: "quantity")}</td>

						<td><g:formatDate timeZone ="GMT+8" date="${orderInstance.createDate}" /></td>
										
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${orderInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
