// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_app/const/colors/colors.dart';
import 'package:getx_student_app/widgets/card_item.dart';
import 'package:getx_student_app/widgets/custum_text_field.dart';

class AddStudent extends StatelessWidget {
  AddStudent({super.key});

  final TextEditingController studentname = TextEditingController();

  final TextEditingController studentBatch = TextEditingController();

  final TextEditingController studentRegNum = TextEditingController();

  final TextEditingController studentAge = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Add Student'),
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
                                Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
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
                                          Icons.drive_folder_upload_outlined,
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
                              // cardController: cardController,
                              title: 'AGE',
                              value: '32',
                              // value:'${cardController.studentAge.value}'
                            ),
                            CardItemWidget(
                              // cardController: cardController,
                              title: 'BATCH',
                              value: 'BCK104',
                              // value: '${cardController.studentBatch.value}'
                            ),
                            CardItemWidget(
                              // cardController: cardController,
                              title: 'REG. NUMBER',
                              value: '126025',
                              // value: '${cardController.studentRegNum.value}'
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
                          'Shaheed Palappetty',
                          // '${cardController.studentName.value}',
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
              onChanged: (value) {
                // cardController.updateName(value);
              },
            ),
            CustomTextField(
              hintText: 'Age',
              inputController: studentAge,
              inputType: TextInputType.number,
              maxLength: 2,
              onChanged: (value) {
                // cardController.updateAge(value);
              },
            ),
            CustomTextField(
              hintText: 'Batch',
              inputController: studentBatch,
              inputType: TextInputType.number,
              maxLength: 4,
              onChanged: (value) {
                //   cardController.updateBatch(value);
              },
            ),
            CustomTextField(
              hintText: 'Register Number',
              inputController: studentRegNum,
              inputType: TextInputType.number,
              maxLength: 8,
              onChanged: (value) {
                // cardController.updateRegNum(value);
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
                  // addStudent();
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
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
}
