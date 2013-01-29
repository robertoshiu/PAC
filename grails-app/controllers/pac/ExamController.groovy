package pac

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import org.bson.types.ObjectId;

@Secured("hasRole('PERM_EXAM')")
class ExamController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [examInstanceList: Exam.list(params), examInstanceTotal: Exam.count()]
    }

    def create() {
		params.guideType = 1
        [examInstance: new Exam(params)]
    }

    def save() {
		params.enabled = true
        def examInstance = new Exam(params)
        if (!examInstance.save(flush: true)) {
            render(view: "create", model: [examInstance: examInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'exam.label', default: 'Exam'), examInstance.id])
        redirect(action: "show", id: examInstance.id)
    }

    def show(String id) {
        def examInstance = Exam.get(id)
        if (!examInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exam.label', default: 'Exam'), id])
            redirect(action: "list")
            return
        }

        [examInstance: examInstance]
    }

    def renderImage(String id) {
        def examInstance = Exam.get(id)
        if (examInstance?.imageGuide) {
            response.setContentLength(examInstance.imageGuide.length)
            response.outputStream.write(examInstance.imageGuide)
        } else {
			response.sendError(404)
        }
    }
	
    def renderQuizTable = {
		def dataToRender = [:]
		dataToRender.sEcho = params.sEcho
		dataToRender.aaData = []
        def examInstance = Exam.load(params.id)
        if (examInstance?.questions) {
			dataToRender.iTotalRecords = examInstance?.questions.size()
			dataToRender.iTotalDisplayRecords = 10;
            examInstance?.questions.each {
				dataToRender.aaData << [
					id: it.id.toString(),
					type: it.type,
					correctAnswer : it.correctAnswer,
					quiz: it.quiz,
					value: it.value
				]	
			}
		}
		// log.warn dataToRender.encodeAsJSON()
		render dataToRender as JSON
    }
	
    def renderPopupTable = {
		def dataToRender = [:]
		dataToRender.sEcho = params.sEcho
		dataToRender.aaData = []
		dataToRender.iTotalRecords = Question.count()
		dataToRender.iTotalDisplayRecords = 10;
		// def quizList = Question.listOrderByType()
        Question.listOrderByType().each {
			dataToRender.aaData << [
				id: it.id.toString(),
				type: it.type,
				correctAnswer : it.correctAnswer,
				quiz: it.quiz,
				value: it.value
			]	
		}
		// log.warn dataToRender.encodeAsJSON()
		render dataToRender as JSON
    }

    def deleteQuestions = {
		// println params.questions
        def examInstance = Exam.get(params.id)
        if (!examInstance) {
			render([success: false, msg: message(code: 'default.not.found.message', args: [message(code: 'exam.label', default: 'Exam'), id])] as JSON)			
		} else {
			Exam.withTransaction { status ->
				try {
					JSON.parse(params.questions).each {
						def quiz = Question.get(it.id)
						quiz.exams.remove(examInstance.id)
						quiz.save()
						examInstance.removeFromQuestions(quiz).save()
					}
				} catch(e) { 
					status.setRollbackOnly()
		            throw e
				}
			}
			render([success: true, msg: message(code: 'default.deleted.message', args: [message(code: 'exam.label', default: 'Exam'), message(code: 'exam.questions.label', default: 'Questions')])] as JSON)
		}
	}
	
    def addQuestions = {
		println params.questions
        def examInstance = Exam.get(params.id)
        if (!examInstance) {
			render([success: false, msg: message(code: 'default.not.found.message', args: [message(code: 'exam.label', default: 'Exam'), id])] as JSON)			
		} else {
			Exam.withTransaction { status ->
				try {
					JSON.parse(params.questions).each {
						def quiz = Question.get(it.id)
						quiz.exams.add(examInstance.id)
						quiz.save()
						examInstance.addToQuestions(quiz).save()
					}
				} catch(e) { 
					status.setRollbackOnly()
		            throw e
				}
			}
			render([success: true, msg: message(code: 'default.updated.message', args: [message(code: 'exam.label', default: 'Exam'), message(code: 'exam.questions.label', default: 'Questions')])] as JSON)
		}
	}
	
    def edit(String id) {
        def examInstance = Exam.get(id)
        if (!examInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exam.label', default: 'Exam'), id])
            redirect(action: "list")
            return
        }

        [examInstance: examInstance]
    }

    def update(String id, Long version) {
        def examInstance = Exam.get(id)
        if (!examInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exam.label', default: 'Exam'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (examInstance.version > version) {
                examInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'exam.label', default: 'Exam')] as Object[],
                          "Another user has updated this Exam while you were editing")
                render(view: "edit", model: [examInstance: examInstance])
                return
            }
        }

        examInstance.properties = params

        if (!examInstance.save(flush: true)) {
            render(view: "edit", model: [examInstance: examInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'exam.label', default: 'Exam'), examInstance.id])
        redirect(action: "show", id: examInstance.id)
    }

    def delete(String id) {
        def examInstance = Exam.get(id)
        if (!examInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exam.label', default: 'Exam'), id])
            redirect(action: "list")
            return
        }

		examInstance.enabled = false
		
        try {
            examInstance.save(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'exam.label', default: 'Exam'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'exam.label', default: 'Exam'), id])
            redirect(action: "show", id: id)
        }
    }
}
