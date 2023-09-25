// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:getx_student_app/list_student/repos/list_student_repo.dart';

part 'deatails_event.dart';
part 'deatails_state.dart';

class DeatailsBloc extends Bloc<DeatailsEvent, DeatailsState> {
  DeatailsBloc() : super(DeatailsInitial()) {
    on<DeatailsEditPageNavigationEvent>(deatailsEditPageNavigationEvent);
    on<DeatailsDeleteDialogueBoxEvent>(deatailsDeleteDialogueBoxEvent);
    on<DeatailsDeleteStudentEvent>(deatailsDeleteStudentEvent);
  }

  FutureOr<void> deatailsEditPageNavigationEvent(
      DeatailsEditPageNavigationEvent event, Emitter<DeatailsState> emit) {
    emit(DeatailsEditPageNavigationState());
  }

  FutureOr<void> deatailsDeleteDialogueBoxEvent(
      DeatailsDeleteDialogueBoxEvent event, Emitter<DeatailsState> emit) {
    emit(DeatailsDeleteDialogueBoxState());
  }

  FutureOr<void> deatailsDeleteStudentEvent(
      DeatailsDeleteStudentEvent event, Emitter<DeatailsState> emit) async {
    final status = await StudentApi.deleteStudent(event.id);
    if (status) {
      emit(DeatailsDeleteStudentSuccessState());
    } else {
      emit(DeatailsDeleteStudentFailureState());
    }
  }
}
