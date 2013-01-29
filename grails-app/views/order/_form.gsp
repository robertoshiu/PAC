<%@ page import="pac.Order" %>



<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'orderNo', 'error')} ">
	<label for="orderNo">
		<g:message code="order.orderNo.label" default="Order No" />
		
	</label>
	<g:textField name="orderNo" value="${orderInstance?.orderNo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'agreeNo', 'error')} ">
	<label for="agreeNo">
		<g:message code="order.agreeNo.label" default="Agree No" />
		
	</label>
	<g:textField name="agreeNo" value="${orderInstance?.agreeNo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'exam', 'error')} ">
	<label for="exam">
		<g:message code="order.exam.label" default="Exam" />
		
	</label>
	<g:select id="exam" name="exam.id" from="${pac.Exam.listOrderByCode()}" optionKey="id" optionValue="name" value="${orderInstance?.exam?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'examType', 'error')} ">
	<label for="examType">
		<g:message code="order.examType.label" default="Exam Type" />
		
	</label>
	<g:radioGroup name="examType" values="[0,1,2]" value="${orderInstance.examType}"
		labels='["${message(code: 'order.examType.0.label')}","${message(code: 'order.examType.1.label')}","${message(code: 'order.examType.2.label')}"]' >
		${it.radio} ${it.label}
	</g:radioGroup>
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'quantity', 'error')} ">
	<label for="quantity">
		<g:message code="order.quantity.label" default="Quantity" />
		
	</label>
	<g:field type="number" name="quantity" value="${orderInstance.quantity}" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'emailCount', 'error')} ">
	<label for="emailCount">
		<g:message code="order.emailCount.label" default="Email Count" />
		
	</label>
	<g:field type="number" name="emailCount" value="${orderInstance.emailCount}" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'closeCount', 'error')} ">
	<label for="closeCount">
		<g:message code="order.closeCount.label" default="Close Count" />
		
	</label>
	<g:field type="number" name="closeCount" value="${orderInstance.closeCount}" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'startDate', 'error')} ">
	<label for="startDate">
		<g:message code="order.startDate.label" default="Start Date" />
		
	</label>
	<g:datePicker name="startDate" precision="day" value="${orderInstance.startDate}" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'dueDate', 'error')} ">
	<label for="dueDate">
		<g:message code="order.dueDate.label" default="Due Date" />
		
	</label>
	<g:datePicker name="dueDate" precision="day" value="${orderInstance.dueDate}" />
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'printType', 'error')} ">
	<label for="printType">
		<g:message code="order.printType.label" default="Print Type" />
		
	</label>
	<g:radioGroup name="printType" values="[0,1,2]" value="${orderInstance.printType}"
		labels='["${message(code: 'order.printType.0.label')}","${message(code: 'order.printType.1.label')}","${message(code: 'order.printType.2.label')}"]' >
		${it.radio} ${it.label}
	</g:radioGroup>
</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'readable', 'error')} ">
	<label for="readable">
		<g:message code="order.readable.label" default="Readable" />
		
	</label>
	<g:checkBox name="readable" value="${orderInstance.readable}" />
</div>