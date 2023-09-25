part of 'list_student_bloc.dart';

abstract class ListStudentState {}

abstract class ListStudentActionState extends ListStudentState {}

final class ListStudentInitial extends ListStudentState {}

final class ListStudentLoadingState extends ListStudentState {}

final class ListStudentSuccessState extends ListStudentState {
  List<StudentModel> studentList = [];
  ListStudentSuccessState({required this.studentList});
}

final class ListStudentErrorState extends ListStudentState {}

final class ListStudentAddStudentButtonClickedState
    extends ListStudentActionState {}

final class ListStudentStudentDetailsTileClicked
    extends ListStudentActionState {
  StudentModel student;
  ListStudentStudentDetailsTileClicked({required this.student});
}
