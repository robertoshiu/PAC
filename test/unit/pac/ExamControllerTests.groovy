package pac



import org.junit.*
import grails.test.mixin.*

@TestFor(ExamController)
@Mock(Exam)
class ExamControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/exam/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.examInstanceList.size() == 0
        assert model.examInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.examInstance != null
    }

    void testSave() {
        controller.save()

        assert model.examInstance != null
        assert view == '/exam/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/exam/show/1'
        assert controller.flash.message != null
        assert Exam.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/exam/list'

        populateValidParams(params)
        def exam = new Exam(params)

        assert exam.save() != null

        params.id = exam.id

        def model = controller.show()

        assert model.examInstance == exam
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/exam/list'

        populateValidParams(params)
        def exam = new Exam(params)

        assert exam.save() != null

        params.id = exam.id

        def model = controller.edit()

        assert model.examInstance == exam
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/exam/list'

        response.reset()

        populateValidParams(params)
        def exam = new Exam(params)

        assert exam.save() != null

        // test invalid parameters in update
        params.id = exam.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/exam/edit"
        assert model.examInstance != null

        exam.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/exam/show/$exam.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        exam.clearErrors()

        populateValidParams(params)
        params.id = exam.id
        params.version = -1
        controller.update()

        assert view == "/exam/edit"
        assert model.examInstance != null
        assert model.examInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/exam/list'

        response.reset()

        populateValidParams(params)
        def exam = new Exam(params)

        assert exam.save() != null
        assert Exam.count() == 1

        params.id = exam.id

        controller.delete()

        assert Exam.count() == 0
        assert Exam.get(exam.id) == null
        assert response.redirectedUrl == '/exam/list'
    }
}
