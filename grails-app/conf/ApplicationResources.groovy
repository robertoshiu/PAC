modules = {
    application {
        resource url:'js/application.js'
    }

    uploadImg {
		dependsOn 'jquery'
        resource url: [dir: 'js/jquery', file: 'jquery.MultiFile.js']
        resource url: [dir: 'js/jquery', file: 'jquery.MetaData.js']
        resource url: [dir: 'js/jquery', file: 'jquery.blockUI.js']
        resource url: [dir: 'js/jquery', file: 'jquery.form.js']
    }

	jMenu {
		dependsOn 'jquery-ui'
		resource url: [dir: 'js/jquery', file: 'jMenu.jquery.min.js']
		resource url: [dir: 'css', file: 'jMenu.jquery.css']
	}
	
	popupWindow {
		dependsOn 'jquery'
		resource url: [dir: 'js/jquery', file: 'jquery.popupWindow.js']
	}
	
	datatable {
		dependsOn 'jquery'
		resource url: [dir: 'js/jquery', file: 'jquery.dataTables.js']
		resource url: [dir: 'js/jquery', file: 'TableTools.js']
		resource url: [dir: 'css', file: 'jquery.dataTables.css']
		resource url: [dir: 'css', file: 'TableTools.css']
	}

	"datatable-ui" {
		dependsOn 'jquery-ui', 'popupWindow'
		resource url: [dir: 'js/jquery', file: 'jquery.dataTables.min.js']
		resource url: [dir: 'js/jquery', file: 'TableTools.min.js']
		resource url: [dir: 'css', file: 'jquery.dataTables_themeroller.css']
		resource url: [dir: 'css', file: 'TableTools_JUI.css']
	}
}