import '../../../../headers.dart';
import '../../../../utils/Global/global_utils.dart';

Widget EditStudentDataDialogue(
    {required size, required index, required context, required getSetState()}) {
  return AlertDialog(
    title: const Text(
      softWrap: true,
      '📝 Edit StudentData 📝',
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            TextField(
              controller: Globals.globals.StudentData[index]['nameController'],
              onChanged: (val) {
                Globals.globals.StudentData[index]['student_name'] = val;
                getSetState();
              },
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
                label: const Text(
                  'Student Name',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            TextField(
              controller: Globals.globals.StudentData[index]['gridController'],
              onChanged: (val) {
                Globals.globals.StudentData[index]['student_grid'] = val;
                getSetState();
              },
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.confirmation_num_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  'Student GRID',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            TextField(
              controller: Globals.globals.StudentData[index]['stdController'],
              onChanged: (val) {
                Globals.globals.StudentData[index]['student_standard'] = val;
                getSetState();
              },
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.mode_standby_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  'Student Standard',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Globals.globals.StudentData.removeAt(index);
                    getSetState();
                  },
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      )
    ],
  );
}
