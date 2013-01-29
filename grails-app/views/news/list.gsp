
<%@ page import="pac.News" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'news.label', default: 'News')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-news" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-news" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="topic" title="${message(code: 'news.topic.label', default: 'Topic')}" />
										
						<g:sortableColumn property="createDate" title="${message(code: 'news.createDate.label', default: 'Create Date')}" />
					
						<g:sortableColumn property="postDate" title="${message(code: 'news.postDate.label', default: 'Post Date')}" />
					
						<g:sortableColumn property="dueDate" title="${message(code: 'news.dueDate.label', default: 'Due Date')}" />
					
						<g:sortableColumn property="poster" title="${message(code: 'news.poster.label', default: 'Poster')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${newsInstanceList}" status="i" var="newsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${newsInstance.id}">${fieldValue(bean: newsInstance, field: "topic")}</g:link></td>
					
						<td><g:formatDate timeZone ="GMT+8" date="${newsInstance.createDate}" /></td>
					
						<td><g:formatDate timeZone ="GMT+8" format="yyyy-MM-dd z" date="${newsInstance.postDate}" /></td>
					
						<td><g:formatDate timeZone ="GMT+8" format="yyyy-MM-dd z" date="${newsInstance.dueDate}" /></td>
					
						<td>${fieldValue(bean: newsInstance, field: "poster")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${newsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
