import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_app/controllers/student_controller.dart';
import 'package:getx_student_app/services/api_services.dart';
import 'package:getx_student_app/views/add_student_screen.dart';
import 'package:getx_student_app/views/home_page.dart';
import 'package:getx_student_app/widgets/card_details.dart';

class StudentDetails extends StatelessWidget {
  final int index;
  StudentDetails({super.key, required this.index});
  final StudentController controller = Get.find<StudentController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Get.to(() => AddStudent(
                    isEdit: true,
                    index: index,
                  ));
            },
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 20),
            icon: const Icon(Icons.delete),
            onPressed: () {
              Get.defaultDialog(
                title: 'Delete',
                middleText: 'Are you sure ?',
                textConfirm: 'Delete',
                onConfirm: () async {
                  final result = await StudentApi.deleteStudent(
                      controller.studentList[index].value.id!);
                  if (result) {
                    Get.offAll(() => HomePage());
                    Get.snackbar('Deleted', 'Deleted Student Successfully');
                  } else {
                    Get.defaultDialog(
                        title: 'Error',
                        middleText: 'Failed to Delete Student Details');
                  }
                },
                textCancel: 'Cancel',
                onCancel: () {},
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<StudentController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade900,
                    image: DecorationImage(
                        image: FileImage(
                            File(controller.studentList[index].value.image)),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 10,
              ),
              CardDetailsPage(
                  title: 'NAME',
                  value: controller.studentList[index].value.name),
              CardDetailsPage(
                  title: 'AGE',
                  value: controller.studentList[index].value.age.toString()),
              CardDetailsPage(
                  title: 'BATCH',
                  value: controller.studentList[index].value.batch),
              CardDetailsPage(
                  title: 'REG. NUMBER',
                  value: controller.studentList[index].value.regnum.toString()),
            ],
          );
        }),
      ),
    );
  }
}
