// ignore_for_file: dead_code

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx_student_app/const/colors/colors.dart';
import 'package:getx_student_app/controllers/image_controller.dart';
import 'package:getx_student_app/controllers/student_controllers.dart';
import 'package:getx_student_app/model/student_model.dart';
import 'package:getx_student_app/widgets/card_item.dart';
import 'package:getx_student_app/widgets/custum_text_field.dart';
import 'package:image_picker/image_picker.dart';

class AddStudent extends ConsumerWidget {
  final bool isEdit;
  final int? index;
  final StudentModel? student;
  AddStudent({super.key, this.isEdit = false, this.student, this.index});

  final TextEditingController studentname = TextEditingController();

  final TextEditingController studentBatch = TextEditingController();

  final TextEditingController studentRegNum = TextEditingController();

  final TextEditingController studentAge = TextEditingController();
  bool imageCheck = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final img = ref.watch(image);
    if (isEdit) {
      imageCheck = true;
      studentname.text = student!.name;
      studentBatch.text = student!.batch;
      studentRegNum.text = student!.regnum;

      studentAge.text = student!.age;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(isEdit ? 'Edit Details' : 'Add Student'),
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
                child: Column(
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
                                imageCheck
                                    ? Container(
                                        height: 130,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: FileImage(File(isEdit
                                                    ? student!.image
                                                    : img)))),
                                      )
                                    : Container(
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
                                                color: Colors.grey.shade100,
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                'Select\nprofile image',
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: SizedBox(
                                    height: 40,
                                    child: GestureDetector(
                                      onTap: () {
                                        //Select an Image
                                        imagePick(ref);
                                      },
                                      child: const Row(
                                        children: [
                                          SizedBox(width: 4),
                                          CircleAvatar(
                                              radius: 16,
                                              child:
                                                  Icon(Icons.edit, size: 18)),
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
                              value: '',
                            ),
                            CardItemWidget(
                              title: 'BATCH',
                              value: '',
                            ),
                            CardItemWidget(
                              title: 'REG. NUMBER',
                              value: '',
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
                          '',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade200,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'Full Name',
              inputController: studentname,
              inputType: TextInputType.name,
              onChanged: (value) {},
            ),
            CustomTextField(
              hintText: 'Age',
              inputController: studentAge,
              inputType: TextInputType.number,
              maxLength: 2,
              onChanged: (value) {},
            ),
            CustomTextField(
              hintText: 'Batch',
              inputController: studentBatch,
              inputType: TextInputType.number,
              maxLength: 4,
              onChanged: (value) {},
            ),
            CustomTextField(
              hintText: 'Register Number',
              inputController: studentRegNum,
              inputType: TextInputType.number,
              maxLength: 8,
              onChanged: (value) {},
            ),
            Container(
              width: double.maxFinite,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        CustomColors.primaryColor.shade500)),
                onPressed: () {
                  isEdit
                      ? updateStudent(img, ref, index!, context)
                      : addStudent(img, ref, context);
                },
                child: Text(
                  isEdit ? 'Update' : 'Save',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  imagePick(WidgetRef ref) async {
    final imagePath =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePath != null) {
      ref.read(image.notifier).state = imagePath.path;
      imageCheck = true;
    }
  }

  addStudent(String img, WidgetRef ref, BuildContext context) {
    final name = studentname.text.trim();
    final age = studentAge.text.trim();
    final batch = studentBatch.text.trim();
    final regnum = studentRegNum.text.trim();
    if (name.isNotEmpty &&
        age.isNotEmpty &&
        batch.isNotEmpty &&
        regnum.isNotEmpty &&
        img != '') {
      final user = StudentModel(
        name: name,
        age: age,
        batch: batch,
        regnum: regnum,
        image: img,
      );
      ref.read(studentProvider.notifier).addStudent(user);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          content: Text(
            'Added Succesfully',
          )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromARGB(255, 255, 87, 58),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          content: Text(
            'Fill all colums',
          )));
    }
  }

  updateStudent(String img, WidgetRef ref, int index, BuildContext context) {
    final name = studentname.text.trim();
    final age = studentAge.text.trim();
    final batch = studentBatch.text.trim();
    final regnum = studentRegNum.text.trim();
    if (name.isNotEmpty &&
        age.isNotEmpty &&
        batch.isNotEmpty &&
        regnum.isNotEmpty &&
        img != '') {
      final user = StudentModel(
        name: name,
        age: age,
        batch: batch,
        regnum: regnum,
        image: img,
      );

      ref.read(studentProvider.notifier).updateStudent(user, index);

      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          content: Text(
            'Updated Succesfully',
          )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromARGB(255, 255, 87, 58),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          content: Text(
            'Failed to Update',
          )));
    }
  }
}
