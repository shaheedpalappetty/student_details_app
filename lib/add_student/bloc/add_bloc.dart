import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:getx_student_app/list_student/models/student_model.dart';
import 'package:getx_student_app/list_student/repos/list_student_repo.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc() : super(AddInitial()) {
    on<AddStudentDetailsEvent>(addStudentDetailsEvent);
    on<AddSaveButtonClickedEvent>(addSaveButtonClickedEvent);
    on<EditUpdateButtonEvent>(editUpdateButtonEvent);
  }

  FutureOr<void> addStudentDetailsEvent(
      AddStudentDetailsEvent event, Emitter<AddState> emit) {
    emit(AddStudentDetailsState(
        image: event.image,
        name: event.name,
        age: event.age,
        batch: event.batch,
        regnum: event.regnum));
  }

  FutureOr<void> addSaveButtonClickedEvent(
      AddSaveButtonClickedEvent event, Emitter<AddState> emit) async {
    final status = await StudentApi.addStudent(event.student);
    if (status) {
      emit(AddStudentSuccessState());
    } else {
      emit(AddStudentFailedState());
    }
  }

  FutureOr<void> editUpdateButtonEvent(
      EditUpdateButtonEvent event, Emitter<AddState> emit) async {
    final status = await StudentApi.updateStudentDetails(event.student);
    if (status) {
      emit(AddStudentSuccessState());
    } else {
      emit(AddStudentFailedState());
    }
  }
}
