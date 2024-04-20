import 'dart:io';

class Globals {
  String? student_name, student_grid, student_standard;
  File? student_image;
  List<Map<String, dynamic>> StudentData = [];

  void reset() {
    student_name = student_grid = student_standard = student_image = null;
  }

  static Globals globals = Globals();
}
