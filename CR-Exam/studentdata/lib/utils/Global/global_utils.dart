import 'dart:io';

import '../../headers.dart';

class Globals {
  String? student_name, student_grid, student_standard;
  File? student_image;
  List<Map<String, dynamic>> StudentData = [
    {
      'student_name': 'abc',
      'student_image':
          'https://static.vecteezy.com/system/resources/thumbnails/007/469/004/small/graduated-student-in-simple-flat-personal-profile-icon-or-symbol-people-concept-illustration-vector.jpg',
      'student_grid': 1,
      'student_standard': 12,
      'nameController': TextEditingController(),
      'imageController': TextEditingController(),
      'gridController': TextEditingController(),
      'stdController': TextEditingController(),
    },
    {
      'student_name': 'abc',
      'student_image':
          'https://static.vecteezy.com/system/resources/thumbnails/007/469/004/small/graduated-student-in-simple-flat-personal-profile-icon-or-symbol-people-concept-illustration-vector.jpg',
      'student_grid': 1,
      'student_standard': 12,
      'imageController': TextEditingController(),
      'gridController': TextEditingController(),
      'stdController': TextEditingController(),
    },
  ];

  static Globals globals = Globals();
}
