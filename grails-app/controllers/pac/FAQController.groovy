package pac

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured("hasRole('PERM_FAQ')")
class FAQController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [FAQInstanceList: FAQ.list(params), FAQInstanceTotal: FAQ.count()]
    }

    def create() {
		params.type = 1
        [FAQInstance: new FAQ(params)]
    }

    def save() {
		params.createDate = new Date()
		params.updateDate = params.createDate
		params.enabled = true
        def FAQInstance = new FAQ(params)
        if (!FAQInstance.save(flush: true)) {
            render(view: "create", model: [FAQInstance: FAQInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'FAQ.label', default: 'FAQ'), FAQInstance.topic])
        redirect(action: "show", id: FAQInstance.id)
    }

    def show(String id) {
        def FAQInstance = FAQ.get(id)
        if (!FAQInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'FAQ.label', default: 'FAQ'), id])
            redirect(action: "list")
            return
        }

        [FAQInstance: FAQInstance]
    }

    def edit(String id) {
        def FAQInstance = FAQ.get(id)
        if (!FAQInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'FAQ.label', default: 'FAQ'), id])
            redirect(action: "list")
            return
        }

        [FAQInstance: FAQInstance]
    }

    def update(String id, Long version) {
        def FAQInstance = FAQ.get(id)
        if (!FAQInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'FAQ.label', default: 'FAQ'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (FAQInstance.version > version) {
                FAQInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'FAQ.label', default: 'FAQ')] as Object[],
                          "Another user has updated this FAQ while you were editing")
                render(view: "edit", model: [FAQInstance: FAQInstance])
                return
            }
        }

		params.updateDate = new Date()
        FAQInstance.properties = params

        if (!FAQInstance.save(flush: true)) {
            render(view: "edit", model: [FAQInstance: FAQInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'FAQ.label', default: 'FAQ'), FAQInstance.topic])
        redirect(action: "show", id: FAQInstance.id)
    }

    def delete(String id) {
        def FAQInstance = FAQ.get(id)
        if (!FAQInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'FAQ.label', default: 'FAQ'), id])
            redirect(action: "list")
            return
        }

        try {
            FAQInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'FAQ.label', default: 'FAQ'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'FAQ.label', default: 'FAQ'), id])
            redirect(action: "show", id: id)
        }
    }
}
