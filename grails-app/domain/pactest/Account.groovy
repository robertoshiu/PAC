package pactest

import java.util.Date;
import java.util.Set;
import org.bson.types.ObjectId;
import pac.Customer
import pac.OrderDetail

class Account {

	transient springSecurityService

	ObjectId id
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	String accName
	String accEmail
	Integer gender // 0: female, 1: male
	Date lastLogin
	Date createDate
	Set<String> functions
	Customer customer
	Authority authority

	static embedded = ['authority']
	static hasMany = [orderDetails: OrderDetail]
	
	static constraints = {
		username blank: false, unique: true
		password blank: false
		accEmail(email:true)
		lastLogin(nullable:true)
		customer(nullable:true)
	}

	def authorities() {
		if (!functions) functions = [] as Set
		functions << Authority.get(it).name
	}

	def beforeInsert() {
		encodePassword()
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
