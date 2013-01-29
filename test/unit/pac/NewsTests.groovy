package pac



import grails.test.mixin.*
import org.junit.*


/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(News)
class NewsTests {

    void testSomething() {
       fail java.lang.System.getenv("VCAP_SERVICES")
    }
}
