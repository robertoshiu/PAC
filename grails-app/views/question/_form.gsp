<%@ page import="pac.Question" %>
<%@ page import="pac.Options" %>
<%@ page import="pac.Exam" %>


<r:script>			
			tinyMCE.init({
			        // General options
			        mode : "textareas",
			        theme : "advanced",
			        
			        // plugins : "autolink,lists,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",
					plugins : "searchreplace,insertdatetime,preview,table,emotions,iespell,media,print,directionality,fullscreen,layer,style,visualchars,save,advimage",
			        // Theme options
			        theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
			        theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,fullscreen,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
			        theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,insertlayer,moveforward,movebackward,absolute,|,charmap,iespell,media,advhr,|,print,|,ltr,rtl",
			        // theme_advanced_toolbar_location : "top",
			        // theme_advanced_toolbar_align : "left",
			        // theme_advanced_statusbar_location : "bottom",
			        theme_advanced_resizing : true
			});
			
			
    $("input[type=radio]:checked").live("click", function(){
	   	if ($(this).val() == 0) {
	   		$('#levelTemplate').show();
	   		$('#newOptions').hide();
	   		$("select[name='template']").prop("disabled", false);
	   	} else {
	   		$('#levelTemplate').hide();
	   		$('#newOptions').show();
	   		$("select[name='template']").prop("disabled", true);
	   	}
    });

	$('.add_field').click(function(){     	
    	$(".input_holder ol").append('<li><g:textField name="options" /></li>')         
   	});
 
    $('.remove_field').click(function(){
    	if($('.input_holder input:last').attr('id') != 'input_clone'){
        	$('.input_holder li:last').remove();
        }         
   	});
</r:script>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="question.type.label" default="Type" />
	</label>
	<g:radioGroup name="type" values="[0,1,2,3]" value="${questionInstance?.type}"
		labels='["${message(code: 'question.type.level.label')}","${message(code: 'question.type.single.label')}",
				"${message(code: 'question.type.multiple.label')}","${message(code: 'question.type.matrix.label')}"]' >
		${it.radio} ${it.label}
	</g:radioGroup>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'quiz', 'error')} ">
	<label for="quiz">
		<g:message code="question.quiz.label" default="Quiz" />
		
	</label>
	<div align="center"><g:textArea name="quiz" value="${questionInstance?.quiz}" /></div>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'imageQuiz', 'error')} ">
	<label for="imageQuiz">
		<g:message code="question.imageQuiz.label" default="Image Quiz" />
		
	</label>
	<g:if test="${questionInstance?.imageQuiz}">
		<img src="<g:createLink controller='question' action='renderImage' id='${questionInstance.id}'/>" />
	</g:if>
	<div style="margin:0 26%;"><input type="file" name="imageQuiz" class="ignore multi {max:1}" accept="jpg|gif|png" /></div>
</div>

<div id="levelTemplate" class="fieldcontain" style="display:none;">
	<label for="template">
		<g:message code="options.template.label" default="Template" />
		
	</label>
	<g:select name="template" from="${Options.list()}" optionKey="template" optionValue="template" class="many-to-many" disabled="true" />
</div>

<div id="newOptions" class="fieldcontain ${hasErrors(bean: questionInstance, field: 'options', 'error')} ">
	<label for="options">
		<g:message code="question.options.label" default="Options" />
		
	</label>
	<span class="add_field"><img src="${resource(dir: 'images', file: 'plus.jpg')}" alt="新增選項" /></span>
	<span class="remove_field"><img src="${resource(dir: 'images', file: 'cross.jpg')}" alt="移除選項" /></span>
	<div class="input_holder" style="margin:0 24%;">
		<ol>
			<g:if test="${questionInstance?.options}">
				<g:each status="i" in="${questionInstance.options}" var="op">
					<li><g:textField name="options" id="input_clone${ i == 1 ? '' : i}" value="${op}" /></li>
				</g:each>
			</g:if>
			<g:else>
				<li><g:textField name="options" required="true" /></li>
				<li><g:textField name="options" id="input_clone" required="true" /></li>
			</g:else>
		</ol>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'correctAnswer', 'error')} ">
	<label for="correctAnswer">
		<g:message code="question.correctAnswer.label" default="Correct Answer" />
		
	</label>
	<g:textField name="correctAnswer" value="${questionInstance?.correctAnswer}" />
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'value', 'error')} ">
	<label for="value">
		<g:message code="question.value.label" default="Value" />
		
	</label>
	<g:field type="number" name="value" value="${questionInstance.value}" />
</div>

<div class="fieldcontain">
	<label for="exams">
		<g:message code="question.exams.label" default="Exams" />
		
	</label>
	<g:select name="exams" from="${Exam.listOrderByCode(order: 'desc')}" optionKey="id" optionValue="name" multiple="true" size="9" value="${questionInstance?.exams}" class="many-to-many"/>
</div>
