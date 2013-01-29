package pac

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import pactest.Account;
import pactest.Authority;

@Secured("hasRole('PERM_CUST')")
class CustomerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [customerInstanceList: Customer.list(params), customerInstanceTotal: Customer.count()]
    }

    def create() {
		params.type = 1
		params.gender = 0
		params.examType = 2
        [customerInstance: new Customer(params), accountInstance: new Account(params), orderInstanceList: [], orderInstanceTotal: 0]
    }

    def save() {
		params.createDate = new Date()
		params.authority = Authority.findByName('ROLE_SUPER')
		params.account = new Account(params)
        def customerInstance = new Customer(params)
        if (!customerInstance.save(flush: true)) {
            render(view: "create", model: [customerInstance: customerInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.id])
        redirect(action: "show", id: customerInstance.id)
    }

    def show(String id) {
        def customerInstance = Customer.get(id)
        if (!customerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "list")
            return
        }

        [customerInstance: customerInstance]
    }

    def edit(String id) {
        def customerInstance = Customer.get(id)
        if (!customerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "list")
            return
        }

        [customerInstance: customerInstance, accountInstance: customerInstance.account,
			orderInstanceList: customerInstance.orders, orderInstanceTotal: customerInstance.orders.size()]
    }

    def update(String id, Long version) {
        def customerInstance = Customer.get(id)
        if (!customerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (customerInstance.version > version) {
                customerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'customer.label', default: 'Customer')] as Object[],
                          "Another user has updated this Customer while you were editing")
                render(view: "edit", model: [customerInstance: customerInstance])
                return
            }
        }

        def accountInstance
		if (!params.accId || !(accountInstance = Account.get(params.accId))) {
			params.authority = Authority.findByName('ROLE_SUPER')
			accountInstance = new Account(params)
		} else {
			def pwdDirty = accountInstance.password != params.password
			accountInstance.properties = params
			if (pwdDirty) accountInstance.encodePassword()
		}
		params.account = accountInstance
        customerInstance.properties = params

        if (!customerInstance.save(flush: true)) {
            render(view: "edit", model: [customerInstance: customerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.id])
        redirect(action: "show", id: customerInstance.id)
    }

    def delete(String id) {
        def customerInstance = Customer.get(id)
        if (!customerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "list")
            return
        }

		customerInstance.enabled = false

        if (customerInstance.save(flush: true)) {
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.name])
            redirect(action: "list")
        } else {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "show", id: id)
        }
		/*
        try {
            customerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "show", id: id)
        }
        */
    }
}
