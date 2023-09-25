import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:getx_student_app/list_student/models/student_model.dart';
import 'package:getx_student_app/list_student/repos/list_student_repo.dart';

part 'list_student_event.dart';
part 'list_student_state.dart';

class ListStudentBloc extends Bloc<ListStudentEvent, ListStudentState> {
  ListStudentBloc() : super(ListStudentInitial()) {
    on<ListStudentFetchStudentsEvent>(listStudentFetchStudentsEvent);
    on<ListStudentStudentDetailsNavigationEvent>(
        listStudentStudentDetailsNavigationEvent);
    on<ListStudentAddStudentNavigationEvent>(
        listStudentAddStudentNavigationEvent);
  }

  FutureOr<void> listStudentFetchStudentsEvent(
      ListStudentFetchStudentsEvent event,
      Emitter<ListStudentState> emit) async {
    emit(ListStudentLoadingState());
    final studentLists = await StudentApi.getStudents();
    if (studentLists.isNotEmpty) {
      emit(ListStudentSuccessState(studentList: studentLists));
    } else {
      emit(ListStudentErrorState());
    }
  }

  FutureOr<void> listStudentStudentDetailsNavigationEvent(
      ListStudentStudentDetailsNavigationEvent event,
      Emitter<ListStudentState> emit) {
    emit(ListStudentStudentDetailsTileClicked(student: event.student));
  }

  FutureOr<void> listStudentAddStudentNavigationEvent(
      ListStudentAddStudentNavigationEvent event,
      Emitter<ListStudentState> emit) {
    emit(ListStudentAddStudentButtonClickedState());
  }
}
