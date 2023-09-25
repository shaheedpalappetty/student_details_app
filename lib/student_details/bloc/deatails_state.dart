part of 'deatails_bloc.dart';

abstract class DeatailsState {}

abstract class DeatailsActionState extends DeatailsState {}

final class DeatailsInitial extends DeatailsState {}

final class DeatailsEditPageNavigationState extends DeatailsActionState {}

final class DeatailsDeleteDialogueBoxState extends DeatailsActionState {}

final class DeatailsDeleteStudentSuccessState extends DeatailsActionState {}

final class DeatailsDeleteStudentFailureState extends DeatailsActionState {}
