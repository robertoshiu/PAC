package pac

import java.util.Date;
import org.bson.types.ObjectId;
import pactest.Account

class OrderDetail {

	ObjectId id
	Integer type // 0: normal, 1: PR
	Integer quantity
	Integer emailCount
	Integer closeCount
	Date createDate
	boolean enabled
	// Account account
	
	static belongsTo = [order: Order, account: Account]
	
    static constraints = {
    }
}
