package pac

import org.bson.types.ObjectId;

class Exam {

	ObjectId id
	String code
	String name
	String guideline
	Integer guideType // 0: none, 1: text, 2: image
	byte[] imageGuide
	boolean enabled
	
	static hasMany = [questions : Question]
	
    static constraints = {
		code(blank: false)
		name(blank: false)
		guideType validator: { val, obj ->
			def isValid = false
			if (val == 1) isValid = obj.guideline.length() != 0
			else if (val == 2) isValid = !obj.imageGuide
			else isValid = true
			return isValid
		}
		imageGuide(nullable: true, maxSize: 1024 * 512)
    }
}
