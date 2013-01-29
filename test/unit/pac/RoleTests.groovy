package pac

import static org.junit.Assert.*

import grails.test.mixin.*
import grails.test.mixin.support.*
import org.junit.*

import pac.Role;

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
@Mock(Role)
class RoleTests {

    void setUp() {
        // Setup logic here
    }

    void tearDown() {
        // Tear down logic here
    }

    void testSomething() {
		
		java.lang.System.getenv("VCAP_SERVICES")
		def role = new Role(name:'ROLE_ADMIN').save()
		if (!role) {
		    role.errors.each {
		        println it
		    }
		} else println role
		println 'in test 2'
		Set<String> funcs = new HashSet<String>()
		funcs.add('PERM_NEWS')
		println funcs
		println 'in test 3'
		role.functions = funcs
		println role.authority
		assert role.authority == 'ROLE_ADMIN,PERM_NEWS'
        // fail "Implement me"
    }
}
