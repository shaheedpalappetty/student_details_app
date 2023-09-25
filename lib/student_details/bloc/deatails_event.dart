part of 'deatails_bloc.dart';

abstract class DeatailsEvent {}

final class DeatailsEditPageNavigationEvent extends DeatailsEvent {}

final class DeatailsDeleteDialogueBoxEvent extends DeatailsEvent {}

final class DeatailsDeleteStudentEvent extends DeatailsEvent {
  BuildContext context;
  int id;
  DeatailsDeleteStudentEvent({required this.context, required this.id});
}
