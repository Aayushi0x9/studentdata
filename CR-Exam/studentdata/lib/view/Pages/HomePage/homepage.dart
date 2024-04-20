import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:studentdata/headers.dart';

import '../../../utils/Global/global_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> getImage({required ImageSource source}) async {
    ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(
      source: source,
    );

    if (file != null) {
      Globals.globals.student_image = File(file.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '👨🏼‍🎓 StudentData 👨🏼‍🎓',
          style: TextStyle(color: Colors.white, fontSize: 24, letterSpacing: 2),
        ),
        centerTitle: true,
        titleSpacing: 1,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: ListView.builder(
        itemCount: Globals.globals.StudentData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(MyRoutes.AddDataPage);
              },
              tileColor: Colors.white,
              leading: CircleAvatar(
                  //   foregroundImage: NetworkImage(
                  //       // Globals.globals.StudentData[index]['student_image']),
                  ),
              title: Text(
                  'Name    : ${Globals.globals.StudentData[index]['student_name']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'GRID       : ${Globals.globals.StudentData[index]['student_grid']}'),
                  Text(
                      'Standard  : ${Globals.globals.StudentData[index]['student_standard']}'),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(MyRoutes.AddDataPage);
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
