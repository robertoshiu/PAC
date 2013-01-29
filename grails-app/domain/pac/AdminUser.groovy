package pac

import java.util.Set;
import org.bson.types.ObjectId

class AdminUser {
	
	ObjectId id
	String userId
	String password
	String name
	String email
	Date lastLogin
	Date createDate
	Boolean active
	Set<Integer> functions
	Set<ObjectId> roles
	
	// static hasMany  = [ roles: ObjectId ]
	
    static constraints = {
		userId(blank:false, unique:true)
		password(blank:false, password:true)
		email(email:true)
		lastLogin(nullable:true)
    }
}
