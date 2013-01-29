package pac

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.bson.types.ObjectId;

@Secured(['ROLE_ADMIN'])
class RoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [roleInstanceList: Role.list(params), roleInstanceTotal: Role.count()]
    }

    def create() {
        [roleInstance: new Role(params)]
    }

    def save() {
        def roleInstance = new Role(params)
        if (!roleInstance.save(flush: true)) {
            render(view: "create", model: [roleInstance: roleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'role.label', default: 'Role'), roleInstance.description])
        redirect(action: "show", id: roleInstance.id)
    }

    def show(String id) {
        def roleInstance = Role.get(id)
        if (!roleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "list")
            return
        }

        [roleInstance: roleInstance]
    }

    def edit(String id) {
        def roleInstance = Role.get(id)
        if (!roleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "list")
            return
        }

        [roleInstance: roleInstance]
    }

    def update(String id, Long version) {
        def roleInstance = Role.get(id)
        if (!roleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (roleInstance.version > version) {
                roleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'role.label', default: 'Role')] as Object[],
                          "Another user has updated this Role while you were editing")
                render(view: "edit", model: [roleInstance: roleInstance])
                return
            }
        }

        roleInstance.properties = params

        if (!roleInstance.save(flush: true)) {
            render(view: "edit", model: [roleInstance: roleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'role.label', default: 'Role'), roleInstance.id])
        redirect(action: "show", id: roleInstance.id)
    }

    def delete(String id) {
        def roleInstance = Role.get(id)
		def name = roleInstance.description
        if (!roleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), name])
            redirect(action: "list")
            return
        }
		
		/*
		def query = User.where {
			roles { name == roleInstance.name }
		}

		if (query.find()) {
			flash.message = message(code: 'default.occupied.message', args: [message(code: 'role.group', default: 'Role'), roleInstance.description])
			redirect(action: "list")
			return
		}
		*/

        try {
			User.findAllByRoles(roleInstance.id).each {
				it.roles.remove(roleInstance.id)
				it.save()
			}
            roleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'role.label', default: 'Role'), name])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'role.label', default: 'Role'), name])
            redirect(action: "show", id: id)
        }
    }
}
