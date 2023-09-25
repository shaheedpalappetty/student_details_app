import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_student_app/add_student/bloc/add_bloc.dart';

import 'package:getx_student_app/const/colors/colors.dart';
import 'package:getx_student_app/list_student/bloc/list_student_bloc.dart';
import 'package:getx_student_app/list_student/ui/list_student.dart';
import 'package:getx_student_app/student_details/bloc/deatails_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ListStudentBloc(),
        ),
        BlocProvider(
          create: (context) => AddBloc(),
        ),
        BlocProvider(
          create: (context) => DeatailsBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student App with GetX',
        theme: ThemeData(
          progressIndicatorTheme: ProgressIndicatorThemeData(
              color: CustomColors.primaryColor.shade100,
              circularTrackColor: CustomColors.primaryColor),
          brightness: Brightness.dark, // Use the dark theme
          fontFamily: 'outfit', // Set your custom font here
          primaryColor: CustomColors.primaryColor,
          primaryColorDark: CustomColors.primaryColor,
          primaryColorLight: CustomColors.primaryColor,
          hintColor: CustomColors.primaryColor,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const HomePage(),
      ),
    );
  }
}
