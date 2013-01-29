package pac

import org.bson.types.ObjectId;

class Question {

	ObjectId id
	String quiz
	Integer type // 0: single, 1: multiple, 2: level, 3: matrix
	byte[] imageQuiz
	String correctAnswer
	Double value
	List<String> options
	Set<String> multiCorrectAnswers
	Set<ObjectId> exams
	
    static constraints = {
		quiz validator: { val, obj -> if (!obj.imageQuiz) return val.length() != 0}
		correctAnswer validator: { val, obj ->
			def isValid = false
			if (obj.type == 2) isValid = val.contains(",")
			else if (obj.type != 2) isValid = true
			else isValid = val.length() != 0
			return isValid
		}
		value(nullable: true)
		imageQuiz(nullable: true, maxSize: 1024 * 512)
    }
	
	def exams() {
		exams ? exams.collect { Exam.get(it) } : []
	}

}
