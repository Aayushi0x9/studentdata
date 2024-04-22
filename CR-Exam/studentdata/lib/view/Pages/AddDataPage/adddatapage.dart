import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentdata/headers.dart';
import 'package:studentdata/view/Pages/AddDataPage/component/imagepick.dart';

import '../../../utils/Global/global_utils.dart';
import 'component/mysnackbar.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  get getSetState => setState(() {});

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                circleImagePick(
                    size: size, context: context, getSetState: getSetState),
                SizedBox(height: size.height * 0.03),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onChanged: (val) {
                    Globals.globals.student_name = val;
                  },
                  validator: (val) => val!.isEmpty ? 'Must Enter Name' : null,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_outline),
                    label: const Text('Student Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    Globals.globals.student_grid = val;
                  },
                  validator: (val) => val!.isEmpty ? 'Must Enter GRID' : null,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.confirmation_num_outlined),
                    label: const Text('Student GRID'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  onChanged: (val) {
                    Globals.globals.student_standard = val;
                  },
                  validator: (val) =>
                      val!.isEmpty ? 'Must Enter Standard' : null,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mode_standby_outlined),
                    label: const Text('Student Standard'),
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
                        bool validated = _formKey.currentState!.validate();
                        if (validated) {
                          _formKey.currentState!.save();
                          Globals.globals.StudentData.add(
                            {
                              'student_name': Globals.globals.student_name,
                              'student_image': Globals.globals.student_image,
                              'student_grid': Globals.globals.student_grid,
                              'student_standard':
                                  Globals.globals.student_standard,
                              'gridController': TextEditingController(),
                              'stdController': TextEditingController(),
                              'nameController': TextEditingController(),
                            },
                          );
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          MySnackbar(
                            content: validated
                                ? 'Form Saved!!'
                                : 'Failed to Validate Form!!',
                            color: validated ? Colors.green : Colors.red,
                          ),
                        );
                      },
                      child: const Text('Save'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                        Globals.globals.reset();
                        setState(() {});
                      },
                      child: const Text(
                        'Reset',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
