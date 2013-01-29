package pac

import java.util.Date;

import org.bson.types.ObjectId;

class News {

	ObjectId id
	String topic
	String poster
	String content
	Date createDate
	Date updateDate
	Date postDate
	Date dueDate
	Boolean active
	
    static constraints = {
		topic(blank:false)
		content(blank:false)
		poster(blank:false)
    }
}
