import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx_student_app/model/student_model.dart';

final studentProvider =
    StateNotifierProvider<StudentController, List<StudentModel>>((ref) {
  return StudentController();
});

class StudentController extends StateNotifier<List<StudentModel>> {
  StudentController() : super([]);
  addStudent(StudentModel user) {
    state = [...state, user];
  }

  deleteStudent(int index) {
    state.removeAt(index);
    state = [...state];
  }

  updateStudent(StudentModel user, int index) {
    state[index] = user;
    state = [...state];
  }
}
