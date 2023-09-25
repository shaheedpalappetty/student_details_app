part of 'list_student_bloc.dart';

abstract class ListStudentEvent {}

final class ListStudentFetchStudentsEvent extends ListStudentEvent {}

final class ListStudentAddStudentNavigationEvent extends ListStudentEvent {}

final class ListStudentStudentDetailsNavigationEvent extends ListStudentEvent {
  StudentModel student;
  ListStudentStudentDetailsNavigationEvent({required this.student});
}
