package pac

import java.util.Set;
import org.bson.types.ObjectId;

class Role {

	ObjectId id
	String name
	String description
	Set<String> functions
	
	static mapping = {
		cache true
	}

	static constraints = {
		name blank: false, unique: true
		description blank: false, unique: true
	}

}
