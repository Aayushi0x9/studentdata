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
      ),
      body: ListView.builder(
        itemCount: Globals.globals.StudentData.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  Globals.globals.StudentData[index]['student_image']),
            ),
            title: Text(Globals.globals.StudentData[index]['student_name']),
            subtitle:
                Text(Globals.globals.StudentData[index]['student_standard']),
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
