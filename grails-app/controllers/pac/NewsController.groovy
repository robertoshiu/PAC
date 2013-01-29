package pac

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.SpringSecurityService
import grails.plugins.springsecurity.Secured

@Secured("hasRole('PERM_NEWS')")
class NewsController {

	transient springSecurityService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [newsInstanceList: News.list(params), newsInstanceTotal: News.count()]
    }

    def create() {
        [newsInstance: new News(params)]
    }

    def save() {
		params.createDate = new Date()
		params.updateDate = params.createDate
		params.poster = springSecurityService.getCurrentUser().name
		params.active = true
        def newsInstance = new News(params)
        if (!newsInstance.save(flush: true)) {
            render(view: "create", model: [newsInstance: newsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'news.label', default: 'News'), newsInstance.id])
        redirect(action: "show", id: newsInstance.id)
    }

    def show(String id) {
        def newsInstance = News.get(id)
        if (!newsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'news.label', default: 'News'), id])
            redirect(action: "list")
            return
        }

        [newsInstance: newsInstance]
    }

    def edit(String id) {
        def newsInstance = News.get(id)
        if (!newsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'news.label', default: 'News'), id])
            redirect(action: "list")
            return
        }

        [newsInstance: newsInstance]
    }

    def update(String id, Long version) {
        def newsInstance = News.get(id)
        if (!newsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'news.label', default: 'News'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (newsInstance.version > version) {
                newsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'news.label', default: 'News')] as Object[],
                          "Another user has updated this News while you were editing")
                render(view: "edit", model: [newsInstance: newsInstance])
                return
            }
        }

		params.updateDate = new Date()
        newsInstance.properties = params

        if (!newsInstance.save(flush: true)) {
            render(view: "edit", model: [newsInstance: newsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'news.label', default: 'News'), newsInstance.id])
        redirect(action: "show", id: newsInstance.id)
    }

    def delete(String id) {
        def newsInstance = News.get(id)
        if (!newsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'news.label', default: 'News'), id])
            redirect(action: "list")
            return
        }

        try {
            newsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'news.label', default: 'News'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'news.label', default: 'News'), id])
            redirect(action: "show", id: id)
        }
    }
}
