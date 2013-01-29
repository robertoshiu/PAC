<%@ page import="pac.Author" %>

<r:script>
			
	tinyMCE.init({
		// General options
		mode : "exact",
		elements : "wording",
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
			
</r:script>


<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="author.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${authorInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'ename', 'error')} ">
	<label for="ename">
		<g:message code="author.ename.label" default="Ename" />
		
	</label>
	<g:textField name="ename" value="${authorInstance?.ename}" />
</div>

<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'photo', 'error')} ">
	<label for="photo">
		<g:message code="author.photo.label" default="Photo" />
		
	</label>
	<g:if test="${authorInstance?.photo}">
		<img src="<g:createLink controller='author' action='renderPhoto' id='${authorInstance.id}'/>" />
	</g:if>
	<div style="margin:0 26%;"><input type="file" name="photo" class="ignore multi {max:1}" accept="jpg|gif|png" /></div>
</div>

<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'subject', 'error')} ">
	<label for="subject">
		<g:message code="author.subject.label" default="Subject" />
		
	</label>
	<g:textField name="subject" value="${authorInstance?.subject}" />
</div>

<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'domain', 'error')} ">
	<label for="domain">
		<g:message code="author.domain.label" default="Domain" />
		
	</label>
	<g:textArea name="domain" value="${authorInstance?.domain}" rows="3" cols="45" />
</div>

<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'career', 'error')} ">
	<label for="career">
		<g:message code="author.career.label" default="Career" />
		
	</label>
	<g:textArea name="career" value="${authorInstance?.career}" rows="3" cols="45" />
</div>

<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'diploma', 'error')} ">
	<label for="diploma">
		<g:message code="author.diploma.label" default="Diploma" />
		
	</label>
	<g:textArea name="diploma" value="${authorInstance?.diploma}" rows="3" cols="45" />
</div>

<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'wording', 'error')} ">
	<label for="wording">
		<g:message code="author.wording.label" default="Wording" />
		
	</label>
	<div align="center"><g:textArea id="wording" name="wording" value="${authorInstance?.wording}" /></div>
</div>
