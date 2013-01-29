<%@ page import="pac.FAQ" %>



<div class="fieldcontain ${hasErrors(bean: FAQInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="FAQ.type.label" default="Type" />
		
	</label>
	<g:radioGroup name="type" values="[1,2,3]" value="${FAQInstance?.type}"
		labels='["${message(code: 'FAQ.type.1.label')}","${message(code: 'FAQ.type.2.label')}","${message(code: 'FAQ.type.3.label')}"]' >
		${it.radio} ${it.label}
	</g:radioGroup>
</div>

<div class="fieldcontain ${hasErrors(bean: FAQInstance, field: 'topic', 'error')} ">
	<label for="topic">
		<g:message code="FAQ.topic.label" default="Topic" />
		
	</label>
	<g:textField name="topic" value="${FAQInstance?.topic}" length="45" />
</div>

<div class="fieldcontain ${hasErrors(bean: FAQInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="FAQ.content.label" default="Content" />
		
	</label>
	<g:textArea name="content" value="${FAQInstance?.content}" rows="6" cols="45" />
</div>

<div class="fieldcontain ${hasErrors(bean: FAQInstance, field: 'pulished', 'error')} ">
	<label for="pulished">
		<g:message code="FAQ.pulished.label" default="Pulished" />
		
	</label>
	<g:checkBox name="pulished" value="${FAQInstance?.pulished}" />
</div>
