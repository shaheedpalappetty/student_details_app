import 'package:flutter/material.dart';

import 'package:getx_student_app/widgets/card_details.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 20),
            icon: const Icon(Icons.delete),
            onPressed: () {},
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
                // image: DecorationImage(
                //     image:
                //         FileImage(File(student.value.studentProfile!)))
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CardDetailsPage(title: 'NAME', value: 'Shaheed Palappetty'),
            CardDetailsPage(title: 'AGE', value: '32'),
            CardDetailsPage(title: 'BATCH', value: 'BCK 104'),
            CardDetailsPage(title: 'REG. NUMBER', value: '126025'),
          ],
        ),
      ),
    );
  }
}
