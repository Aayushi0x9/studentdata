import 'package:flutter/cupertino.dart';
import 'package:studentdata/headers.dart';
import 'package:studentdata/view/Pages/DetailPage/Component/detaildata.dart';

import '../../../utils/Global/global_utils.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, dynamic> data = (ModalRoute.of(context)?.settings.arguments ??
        Globals.globals.StudentData[0]) as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'DetailPage',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        titleSpacing: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          CircleAvatar(
            radius: size.height * 0.07,
            backgroundColor: Colors.grey,
            foregroundImage: Globals.globals.student_image == null
                ? null
                : FileImage(Globals.globals.student_image!),
          ),
          SizedBox(height: size.height * 0.02),
          DetailData(
              size: size,
              data: data,
              headername: 'Name',
              headeransvar: 'student_name'),
          DetailData(
              size: size,
              data: data,
              headername: 'GRID',
              headeransvar: 'student_grid'),
          DetailData(
              size: size,
              data: data,
              headername: 'Standard',
              headeransvar: 'student_standard'),
        ],
      ),
    );
  }
}
