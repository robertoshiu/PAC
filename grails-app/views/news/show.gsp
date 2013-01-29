
<%@ page import="pac.News" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'news.label', default: 'News')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-news" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-news" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list news">
			
				<g:if test="${newsInstance?.topic}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="news.topic.label" default="Topic" /></span>
					
						<span class="property-value" aria-labelledby="topic-label"><g:fieldValue bean="${newsInstance}" field="topic"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="news.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${newsInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsInstance?.createDate}">
				<li class="fieldcontain">
					<span id="createDate-label" class="property-label"><g:message code="news.createDate.label" default="Create Date" /></span>
					
						<span class="property-value" aria-labelledby="createDate-label"><g:formatDate timeZone ="GMT+8" date="${newsInstance?.createDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsInstance?.postDate}">
				<li class="fieldcontain">
					<span id="postDate-label" class="property-label"><g:message code="news.postDate.label" default="Post Date" /></span>
					
						<span class="property-value" aria-labelledby="postDate-label"><g:formatDate timeZone ="GMT+8" format="yyyy-MM-dd z" date="${newsInstance?.postDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsInstance?.dueDate}">
				<li class="fieldcontain">
					<span id="dueDate-label" class="property-label"><g:message code="news.dueDate.label" default="Due Date" /></span>
					
						<span class="property-value" aria-labelledby="dueDate-label"><g:formatDate timeZone ="GMT+8" format="yyyy-MM-dd z" date="${newsInstance?.dueDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsInstance?.poster}">
				<li class="fieldcontain">
					<span id="poster-label" class="property-label"><g:message code="news.poster.label" default="Poster" /></span>
					
						<span class="property-value" aria-labelledby="poster-label"><g:fieldValue bean="${newsInstance}" field="poster"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsInstance?.updateDate}">
				<li class="fieldcontain">
					<span id="updateDate-label" class="property-label"><g:message code="news.updateDate.label" default="Update Date" /></span>
					
						<span class="property-value" aria-labelledby="updateDate-label"><g:formatDate timeZone ="GMT+8" date="${newsInstance?.updateDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${newsInstance?.id}" />
					<g:link class="edit" action="edit" id="${newsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
