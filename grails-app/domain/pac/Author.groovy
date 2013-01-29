package pac

import org.bson.types.ObjectId;

class Author {

	ObjectId id
	String name
	String ename
	String domain
	String subject
	String diploma
	String career
	String wording
	byte[] photo
	
    static constraints = {
		name(blank: false)
		domain(blank: false)
		subject(blank: false)
		diploma(blank: false)
		career(blank: false)
		photo(nullable: true, maxSize: 1024 * 128)
    }
}
