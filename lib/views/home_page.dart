import 'package:flutter/material.dart';
import 'package:getx_student_app/const/colors/colors.dart';
import 'package:get/get.dart';
import 'package:getx_student_app/views/add_student_screen.dart';
import 'package:getx_student_app/views/student_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            Get.to(() => AddStudent());
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          onChanged: (value) {},
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                              hintText: 'Search Students',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600),
                              focusedBorder: InputBorder.none),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey.shade900,
                  ),
                  child: ListTile(
                    onTap: () {
                      Get.to(() => const StudentDetails());
                    },
                    minVerticalPadding: 25,
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundColor: Color.fromARGB(255, 30, 215, 96),
                      // child: Text('${index + 1}'.toString()),
                      // backgroundImage:
                      // FileImage(File(item.value.studentProfile!)),
                    ),
                    title: const Text(
                      'Shaheed',
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
