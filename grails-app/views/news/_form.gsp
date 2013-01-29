<%@ page import="pac.News" %>


<div class="fieldcontain ${hasErrors(bean: newsInstance, field: 'topic', 'error')} ">
	<label for="topic">
		<g:message code="news.topic.label" default="Topic" />
		
	</label>
	<g:textField name="topic" value="${newsInstance?.topic}" />
</div>

<div class="fieldcontain ${hasErrors(bean: newsInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="news.content.label" default="Content" />
		
	</label>
	<g:textArea name="content" value="${newsInstance?.content}" rows="9" cols="45" />
</div>

<div class="fieldcontain ${hasErrors(bean: newsInstance, field: 'postDate', 'error')} ">
	<label for="postDate">
		<g:message code="news.postDate.label" default="Post Date" />
		
	</label>
	<g:datePicker name="postDate" precision="day" value="${newsInstance?.postDate}" />
</div>

<div class="fieldcontain ${hasErrors(bean: newsInstance, field: 'dueDate', 'error')} ">
	<label for="dueDate">
		<g:message code="news.dueDate.label" default="Due Date" />
		
	</label>
	<g:datePicker name="dueDate" precision="day" value="${newsInstance?.dueDate}" />
</div>
