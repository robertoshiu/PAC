<%@ page import="pac.Customer" %>
<%@ page import="pactest.Account" %>

<r:script>
    $(function() {
        $("#tabs").tabs();
    });
</r:script>

<div id="tabs">

    <ul>
        <li><a href="#tabs-1">${message(code: 'customer.label')}</a></li>
        <li><a href="#tabs-2">${message(code: 'customer.account.label')}</a></li>
        <li><a href="#tabs-3">${message(code: 'customer.order.list.label')}</a></li>
    </ul>
    
    <div id="tabs-1">
		<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'type', 'error')} ">
			<label for="type">
				<g:message code="customer.type.label" default="Type" />
				
			</label>
			<g:radioGroup name="type" values="[0,1,2]" value="${customerInstance?.type}"
				labels='["${message(code: 'customer.type.0.label')}","${message(code: 'customer.type.1.label')}","${message(code: 'customer.type.2.label')}"]' >
				${it.radio} ${it.label}
			</g:radioGroup>
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'custNo', 'error')} ">
			<label for="custNo">
				<g:message code="customer.custNo.label" default="Cust No" />
				
			</label>
			<g:textField name="custNo" value="${customerInstance?.custNo}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'name', 'error')} ">
			<label for="name">
				<g:message code="customer.name.label" default="Name" />
				
			</label>
			<g:textField name="name" value="${customerInstance?.name}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'division', 'error')} ">
			<label for="division">
				<g:message code="customer.division.1.label" default="Division" />
				
			</label>
			<g:textField name="division" value="${customerInstance?.division}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'section', 'error')} ">
			<label for="section">
				<g:message code="customer.section.1.label" default="Section" />
				
			</label>
			<g:textField name="section" value="${customerInstance?.section}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'phone', 'error')} ">
			<label for="phone">
				<g:message code="customer.phone.label" default="Phone" />
				
			</label>
			<g:textField name="phone" value="${customerInstance?.phone}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'fax', 'error')} ">
			<label for="fax">
				<g:message code="customer.fax.label" default="Fax" />
				
			</label>
			<g:textField name="fax" value="${customerInstance?.fax}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'email', 'error')} ">
			<label for="email">
				<g:message code="customer.email.label" default="Email" />
				
			</label>
			<g:textField name="email" value="${customerInstance?.email}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'address', 'error')} ">
			<label for="address">
				<g:message code="customer.address.label" default="Address" />
				
			</label>
			<g:textField name="address" value="${customerInstance?.address}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'contact', 'error')} ">
			<label for="contact">
				<g:message code="customer.contact.label" default="Contact" />
				
			</label>
			<g:textField name="contact" value="${customerInstance?.contact}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'url', 'error')} ">
			<label for="url">
				<g:message code="customer.url.label" default="Url" />
				
			</label>
			<g:textField name="url" value="${customerInstance?.url}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'enabled', 'error')} ">
			<label for="enabled">
				<g:message code="customer.enabled.label" default="Enabled" />
				
			</label>
			<g:checkBox name="enabled" value="${customerInstance?.enabled}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'remark', 'error')} ">
			<label for="remark">
				<g:message code="customer.remark.label" default="Remark" />
				
			</label>
			<g:textArea name="remark" value="${customerInstance?.remark}" rows="2" cols="22" />
		</div>
	</div>
	<div id="tabs-2">
		<g:hiddenField name="accId" value="${accountInstance?.id}" />
		<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'username', 'error')} ">
			<label for="username">
				<g:message code="user.username.label" default="Username" />
				
			</label>
			<g:textField name="username" value="${accountInstance?.username}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'password', 'error')} ">
			<label for="password">
				<g:message code="user.password.label" default="Password" />
				
			</label>
			<g:passwordField name="password" value="${accountInstance?.password}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'accEmail', 'error')} ">
			<label for="accEmail">
				<g:message code="user.email.label" default="Email" />
				
			</label>
			<g:textField name="accEmail" value="${accountInstance?.accEmail}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'accName', 'error')} ">
			<label for="accName">
				<g:message code="user.name.label" default="Name" />
				
			</label>
			<g:textField name="accName" value="${accountInstance?.accName}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'gender', 'error')} ">
			<label for="gender">
				<g:message code="customer.gender.label" default="Gender" />
				
			</label>
			<g:radioGroup name="gender" values="[0,1]" value="${accountInstance?.gender}"
				labels='["${message(code: 'customer.gender.0.label')}","${message(code: 'customer.gender.1.label')}"]' >
				${it.radio} ${it.label}
			</g:radioGroup>
		</div>
	</div>
	<div id="tabs-3">
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
					
						<td><g:link action="show" controller="order" id="${orderInstance.id}">${fieldValue(bean: orderInstance, field: "orderNo")}</g:link></td>
					
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
</div>
