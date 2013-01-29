package pac

import org.bson.types.ObjectId;

class Options {
	
	ObjectId id
	String template

    static constraints = {
		template blank: false, unique: true
    }
}
