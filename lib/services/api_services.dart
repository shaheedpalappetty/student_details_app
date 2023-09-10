import 'dart:convert';

import 'package:getx_student_app/models/student_model.dart';
import 'package:http/http.dart' as http;

class StudentApi {
  static var client = http.Client();
  static Future<List<StudentModel>> getStudents() async {
    const url = 'http://10.0.2.2:8080/listusers';
    final uri = Uri.parse(url);
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final result = body['users'] as List<dynamic>;
      final studentList = result.map((e) => StudentModel.fromJson(e)).toList();
      return studentList;
    } else {
      print('error${response.statusCode}');
      return [];
    }
  }

  static Future<bool> addStudent(StudentModel student) async {
    const url = 'http://10.0.2.2:8080/adduser';
    final uri = Uri.parse(url);
    final user = student.toJson();
    final body = jsonEncode(user);

    final response = await client.post(uri, body: body, headers: {
      'Content-Type': 'application/json',
    });
    return response.statusCode == 200;
  }

  static Future<bool> updateStudentDetails(StudentModel student) async {
    int id = student.id!;
    final url = 'http://10.0.2.2:8080/updateuser/$id';
    final uri = Uri.parse(url);
    final user = student.toJson();
    final body = jsonEncode(user);
    final response = await client
        .put(uri, body: body, headers: {'Content-Type': 'application/json'});
    return response.statusCode == 200;
  }

  static Future<bool> deleteStudent(int id) async {
    final url = 'http://10.0.2.2:8080/deleteuser/$id';
    final uri = Uri.parse(url);

    final response = await client.delete(uri);
    return response.statusCode == 200;
  }

  static Future<List<StudentModel>> searchStudents(String name) async {
    final url = 'http://10.0.2.2:8080/searchuser/$name';
    final uri = Uri.parse(url);
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final result = body['users'] as List<dynamic>;
      final studentlist = result.map((e) => StudentModel.fromJson(e)).toList();
      return studentlist;
    } else {
      return [];
    }
  }
}
