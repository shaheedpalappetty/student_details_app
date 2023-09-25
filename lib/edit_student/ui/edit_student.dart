// ignore_for_file: dead_code, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_student_app/add_student/bloc/add_bloc.dart';

import 'package:getx_student_app/const/colors/colors.dart';
import 'package:getx_student_app/list_student/models/student_model.dart';
import 'package:getx_student_app/list_student/ui/list_student.dart';
import 'package:getx_student_app/widgets/card_item.dart';
import 'package:getx_student_app/widgets/custum_text_field.dart';
import 'package:image_picker/image_picker.dart';

class EditStudent extends StatefulWidget {
 final StudentModel student;
 const EditStudent({super.key, required this.student});

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  final TextEditingController studentname = TextEditingController();

  final TextEditingController studentBatch = TextEditingController();

  final TextEditingController studentRegNum = TextEditingController();

  final TextEditingController studentAge = TextEditingController();
  File? image;
  @override
  void initState() {
    super.initState();
    context.read<AddBloc>().add(AddStudentDetailsEvent(
        image: File(widget.student.image),
        name: widget.student.name,
        age: widget.student.age.toString(),
        batch: widget.student.batch,
        regnum: widget.student.regnum.toString()));
    studentname.text = widget.student.name;
    studentAge.text = widget.student.age.toString();
    studentBatch.text = widget.student.batch;
    studentRegNum.text = widget.student.regnum.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Edit Student'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey.shade900,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: BlocBuilder<AddBloc, AddState>(
                  buildWhen: (previous, current) => current is! AddActionState,
                  builder: (context, state) {
                    if (state is AddStudentDetailsState) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      state.image == null
                                          ? Container(
                                              width: 130,
                                              height: 130,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color: Colors.grey.shade700,
                                              ),
                                              child: Center(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .drive_folder_upload_outlined,
                                                      size: 20,
                                                      color:
                                                          Colors.grey.shade100,
                                                    ),
                                                    const SizedBox(height: 10),
                                                    const Text(
                                                      'Select\nprofile image',
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Container(
                                              width: 130,
                                              height: 130,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: FileImage(
                                                          state.image!),
                                                      fit: BoxFit.cover)),
                                            ),
                                      Positioned(
                                        bottom: 10,
                                        right: 10,
                                        child: SizedBox(
                                          height: 40,
                                          child: GestureDetector(
                                            onTap: () {
                                              imagePick(context);
                                            },
                                            child: const Row(
                                              children: [
                                                SizedBox(width: 4),
                                                CircleAvatar(
                                                    radius: 16,
                                                    child: Icon(Icons.edit,
                                                        size: 18)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CardItemWidget(
                                    title: 'AGE',
                                    value: state.age ?? '',
                                  ),
                                  CardItemWidget(
                                    title: 'BATCH',
                                    value: state.batch ?? '',
                                  ),
                                  CardItemWidget(
                                    title: 'REG. NUMBER',
                                    value: state.regnum ?? '',
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'NAME',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade500,
                                  letterSpacing: 4.0,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                state.name ?? '',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade200,
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<AddBloc, AddState>(
              listenWhen: (previous, current) => current is AddActionState,
              listener: (context, state) {
                if (state is AddStudentSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(10),
                      content: Text(
                        'Updated Student Details Successfully',
                      )));
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
                }
                if (state is AddStudentFailedState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Color.fromARGB(255, 245, 7, 7),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(10),
                      content: Text(
                        'Updating Student Details Failed',
                      )));
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
                }
              },
              builder: (context, state) {
                if (state is AddStudentDetailsState) {
                  return Column(
                    children: [
                      CustomTextField(
                        hintText: 'Full Name',
                        inputController: studentname,
                        inputType: TextInputType.name,
                        onChanged: (value) {
                          context.read<AddBloc>().add(AddStudentDetailsEvent(
                              image: state.image,
                              name: studentname.text,
                              age: state.age,
                              batch: state.batch,
                              regnum: state.regnum));
                        },
                      ),
                      CustomTextField(
                        hintText: 'Age',
                        inputController: studentAge,
                        inputType: TextInputType.number,
                        maxLength: 2,
                        onChanged: (value) {
                          context.read<AddBloc>().add(AddStudentDetailsEvent(
                              image: state.image,
                              name: state.name,
                              age: studentAge.text,
                              batch: state.batch,
                              regnum: state.regnum));
                        },
                      ),
                      CustomTextField(
                        hintText: 'Batch',
                        inputController: studentBatch,
                        inputType: TextInputType.number,
                        maxLength: 4,
                        onChanged: (value) {
                          context.read<AddBloc>().add(AddStudentDetailsEvent(
                              image: state.image,
                              name: state.name,
                              age: state.age,
                              batch: studentBatch.text,
                              regnum: state.regnum));
                        },
                      ),
                      CustomTextField(
                        hintText: 'Register Number',
                        inputController: studentRegNum,
                        inputType: TextInputType.number,
                        maxLength: 8,
                        onChanged: (value) {
                          context.read<AddBloc>().add(AddStudentDetailsEvent(
                              image: state.image,
                              name: state.name,
                              age: state.age,
                              batch: state.batch,
                              regnum: studentRegNum.text));
                        },
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 50,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  CustomColors.primaryColor.shade500)),
                          onPressed: () {
                            final studentObj = StudentModel(
                                id: widget.student.id,
                                name: studentname.text,
                                age: int.tryParse(studentAge.text) ?? 0,
                                batch: studentBatch.text,
                                regnum: int.tryParse(studentRegNum.text) ?? 0,
                                image:
                                    state.image?.path ?? widget.student.image);
                            context.read<AddBloc>().add(
                                EditUpdateButtonEvent(student: studentObj));
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }

  imagePick(BuildContext context) async {
    final imagePath =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePath != null) {
      image = File(imagePath.path);
      context.read<AddBloc>().add(AddStudentDetailsEvent(
          name: studentname.text,
          age: studentAge.text,
          batch: studentBatch.text,
          regnum: studentRegNum.text,
          image: image));
    }
  }
}
