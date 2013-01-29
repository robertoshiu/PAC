<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="PAC"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<r:require module="jquery-validation-ui-qtip"/>
		<r:layoutResources />
	</head>
	<body>
	
		<div id="pacLogo" role="banner">
			<sec:ifLoggedIn>
			<div>
	         	登入使用者 <sec:username/> (<g:link controller='logout'>Logout</g:link>)
	      	</div>
			<div align="right">
				<sec:ifSwitched>
					<a href='${request.contextPath}/j_spring_security_exit_user'>回復為使用者： <sec:switchedUserOriginalUsername/></a>
				</sec:ifSwitched>
				<sec:ifNotSwitched>
					<sec:ifAllGranted roles='ROLE_ADMIN'>
						<form action='${request.contextPath}/j_spring_security_switch_user' method='POST'>
						切換使用者： <input type='text' name='j_username'/><input type='submit' value='切換'/>
						</form>
					</sec:ifAllGranted>
				</sec:ifNotSwitched>				
	      	</div>
	      	</sec:ifLoggedIn>
			<img src="${resource(dir: 'images', file: 'admin_02.gif')}" width="205" height="78" alt="PAC測驗出版社 後台管理系統" />
		</div>
	    <div id="menu">
	    </div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	
	</body>
</html>