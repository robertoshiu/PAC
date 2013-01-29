package pac

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured("hasRole('PERM_EXPERT')")
class AuthorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [authorInstanceList: Author.list(params), authorInstanceTotal: Author.count()]
    }

    def create() {
        [authorInstance: new Author(params)]
    }

    def save() {
        def authorInstance = new Author(params)
        if (!authorInstance.save(flush: true)) {
            render(view: "create", model: [authorInstance: authorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'default.author.label', default: 'Author'), authorInstance.name])
        redirect(action: "show", id: authorInstance.id)
    }

    def show(String id) {
        def authorInstance = Author.get(id)
        if (!authorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'author.label', default: 'Author'), id])
            redirect(action: "list")
            return
        }

        [authorInstance: authorInstance]
    }

    def renderPhoto(String id) {
        def authorInstance = Author.get(id)
        if (authorInstance?.photo) {
            response.setContentLength(authorInstance.photo.length)
            response.outputStream.write(authorInstance.photo)
        } else {
			response.sendError(404)
        }
    }
	
    def edit(String id) {
        def authorInstance = Author.get(id)
        if (!authorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'author.label', default: 'Author'), id])
            redirect(action: "list")
            return
        }

        [authorInstance: authorInstance]
    }

    def update(String id, Long version) {
        def authorInstance = Author.get(id)
        if (!authorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'author.label', default: 'Author'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (authorInstance.version > version) {
                authorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'author.label', default: 'Author')] as Object[],
                          "Another user has updated this Author while you were editing")
                render(view: "edit", model: [authorInstance: authorInstance])
                return
            }
        }

		def photo = authorInstance.photo
        authorInstance.properties = params
		if (params.photo.isEmpty()) {
			authorInstance.photo = photo
		}

        if (!authorInstance.save(flush: true)) {
            render(view: "edit", model: [authorInstance: authorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'default.author.label', default: 'Author'), authorInstance.name])
        redirect(action: "show", id: authorInstance.id)
    }

    def delete(String id) {
        def authorInstance = Author.get(id)
        if (!authorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'author.label', default: 'Author'), id])
            redirect(action: "list")
            return
        }
		
		def name = authorInstance.name

        try {
            authorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'default.author.label', default: 'Author'), name])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'default.author.label', default: 'Author'), name])
            redirect(action: "show", id: id)
        }
    }
}
