package pac

import java.util.Date;
import org.bson.types.ObjectId;
import pactest.Account;

class Customer {

	ObjectId id
	String custNo
	Integer type // 0: school, 1: industry, 2: medical
	String name
	String division
	String section
	String phone
	String fax
	String email
	String address
	String url
	String contact
	String remark
	Date createDate
	boolean enabled

	static hasOne = [account: Account]
	static hasMany = [orders: Order]
	
    static constraints = {
		custNo blank: false, unique: true
		name(blank:false)
		email(nullable:true, email:true)
		url(nullable:true, url:true)
		// account unique: true
    }
	
}
