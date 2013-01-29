package pactest

import java.util.Set;
import org.bson.types.ObjectId;

class Authority {

	ObjectId id
	String name
	String description

	static mapping = {
		cache true
	}

	static constraints = {
		name blank: false, unique: true
		description blank: false, unique: true
	}
}
