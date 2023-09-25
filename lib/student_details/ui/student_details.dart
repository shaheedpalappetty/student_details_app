import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_student_app/edit_student/ui/edit_student.dart';
import 'package:getx_student_app/list_student/models/student_model.dart';
import 'package:getx_student_app/list_student/ui/list_student.dart';
import 'package:getx_student_app/student_details/bloc/deatails_bloc.dart';

import 'package:getx_student_app/widgets/card_details.dart';

class StudentDetails extends StatelessWidget {
  final StudentModel student;
  const StudentDetails({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditStudent(student: student),
              ));
            },
          ),
          BlocListener<DeatailsBloc, DeatailsState>(
            listenWhen: (previous, current) => current is DeatailsActionState,
            listener: (context, state) {
              if (state is DeatailsDeleteDialogueBoxState) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Delete Student'),
                      content: const Text('Are you sure you want to delete'),
                      actions: [
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Delete'),
                          onPressed: () async {
                            context.read<DeatailsBloc>().add(
                                DeatailsDeleteStudentEvent(
                                    context: context, id: student.id!));
                          },
                        ),
                      ],
                    );
                  },
                );
              } else if (state is DeatailsDeleteStudentSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(10),
                    content: Text(
                      'Deleted Student Details Successfully',
                    )));
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
              } else if (state is DeatailsDeleteStudentFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Color.fromARGB(255, 245, 7, 7),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(10),
                    content: Text(
                      'Deleting Student Details Failed',
                    )));
                Navigator.of(context).pop();
              }
            },
            child: IconButton(
              padding: const EdgeInsets.only(right: 20),
              icon: const Icon(Icons.delete),
              onPressed: () {
                context
                    .read<DeatailsBloc>()
                    .add(DeatailsDeleteDialogueBoxEvent());
              },
            ),
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
                image: DecorationImage(
                    image: FileImage(File(student.image)), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade900,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CardDetailsPage(title: 'NAME', value: student.name),
            CardDetailsPage(title: 'AGE', value: student.age.toString()),
            CardDetailsPage(title: 'BATCH', value: student.batch),
            CardDetailsPage(
                title: 'REG. NUMBER', value: student.regnum.toString()),
          ],
        ),
      ),
    );
  }
}
