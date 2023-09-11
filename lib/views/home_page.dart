import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx_student_app/const/colors/colors.dart';
import 'package:getx_student_app/controllers/student_controllers.dart';

import 'package:getx_student_app/views/add_student_screen.dart';
import 'package:getx_student_app/views/student_details.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentList = ref.watch(studentProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.settings),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15, right: 15),
        child: FloatingActionButton.extended(
          backgroundColor: CustomColors.primaryColor.shade500,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(4)),
          elevation: 0,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddStudent()));
          },
          label: const Text(
            'Add Student',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            studentList.isEmpty
                ? const Center(
                    child: Text('Nothing to Display'),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: studentList.length,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final student = studentList[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.shade900,
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return StudentDetails(
                                  index: index,
                                  student: student,
                                );
                              },
                            ));
                          },
                          minVerticalPadding: 25,
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color.fromARGB(255, 30, 215, 96),
                            backgroundImage: FileImage(File(student.image)),
                          ),
                          title: Text(
                            student.name,
                            style: TextStyle(fontSize: 18),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 14,
                          ),
                        ),
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
