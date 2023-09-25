part of 'add_bloc.dart';

abstract class AddState {}

abstract class AddActionState extends AddState {}

final class AddInitial extends AddState {}

final class AddStudentDetailsState extends AddState {
  File? image;
  String? name;
  String? age;
  String? batch;
  String? regnum;
  AddStudentDetailsState(
      {required this.image,
      required this.name,
      required this.age,
      required this.batch,
      required this.regnum});
}

final class AddSaveButtonClickedState extends AddActionState {}

final class AddStudentSuccessState extends AddActionState {}

final class AddStudentFailedState extends AddActionState {}
