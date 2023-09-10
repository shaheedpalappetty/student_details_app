// ignore_for_file: dead_code

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_app/const/colors/colors.dart';
import 'package:getx_student_app/controllers/card_controller.dart';
import 'package:getx_student_app/controllers/student_controller.dart';
import 'package:getx_student_app/models/student_model.dart';
import 'package:getx_student_app/widgets/card_item.dart';
import 'package:getx_student_app/widgets/custum_text_field.dart';
import 'package:image_picker/image_picker.dart';

class AddStudent extends StatelessWidget {
  final bool isEdit;
  int? index;
  AddStudent({super.key, this.isEdit = false, this.index});

  final TextEditingController studentname = TextEditingController();

  final TextEditingController studentBatch = TextEditingController();

  final TextEditingController studentRegNum = TextEditingController();

  final TextEditingController studentAge = TextEditingController();
  final RxString image = ''.obs;
  final CardController cardController = Get.put(CardController());
  StudentController controller = Get.find<StudentController>();
  fetchuserdata() {
    if (isEdit) {
      studentname.text = controller.studentList[index!].value.name;
      studentBatch.text = controller.studentList[index!].value.batch;
      studentRegNum.text =
          controller.studentList[index!].value.regnum.toString();
      studentAge.text = controller.studentList[index!].value.age.toString();
      image.value = controller.studentList[index!].value.image;
    }

    cardController.name.value = studentname.text;
    cardController.batch.value = studentBatch.text;
    cardController.regnum.value = studentRegNum.text;
    cardController.age.value = studentAge.text;
  }

  @override
  Widget build(BuildContext context) {
    fetchuserdata();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(isEdit ? 'Edit Student' : 'Add Student'),
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
                            Obx(
                              () => Stack(
                                children: [
                                  (image.value == '' && !isEdit)
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
                                        )
                                      : Container(
                                          width: 130,
                                          height: 130,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: FileImage(
                                                      File(image.value)),
                                                  fit: BoxFit.cover)),
                                        ),
                                  Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: SizedBox(
                                      height: 40,
                                      child: GestureDetector(
                                        onTap: () {
                                          //Select an Image
                                          imagePick();
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
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Obx(
                          () => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CardItemWidget(
                                // cardController: cardController,
                                title: 'AGE',
                                value: cardController.age.value,
                                // value:'${cardController.studentAge.value}'
                              ),
                              CardItemWidget(
                                // cardController: cardController,
                                title: 'BATCH',
                                value: cardController.batch.value,
                                // value: '${cardController.studentBatch.value}'
                              ),
                              CardItemWidget(
                                // cardController: cardController,
                                title: 'REG. NUMBER',
                                value: cardController.regnum.value,
                                // value: '${cardController.studentRegNum.value}'
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Obx(
                      () => Column(
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
                            cardController.name.value,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade200,
                            ),
                          )
                        ],
                      ),
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
              onChanged: (value) {
                cardController.name.value = value;
              },
            ),
            CustomTextField(
              hintText: 'Age',
              inputController: studentAge,
              inputType: TextInputType.number,
              maxLength: 2,
              onChanged: (value) {
                cardController.age.value = value;
              },
            ),
            CustomTextField(
              hintText: 'Batch',
              inputController: studentBatch,
              inputType: TextInputType.emailAddress,
              maxLength: 6,
              onChanged: (value) {
                cardController.batch.value = value;
              },
            ),
            CustomTextField(
              hintText: 'Register Number',
              inputController: studentRegNum,
              inputType: TextInputType.number,
              maxLength: 8,
              onChanged: (value) {
                cardController.regnum.value = value;
              },
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
                  if (isEdit) {
                    // Call updateStudent() only when 'isEdit' is true and 'student' is not null
                    updateStudent();
                  } else {
                    // Call addUser() when 'isEdit' is false or 'student' is null
                    addUser();
                  }
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

  imagePick() async {
    final imagePath =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePath != null) {
      image.value = imagePath.path;
    }
  }

  addUser() async {
    final studentObj = StudentModel(
        name: studentname.text,
        age: int.tryParse(studentAge.text) ?? 0,
        batch: studentBatch.text,
        regnum: int.tryParse(studentRegNum.text) ?? 0,
        image: image.value.toString());

    final result = await controller.addToStudentList(studentObj);

    if (result) {
      Get.back();
      Get.snackbar('Saved', 'Added Student Successfully');
    } else {
      Get.defaultDialog(
          title: 'Error',
          middleText: 'Failed to Add Student',
          backgroundColor: Colors.red);
    }
  }

  updateStudent() async {
    controller.studentList[index!].value.name = studentname.text;
    final studentObj = StudentModel(
      id: controller.studentList[index!].value.id, // Include the student ID
      name: studentname.text,
      age: int.tryParse(studentAge.text) ?? 0,
      batch: studentBatch.text,
      regnum: int.tryParse(studentRegNum.text) ?? 0,
      image: image.value.toString(),
    );
    final result = await controller.updateToStudentList(studentObj, index!);
    if (result) {
      Get.back();
      Get.snackbar('Updated', 'Updated Student Details Successfully');
    } else {
      Get.defaultDialog(
          title: 'Error',
          middleText: 'Failed to Update Student Details',
          backgroundColor: Colors.red);
    }
  }
}
