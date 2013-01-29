<%@ page import="pac.Options" %>



<div class="fieldcontain ${hasErrors(bean: optionsInstance, field: 'template', 'error')} ">
	<label for="template">
		<g:message code="options.template.label" default="Template" />
		
	</label>
	<g:textArea name="template" value="${optionsInstance?.template}" rows="6" cols="66" />
</div>

