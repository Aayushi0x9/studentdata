import 'package:flutter/cupertino.dart';
import 'package:studentdata/headers.dart';

import '../../../utils/Global/global_utils.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Data Screen',
          style: TextStyle(color: Colors.white, fontSize: 24, letterSpacing: 2),
        ),
        titleSpacing: 1,
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                onSaved: (val) {
                  Globals.globals.student_grid = val;
                },
                validator: (val) =>
                    val!.isEmpty ? 'Must Enter Your GRID' : null,
                initialValue: Globals.globals.student_grid,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline),
                  label: const Text('GRID'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              TextFormField(
                onSaved: (val) {
                  Globals.globals.student_name = val;
                },
                validator: (val) => val!.isEmpty ? 'Must Enter Name' : null,
                initialValue: Globals.globals.student_name,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline),
                  label: const Text('Student Name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              TextFormField(
                onSaved: (val) {
                  Globals.globals.student_standard = val;
                },
                validator: (val) => val!.isEmpty ? 'Must Enter Standard' : null,
                initialValue: Globals.globals.student_standard,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline),
                  label: const Text('Student Standard'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              ElevatedButton(
                onPressed: () {
                  bool validated = formkey.currentState!.validate();
                  if (validated) {
                    formkey.currentState!.save();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
