<%@ page import="pac.AdminUser" %>
<%@ page import="pac.Role" %>


<div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="adminUser.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${adminUserInstance?.active}" />
</div>

<div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="adminUser.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${adminUserInstance?.email}" />
</div>

<div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="adminUser.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${adminUserInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="adminUser.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${adminUserInstance?.password}" />
</div>

<div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'userId', 'error')} ">
	<label for="userId">
		<g:message code="adminUser.userId.label" default="User Id" />
		
	</label>
	<g:textField name="userId" value="${adminUserInstance?.userId}" />
</div>

<div class="fieldcontain">
	<label for="authorities">
		<g:message code="user.roles.label" default="Authorities" />
		
	</label>
	<g:select name="roles" from="${Role.list()}" optionKey="id" optionValue="description" multiple="true" size="5" value="${adminUserInstance?.roles}" class="many-to-many"/>
</div>


