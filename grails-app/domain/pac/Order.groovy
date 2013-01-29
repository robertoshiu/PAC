package pac

import java.util.Date;

import org.bson.types.ObjectId;

class Order {

	ObjectId id
	String orderNo
	String agreeNo
	Integer examType // 0: paper, 1: evaluation, 2: testing
	Integer printType // 0: none, 1: once, 2: unlimited
	Integer quantity
	Integer emailCount
	Integer closeCount
	String creator
	Date createDate
	Date startDate
	Date dueDate
	String version
	Boolean readable
	// Customer customer
	Exam exam
	
	static belongsTo = [customer: Customer]
	static hasMany = [orderDetails: OrderDetail]
	
    static constraints = {
		orderNo blank: false, unique: true
		startDate(nullable:true)
		dueDate(nullable:true)
    }
}
