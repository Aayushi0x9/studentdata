import 'dart:io';

class Globals {
  String? student_name, student_grid, student_standard;
  File? student_image;
  List<Map<String, dynamic>> StudentData = [
    // {
    //   'student_name': 'abc',
    //   'student_image':
    //       'https://static.vecteezy.com/system/resources/thumbnails/007/469/004/small/graduated-student-in-simple-flat-personal-profile-icon-or-symbol-people-concept-illustration-vector.jpg',
    //   'student_grid': '',
    //   'student_standard': '',
    //   'imageController': TextEditingController(),
    //   'gridController': TextEditingController(),
    //   'stdController': TextEditingController(),
    // },
  ];

  void reset() {
    student_name = student_grid = student_standard = student_image = null;
  }

  static Globals globals = Globals();
}
