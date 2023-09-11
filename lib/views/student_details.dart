import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx_student_app/controllers/student_controllers.dart';
import 'package:getx_student_app/model/student_model.dart';
import 'package:getx_student_app/views/add_student_screen.dart';

import 'package:getx_student_app/widgets/card_details.dart';

class StudentDetails extends ConsumerWidget {
  final StudentModel student;
  final int index;
  const StudentDetails({super.key, required this.student, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return AddStudent(
                    student: student,
                    index: index,
                    isEdit: true,
                  );
                },
              ));
            },
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 20),
            icon: const Icon(Icons.delete),
            onPressed: () {
              confirmSnacbar(context, ref, index);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              width: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade900,
                  image:
                      DecorationImage(image: FileImage(File(student.image)))),
            ),
            const SizedBox(
              height: 10,
            ),
            CardDetailsPage(title: 'NAME', value: student.name),
            CardDetailsPage(title: 'AGE', value: student.age),
            CardDetailsPage(title: 'BATCH', value: student.batch),
            CardDetailsPage(title: 'REG. NUMBER', value: student.regnum),
          ],
        ),
      ),
    );
  }

  confirmSnacbar(BuildContext context, WidgetRef ref, index) {
    showDialog(
        barrierColor: const Color.fromARGB(169, 0, 0, 0),
        context: context,
        builder: (ctx1) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 65, 63, 63),
            title: const Text(
              'Deleting...',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text('Are you sure',
                style: TextStyle(color: Colors.white)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.white))),
              ElevatedButton(
                  onPressed: () {
                    ref.watch(studentProvider.notifier).deleteStudent(index);
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child:
                      const Text('Yes', style: TextStyle(color: Colors.white)))
            ],
          );
        });
  }
}
