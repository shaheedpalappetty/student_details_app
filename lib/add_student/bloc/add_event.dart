part of 'add_bloc.dart';

abstract class AddEvent {}

final class AddStudentDetailsEvent extends AddEvent {
  File? image;
  String? name;
  String? age;
  String? batch;
  String? regnum;
  AddStudentDetailsEvent(
      {required this.image,
      required this.name,
      required this.age,
      required this.batch,
      required this.regnum});
}

final class AddSaveButtonClickedEvent extends AddEvent {
  StudentModel student;
  AddSaveButtonClickedEvent({required this.student});
}

final class EditUpdateButtonEvent extends AddEvent {
  StudentModel student;
  
  EditUpdateButtonEvent({required this.student});
}
