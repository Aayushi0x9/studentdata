class studentDataModel {
  String? student_name, student_image;
  late final int student_grid;
  String? student_standard;

  studentDataModel({
    required this.student_name,
    required this.student_image,
    required this.student_grid,
    required this.student_standard,
  });

  factory studentDataModel.formMap({required Map<String, dynamic> data}) =>
      studentDataModel(
        student_name: data['student_name'],
        student_image: data['student_image'],
        student_grid: data['student_grid'],
        student_standard: data['student_standard'],
      );
}
