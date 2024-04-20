import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentdata/headers.dart';

import '../../../utils/Global/global_utils.dart';
import 'component/mysnackbar.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
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

  int _selectedIndex = 0;
  // File? selectedImage;
  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
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
      backgroundColor: Colors.grey.shade200,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: size.height * 0.07,
                      backgroundColor: Colors.grey,
                      foregroundImage: Globals.globals.student_image != null
                          ? FileImage(Globals.globals.student_image!)
                          : null,
                    ),
                    FloatingActionButton.small(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              insetAnimationCurve: Curves.decelerate,
                              title: const Text(
                                selectionColor: Colors.green,
                                softWrap: true,
                                'Select Option',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blueGrey),
                              ),
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () async {
                                              XFile? img =
                                                  await ImagePicker().pickImage(
                                                source: ImageSource.gallery,
                                              );
                                              if (img != null) {
                                                setState(() {
                                                  Globals.globals
                                                          .student_image =
                                                      File(img!.path);
                                                  Navigator.pop(context);
                                                });
                                              }
                                            },
                                            icon: const Icon(
                                              Icons.photo,
                                              size: 40,
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                          const Text(
                                            selectionColor: Colors.green,
                                            softWrap: true,
                                            'Gallery',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () async {
                                              final img =
                                                  await ImagePicker().pickImage(
                                                source: ImageSource.camera,
                                              );
                                              if (img != null) {
                                                setState(
                                                  () {
                                                    Globals.globals
                                                            .student_image =
                                                        File(img.path);
                                                    Navigator.pop(context);
                                                  },
                                                );
                                              }
                                            },
                                            icon: const Icon(
                                              Icons.photo_camera,
                                              size: 40,
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                          const Text(
                                            selectionColor: Colors.green,
                                            softWrap: true,
                                            'Camera',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hoverColor: Colors.blue,
                      splashColor: Colors.green,
                      child: const Icon(Icons.add_a_photo_outlined),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
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
                SizedBox(height: size.height * 0.01),
                TextFormField(
                  onSaved: (val) {
                    Globals.globals.student_grid = val;
                  },
                  validator: (val) => val!.isEmpty ? 'Must Enter GRID' : null,
                  initialValue: Globals.globals.student_grid,
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
                  onSaved: (val) {
                    Globals.globals.student_standard = val;
                  },
                  validator: (val) =>
                      val!.isEmpty ? 'Must Enter Standard' : null,
                  initialValue: Globals.globals.student_standard,
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
                              'imageController': TextEditingController(),
                              'gridController': TextEditingController(),
                              'stdController': TextEditingController(),
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
