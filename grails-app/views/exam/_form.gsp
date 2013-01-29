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
			
			
	$(function() {
		$("input:radio:first").change();
	});
	
	$("input[type=radio]:checked").live("change", function(){
		if ($(this).val() == 0) {
		   	$('#textGuide').hide();
		   	$('#imageGuide').hide();
		} else if ($(this).val() == 2) {
		   	$('#textGuide').hide();
		   	$('#imageGuide').show();
		} else {
		   	$('#textGuide').show();
		   	$('#imageGuide').hide();
		}
	});	

</r:script>


<div class="fieldcontain ${hasErrors(bean: examInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="exam.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${examInstance?.code}" />
</div>

<div class="fieldcontain ${hasErrors(bean: examInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="exam.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${examInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: examInstance, field: 'type', 'error')} ">
	<label for="guideType">
		<g:message code="exam.guideType.label" default="Guide Type" />
		
	</label>
	<g:radioGroup name="guideType" values="[0,1,2]" value="${examInstance?.guideType}"
		labels='["${message(code: 'exam.guideType.none.label')}","${message(code: 'exam.guideType.text.label')}",
				"${message(code: 'exam.guideType.image.label')}"]' >
		${it.radio} ${it.label}
	</g:radioGroup>
</div>

<div id="textGuide" class="fieldcontain ${hasErrors(bean: examInstance, field: 'guideline', 'error')} ">
	<label for="guideline">
		<g:message code="exam.guideline.label" default="Guideline" />
		
	</label>
	<div align="center"><g:textArea name="guideline" value="${examInstance?.guideline}" /></div>
</div>

<div id="imageGuide" class="fieldcontain ${hasErrors(bean: examInstance, field: 'imageGuide', 'error')} " style="display:none;">
	<label for="imageGuide">
		<g:message code="exam.guideline.label" default="Image Guide" />
		
	</label>
	<g:if test="${examInstance?.imageGuide}">
		<img src="<g:createLink controller='exam' action='renderImage' id='${examInstance.id}'/>" />
	</g:if>
	<div style="margin:0 26%;"><input type="file" name="imageGuide" class="ignore multi {max:1}" accept="jpg|gif|png" /></div>
</div>

