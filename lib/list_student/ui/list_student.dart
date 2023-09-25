import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_student_app/add_student/ui/add_student_screen.dart';
import 'package:getx_student_app/const/colors/colors.dart';
import 'package:getx_student_app/list_student/bloc/list_student_bloc.dart';
import 'package:getx_student_app/student_details/ui/student_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ListStudentBloc>().add(ListStudentFetchStudentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            context
                .read<ListStudentBloc>()
                .add(ListStudentAddStudentNavigationEvent());
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
            const SizedBox(
              height: 15,
            ),
            BlocConsumer<ListStudentBloc, ListStudentState>(
              listenWhen: (previous, current) =>
                  current is ListStudentActionState,
              buildWhen: (previous, current) =>
                  current is! ListStudentActionState,
              listener: (context, state) {
                if (state is ListStudentAddStudentButtonClickedState) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddStudent(),
                  ));
                }
                if (state is ListStudentStudentDetailsTileClicked) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        StudentDetails(student: state.student),
                  ));
                }
              },
              builder: (context, state) {
                if (state is ListStudentSuccessState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.studentList.length,
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
                           context.read<ListStudentBloc>().add(
                                ListStudentStudentDetailsNavigationEvent(
                                    student: state.studentList[index]));
                          },
                          minVerticalPadding: 25,
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor:
                                const Color.fromARGB(255, 30, 215, 96),
                            backgroundImage:
                                FileImage(File(state.studentList[index].image)),
                          ),
                          title: Text(
                            state.studentList[index].name,
                            style: const TextStyle(fontSize: 18),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 14,
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is ListStudentLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ListStudentErrorState) {
                  return const Center(
                    child: Text(
                      'Nothing to Display',
                      style: TextStyle(color: Colors.white),
                    ),
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
}
