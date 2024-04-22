import 'dart:io';

import '../../../../headers.dart';
import '../../../../utils/Global/global_utils.dart';

Widget studentListTile(
    {required context,
    required index,
    required ImageChangeDialogue,
    required size,
    required Function() getSetState,
    required EditStudentDataDialogue}) {
  return ListTile(
    onTap: () {
      Navigator.of(context).pushNamed(MyRoutes.DetailPage,
          arguments: Globals.globals.StudentData[index]);
    },
    tileColor: Colors.white,
    leading: GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ImageChangeDialogue(
              size: size,
              context: context,
              index: index,
              getSetState: getSetState),
        );
      },
      child: CircleAvatar(
        foregroundImage: Globals.globals.StudentData[index]['student_image'] ==
                null
            ? FileImage(File(
                'https://cdn3.iconfinder.com/data/icons/shipping-and-delivery-2-1/512/54-512.png'))
            : FileImage(Globals.globals.StudentData[index]['student_image']),
      ),
    ),
    title: Text(
      'Name    : ${Globals.globals.StudentData[index]['student_name']}',
      overflow: TextOverflow.ellipsis,
    ),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GRID       : ${Globals.globals.StudentData[index]['student_grid']}',
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          'Standard  : ${Globals.globals.StudentData[index]['student_standard']}',
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
    trailing: IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => EditStudentDataDialogue(
              size: size,
              index: index,
              context: context,
              getSetState: getSetState),
        );
      },
      icon: const Icon(
        Icons.edit_outlined,
        color: Colors.blueGrey,
      ),
    ),
  );
}
