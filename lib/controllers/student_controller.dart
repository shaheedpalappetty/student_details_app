import 'package:get/get.dart';
import 'package:getx_student_app/models/student_model.dart';
import 'package:getx_student_app/services/api_services.dart';

class StudentController extends GetxController {
  final isLoading = true.obs;
  final studentList = <StudentModel>[].obs;

  @override
  void onInit() {
    fetchStudents();
    super.onInit();
  }

  void fetchStudents() async {
    try {
      isLoading(true);
      final students = await StudentApi.getStudents();
      studentList.value = students;
    } finally {
      isLoading(false);
    }
  }
}
