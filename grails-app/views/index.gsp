<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>PAC後台管理系統</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}
            
			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
		<r:require module="jMenu"/>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>系統配置狀態</h1>
			<ul>
				<li>App version: <g:meta name="app.version"/></li>
				<li>JVM version: ${System.getProperty('java.version')}</li>
				<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
				<li>Domains: ${grailsApplication.domainClasses.size()}</li>
				<li>Services: ${grailsApplication.serviceClasses.size()}</li>
				<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
			</ul>
				<h2>已授權使用功能:</h2>
				<ul>
					<sec:ifAnyGranted roles="ROLE_ADMIN">
						<li class="controller"><g:link controller="role">${message(code: 'role.label')}</g:link></li>
						<li class="controller"><g:link controller="user">${message(code: 'user.label')}</g:link></li>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="PERM_NEWS">
						<li class="controller"><g:link controller="news">${message(code: 'news.label')}</g:link></li>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="PERM_EXPERT">
						<li class="controller"><g:link controller="author">${message(code: 'author.label')}</g:link></li>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="PERM_FAQ">
						<li class="controller"><g:link controller="FAQ">${message(code: 'FAQ.label')}</g:link></li>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="PERM_QUIZ">
						<li class="controller"><g:link controller="question">${message(code: 'question.label')}</g:link></li>
						<li class="controller"><g:link controller="options">${message(code: 'options.label')}</g:link></li>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="PERM_EXAM">
						<li class="controller"><g:link controller="exam">${message(code: 'exam.label')}</g:link></li>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="PERM_CUST">
						<li class="controller"><g:link controller="customer">${message(code: 'customer.label')}</g:link></li>
					</sec:ifAnyGranted>
				</ul>
		</div>
		<div id="page-body" role="main">
			<h1>Welcome to PAC測驗出版社 後台管理系統</h1>
			<p>
				Congratulations, you have successfully started your first PAC application! Enjoy the POC tour.
				
				左上方展示即使功能選單有出現但無授權也會拒絕存取，下方展示只出現已被授權使用之功能選項；
				目的在於不僅是頁面有初步的登入認證控管以及功能權限控管，系統程式層級也是被控管的安全範圍(無法以超連結或指令直接執行)。
				有系統管理員身分的使用者可任意切換為其他使用者身分，也可馬上回復身分，方便測試授權效果。
			</p>

			<div id="controller-list" role="navigation">
			<sec:ifLoggedIn>
			<ul id="jMenu">
		    	<sec:ifAnyGranted roles="ROLE_ADMIN">
			    	<li>
			    		<g:link controller="user" class="fNiv">${message(code: 'user.label')}</g:link>
			    		<ul>
			    			<li class="arrow"></li>
			    			<li><g:link controller="role">${message(code: 'role.label')}</g:link></li>
			    		</ul>
			    	</li>
		    	</sec:ifAnyGranted>
	    		<sec:ifAnyGranted roles="PERM_NEWS,PERM_EXPERT,PERM_FAQ">
			    	<li><a href="#" class="fNiv">${message(code: 'content.label')}</a><ul>
			    		<li class="arrow"></li>
		    			<sec:ifAnyGranted roles="PERM_NEWS">
			    			<li><g:link controller="news">${message(code: 'news.label')}</g:link></li>
		    			</sec:ifAnyGranted>
		    			<sec:ifAnyGranted roles="PERM_EXPERT">
			    			<li><g:link controller="author">${message(code: 'author.label')}</g:link></li>
		    			</sec:ifAnyGranted>
		    			<sec:ifAnyGranted roles="PERM_FAQ">
			    			<li><g:link controller="FAQ">${message(code: 'FAQ.label')}</g:link></li>
		    			</sec:ifAnyGranted>
		    		</ul></li>
	    		</sec:ifAnyGranted>
	    		<sec:ifAnyGranted roles="PERM_QUIZ,PERM_EXAM">
			    	<li>
			    		<g:link controller="exam" class="fNiv">${message(code: 'exam.label')}</g:link>
			    		<sec:ifAnyGranted roles="PERM_QUIZ">
			    			<ul><li><g:link controller="question">${message(code: 'question.label')}</g:link>
				    			<ul><li class="arrow"></li><li><g:link controller="options">${message(code: 'options.label')}</g:link></li></ul>
			    			</li></ul>
			    		</sec:ifAnyGranted>
			    	</li>
	    		</sec:ifAnyGranted>
	    		<sec:ifAnyGranted roles="PERM_CUST">
			    	<li>
			    		<g:link controller="customer" class="fNiv">${message(code: 'customer.label')}</g:link>
			    		<ul>
			    			<li class="arrow"></li>
			    			<li><g:link controller="order">${message(code: 'order.label')}</g:link></li>
			    		</ul>
			    	</li>
	    		</sec:ifAnyGranted>
			</ul>
			<r:script>
				// $.validator.setDefaults({ignore: ".ignore"});
				
			  $(document).ready(function(){
			    // simple jMenu plugin called
			    // $("#jMenu").jMenu();
			 
			    // more complex jMenu plugin called
			    $("#jMenu").jMenu({
			    	ulWidth : 69,
			      	effects : {
			        	effectSpeedOpen : 459,
			        	effectSpeedClose : 333,
			        	effectTypeClose : 'fade'
			     	},
			      	animatedText : true
			    });
			  });		
	  		</r:script>
	  		</sec:ifLoggedIn>
			</div>
		</div>
	</body>
</html>
