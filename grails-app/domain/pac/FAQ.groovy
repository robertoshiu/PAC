package pac

import java.util.Date;

import org.bson.types.ObjectId;

class FAQ {
	
	ObjectId id
	String topic
	String content
	Date createDate
	Date updateDate
	Integer type
	boolean enabled
	boolean pulished
	

    static constraints = {
		topic blank: false
		content blank: false
		updateDate(nullable: true)
    }
}
