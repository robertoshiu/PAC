package pac

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.bson.types.ObjectId;

@Secured("hasRole('PERM_QUIZ')")
class QuestionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [questionInstanceList: Question.list(params), questionInstanceTotal: Question.count()]
    }

    def create() {
		params.type = 1
        [questionInstance: new Question(params)]
    }

    def save() {
		// log.warn params
		if (params.correctAnswer.contains(",")) {
			params.multiCorrectAnswers = params.correctAnswer.split(",").collect()
		}

		if (params.template) {
			params.options = params.template.split(",").collect()			
		}
		
        def questionInstance = new Question(params)
		
		Exam.withTransaction { status ->
			try {
				questionInstance.exams.each {
					Exam.get(it).addToQuestions(questionInstance).save()
				}
			} catch(e) { 
				status.setRollbackOnly()
	            render(view: "create", model: [questionInstance: questionInstance])
	            return
			}
		}
		
        flash.message = message(code: 'default.created.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])
        redirect(action: "show", id: questionInstance.id)
    }

    def show(String id) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

        [questionInstance: questionInstance]
    }

    def renderImage(String id) {
        def questionInstance = Question.get(id)
        if (questionInstance?.imageQuiz) {
            response.setContentLength(questionInstance.imageQuiz.length)
            response.outputStream.write(questionInstance.imageQuiz)
        } else {
			response.sendError(404)
        }
    }
	
    def edit(String id) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

        [questionInstance: questionInstance]
    }

    def update(String id, Long version) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (questionInstance.version > version) {
                questionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'question.label', default: 'Question')] as Object[],
                          "Another user has updated this Question while you were editing")
                render(view: "edit", model: [questionInstance: questionInstance])
                return
            }
        }

		if (params.type == 0) {
			params.options = params.template.split(",") as Set<String>			
		}

		if (params.correctAnswer.contains(",")) {
			params.multiCorrectAnswers = params.correctAnswer.split(",") as Set<String>
		}
		
		def oldExams = questionInstance.exams ? questionInstance.exams : [] as Set
		def exam
		oldExams.each {
			if (!params.list('exams').contains(it)) {
				exam = Exam.get(it)
				exam.removeFromQuestions(questionInstance).save()	
			}
		}
		
		params.list('exams').each {
			if (!oldExams.contains(ObjectId.massageToObjectId(it))) {
				exam = Exam.get(it)
				exam.addToQuestions(questionInstance).save()	
			}
		}
		
		def imageQuiz = questionInstance.imageQuiz
        questionInstance.properties = params
		if (params.imageQuiz.isEmpty()) {
			questionInstance.imageQuiz = imageQuiz
		}
		
		
        if (!questionInstance.save(flush: true)) {
            render(view: "edit", model: [questionInstance: questionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])
        redirect(action: "show", id: questionInstance.id)
    }

    def delete(String id) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

		questionInstance.exams.each {
			Exam.get(it).removeFromQuestions(questionInstance).save()
		}
		
        try {
            questionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "show", id: id)
        }
    }
}
