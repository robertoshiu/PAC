<%@ page import="pac.Exam" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'exam.label', default: 'Exam')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<r:require modules="uploadImg, datatable-ui"/>
		<g:javascript src="tiny_mce/tiny_mce.js"/>
<r:script>			
	
if (typeof (JSON) == 'undefined') {  
	$.getScript("${resource(dir: 'js', file: 'json2.js')}");  
}

	$(document).ready(function() {

	    var oTable = $('#quizTable').dataTable( {
	    	"bJQueryUI": true,
	    	"sDom": '<"H"lTf>rt<"F"ip>',
	        "bPaginate": true,
	        "bAutoWidth": true,
	        "bProcessing": true,
	        "sPaginationType": "full_numbers",
	        "sAjaxSource": "${createLink(action:'renderQuizTable', controller:'exam', params:[id: examInstance?.id])}",
	        "oTableTools": {
	        	"sRowSelect": "multi",
	        	"aButtons": [
	        		{ "sExtends": "text", "sButtonText": "${message(code: 'default.new.label', args: [message(code: 'exam.questions.label', default: 'Questions')])}",
	        			"fnClick": hideQuestions
	        		},
	        		{ "sExtends": "select_all", "sButtonText": "${message(code: 'default.button.selectAll.label')}" },
	        		{ "sExtends": "select_none" , "sButtonText": "${message(code: 'default.button.cancelAll.label')}"},
	        		{ "sExtends": "text", "sButtonText": "${message(code: 'default.button.delete.label')}",
	        			"fnClick": function ( nButton, oConfig ) {
	        				if (confirm("${message(code: 'default.button.delete.confirm.message')}")) {
	        					var rowData = JSON.stringify(this.fnGetSelectedData());
	        					var aSelectedTrs = this.fnGetSelected();
	        					$.ajax({
	        						"dataType": "json",
	        						"type": "POST",
	        						"cache": false,
	        						"url": "${createLink(action:'deleteQuestions', controller:'exam', params:[id: examInstance?.id])}",
	        						"data": { "questions" : rowData },
	        						"success": function (data, textStatus, jqXHR) {
	        							alert(textStatus + ' : ' + data.msg);
	        							if (data.success) {
	        								$.each(aSelectedTrs, function(index, value) {
	        									oTable.fnDeleteRow(value);
	        								});
	        							}
	        						},
	        						"error": function (jqXHR, textStatus, errorThrown) { alert(textStatus + ' : ' + errorThrown) }
	        					});
	        					
	        				}
	        			}
	        		}
	        	]
	        },
	        "aoColumns": [
	        	{ "mData": "id", "bVisible": false },
	        	{ "mData": "type", "mRender": function ( data, type, full ) {
	        			if (data == 0) return "${message(code: 'question.type.level.label')}"
	        			else if (data == 1) return "${message(code: 'question.type.single.label')}"
	        			else if (data == 2) return "${message(code: 'question.type.multiple.label')}"
	        			else if (data == 3) return "${message(code: 'question.type.matrix.label')}"
	        			else return "N/A"
	        		}
	        	},
	        	{ "mData": "correctAnswer" },
	        	{ "mData": "quiz" },
	        	{ "mData": "value" }
	        ]
	    });

		function hideQuestions() {
			$('#questions').hide("bounce", 459, function() {
				$('#newQuestions').show("explode", 459, newQuestions);
			});
		}
	
		function showQuestions() {
			$('#newQuestions').hide("explode", 459, function() {
				$('#questions').show("bounce", 459);
			});
		}
		
		var nTable;
		function newQuestions() {
			if (!nTable) {
			    nTable = $('#newQuizTable').dataTable( {
			    	"bJQueryUI": true,
			    	"sDom": '<"H"lTf>rt<"F"ip>',
			        "bPaginate": true,
			        "bAutoWidth": true,
			        "bProcessing": true,
			        "sPaginationType": "full_numbers",
			        "sAjaxSource": "${createLink(action:'renderPopupTable', controller:'exam')}",
			        "oTableTools": {
			        	"sRowSelect": "multi",
			        	"aButtons": [
			        		{ "sExtends": "text", "sButtonText": "${message(code: 'default.button.cancel.label', default: 'Cancel')}",
			        			"fnClick": showQuestions
			        		},
			        		{ "sExtends": "select_all", "sButtonText": "${message(code: 'default.button.selectAll.label')}" },
			        		{ "sExtends": "select_none" , "sButtonText": "${message(code: 'default.button.cancelAll.label')}"},
			        		{ "sExtends": "text", "sButtonText": "${message(code: 'default.add.label', args: [message(code: 'exam.questions.label', default: 'Questions')])}",
			        			"fnClick": function ( nButton, oConfig ) {
			        				var sData = this.fnGetSelectedData();
			        				var rowData = JSON.stringify(sData);
			        				$.ajax({
			        					"dataType": "json",
			        					"type": "POST",
			        					"cache": false,
			        					"url": "${createLink(action:'addQuestions', controller:'exam', params:[id: examInstance?.id])}",
			        					"data": { "questions" : rowData },
			        					"success": function (data, textStatus, jqXHR) {
			        						alert(textStatus + ' : ' + data.msg);
			        						if (data.success) {
		        								oTable.fnAddData(sData);
			        						}
			        					},
			        					"error": function (jqXHR, textStatus, errorThrown) { alert(textStatus + ' : ' + errorThrown) },
			        					"complete": showQuestions
			        				});		        					
			        			}
			        		}
			        	]
			        },
			        "aoColumns": [
			        	{ "mData": "id", "bVisible": false },
			        	{ "mData": "type", "mRender": function ( data, type, full ) {
			        			if (data == 0) return "${message(code: 'question.type.level.label')}"
			        			else if (data == 1) return "${message(code: 'question.type.single.label')}"
			        			else if (data == 2) return "${message(code: 'question.type.multiple.label')}"
			        			else if (data == 3) return "${message(code: 'question.type.matrix.label')}"
			        			else return "N/A"
			        		}
			        	},
			        	{ "mData": "correctAnswer" },
			        	{ "mData": "quiz" },
			        	{ "mData": "value" }
			        ]
			    });
			}    
		}
	});
	
</r:script>
	</head>
	<body>
		<a href="#edit-exam" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-exam" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${examInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${examInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post"  enctype="multipart/form-data">
				<g:hiddenField name="id" value="${examInstance?.id}" />
				<g:hiddenField name="version" value="${examInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
<div class="fieldcontain">
	<label for="code">
		<g:message code="exam.questions.label" default="Questions" />
		
	</label>
	<div id="newQuestions" style="display:none;">
	<table cellpadding="0" cellspacing="0" border="0" id="newQuizTable">
		<thead>
			<tr>
				<th>ID</th>
				<th>${message(code: 'question.type.label', default: 'Type')}</th>
				<th>${message(code: 'question.correctAnswer.label', default: 'Correct Answer')}</th>
				<th>${message(code: 'question.quiz.label', default: 'Quiz')}</th>
				<th>${message(code: 'question.value.label', default: 'Value')}</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	</div>
	<div id="questions">
	<table cellpadding="0" cellspacing="0" border="0" id="quizTable">
		<thead>
			<tr>
				<th>ID</th>
				<th>${message(code: 'question.type.label', default: 'Type')}</th>
				<th>${message(code: 'question.correctAnswer.label', default: 'Correct Answer')}</th>
				<th>${message(code: 'question.quiz.label', default: 'Quiz')}</th>
				<th>${message(code: 'question.value.label', default: 'Value')}</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	</div>
</div>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		<jqvalui:renderValidationScript for="pac.Exam" not="guideline,imageGuide" onkeyup="false" />
	</body>
</html>
