import 'package:flutter/cupertino.dart';
import 'package:studentdata/headers.dart';

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
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(5),
            width: size.width,
            height: size.height * 0.05,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Name',
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    letterSpacing: 2,
                    fontSize: 18,
                  ),
                ),
                Text(
                  data['student_name'],
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    letterSpacing: 2,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(5),
            width: size.width,
            height: size.height * 0.05,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'GRID',
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    letterSpacing: 2,
                    fontSize: 18,
                  ),
                ),
                Text(
                  data['student_grid'],
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    letterSpacing: 2,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(5),
            width: size.width,
            height: size.height * 0.05,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Standard',
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    letterSpacing: 2,
                    fontSize: 18,
                  ),
                ),
                Text(
                  data['student_standard'],
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    letterSpacing: 2,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
