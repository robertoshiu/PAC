package pac

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured("hasRole('PERM_CUST')")
class OrderController {

	transient springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [orderInstanceList: Order.list(params), orderInstanceTotal: Order.count()]
    }

    def create() {
		params.examType = 2
		params.printType = 1
        [orderInstance: new Order(params)]
    }

    def save() {
		params.createDate = new Date()
		params.creator = springSecurityService.getCurrentUser().name
        def orderInstance = new Order(params)
        def customerInstance = Customer.get(params.customer.id)
		customerInstance.addToOrders(orderInstance)
        if (!customerInstance.save(flush: true)) {
            render(view: "create", model: [orderInstance: orderInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'order.label', default: 'Order'), orderInstance.id])
        redirect(controller: "customer", action: "show", id: customerInstance.id)
    }

    def show(String id) {
        def orderInstance = Order.get(id)
        if (!orderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), id])
            redirect(action: "list")
            return
        }

        [orderInstance: orderInstance]
    }

    def edit(String id) {
        def orderInstance = Order.get(id)
        if (!orderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), id])
            redirect(action: "list")
            return
        }

        [orderInstance: orderInstance]
    }

    def update(String id, Long version) {
        def orderInstance = Order.get(id)
        if (!orderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (orderInstance.version > version) {
                orderInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'order.label', default: 'Order')] as Object[],
                          "Another user has updated this Order while you were editing")
                render(view: "edit", model: [orderInstance: orderInstance])
                return
            }
        }

        orderInstance.properties = params

        if (!orderInstance.save(flush: true)) {
            render(view: "edit", model: [orderInstance: orderInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'order.label', default: 'Order'), orderInstance.id])
        redirect(action: "show", id: orderInstance.id)
    }

    def delete(String id) {
        def orderInstance = Order.get(id)
        if (!orderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), id])
            redirect(action: "list")
            return
        }

		orderInstance.customer.removeFromOrders(orderInstance)
        try {
            orderInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'order.label', default: 'Order'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'order.label', default: 'Order'), id])
            redirect(action: "show", id: id)
        }
    }
}
