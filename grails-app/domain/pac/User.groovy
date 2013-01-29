package pac

import java.util.Date;
import java.util.Set;
import org.bson.types.ObjectId;

class User {

	transient springSecurityService

	ObjectId id
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	String name
	String email
	Date lastLogin
	Date createDate
	Set<String> functions
	Set<ObjectId> roles
	// static embedded  = [ 'roles' ]
	
	static constraints = {
		username blank: false, unique: true
		password(blank:false, password:true)
		email(email:true)
		lastLogin(nullable:true)
	}

	def authorities() {
		if (!functions) functions = [] as Set
		roles ? roles.collectMany(functions) { def role = Role.get(it); role.functions << role.name } : functions
	}

	def roles() {
		roles ? roles.collect { Role.get(it) } : []
	}

   	def beforeInsert() {
		encodePassword()
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
