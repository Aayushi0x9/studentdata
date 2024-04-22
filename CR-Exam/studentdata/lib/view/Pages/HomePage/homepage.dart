import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:studentdata/headers.dart';
import 'package:studentdata/view/Pages/HomePage/Componenet/editstudentdatadialog.dart';
import 'package:studentdata/view/Pages/HomePage/Componenet/imagechangedialogue.dart';
import 'package:studentdata/view/Pages/HomePage/Componenet/studentdatatlist.dart';

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
    void getSetState() => setState(() {});

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🧑🏼‍🎓 StudentData 🧑🏼‍🎓',
          style: TextStyle(color: Colors.white, fontSize: 24, letterSpacing: 2),
        ),
        centerTitle: true,
        titleSpacing: 1,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: getSetState,
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
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: studentListTile(
                context: context,
                index: index,
                ImageChangeDialogue: ImageChangeDialogue,
                size: size,
                getSetState: getSetState,
                EditStudentDataDialogue: EditStudentDataDialogue),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            MyRoutes.AddDataPage,
          );
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
