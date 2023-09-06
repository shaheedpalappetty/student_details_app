import 'package:flutter/material.dart';
import 'package:getx_student_app/const/colors/colors.dart';
import 'package:getx_student_app/views/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      home:  HomePage(),
    );
  }
}
