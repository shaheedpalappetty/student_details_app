import 'package:get/get.dart';
import 'package:getx_student_app/models/student_model.dart';
import 'package:getx_student_app/services/api_services.dart';

class StudentController extends GetxController {
  final isLoading = true.obs;
  List<Rx<StudentModel>> studentList = <Rx<StudentModel>>[];
// List<Rx<StudentModel>> searchstudentList = <Rx<StudentModel>>[];
  
  @override
  void onInit() {
    fetchStudents();
    update();
    super.onInit();
  }

  void fetchStudents() async {
    try {
      isLoading(true);
      final students = await StudentApi.getStudents();

      studentList = students.map((e) => e.obs).toList();
      update();
    } finally {
      isLoading(false);
    }
  }

  Future<bool> addToStudentList(StudentModel student) async {
    final response = await StudentApi.addStudent(student);
    if (response) {
      studentList.add(student.obs);
      update();
    }
    return response;
  }

  Future<bool> updateToStudentList(StudentModel student, int index) async {
    final response = await StudentApi.updateStudentDetails(student);
    if (response) {
      studentList[index] = student.obs;
      update();
    }
    return response;
  }
}
