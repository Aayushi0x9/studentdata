import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../headers.dart';
import '../../../../utils/Global/global_utils.dart';

Widget ImageChangeDialogue(
    {required size, required context, required index, required getSetState()}) {
  return AlertDialog(
    contentPadding: EdgeInsets.all(10),
    title: const Text(
      softWrap: true,
      '📝 Change ProfilePicture 📝',
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: size.height * 0.07,
                    backgroundColor: Colors.grey,
                    foregroundImage: FileImage(
                        Globals.globals.StudentData[index]['student_image']),
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
                                              Globals.globals.student_image =
                                                  File(img!.path);
                                              Navigator.pop(context);
                                              getSetState();
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
                                              Globals.globals.student_image =
                                                  File(img.path);
                                              Navigator.pop(context);
                                              getSetState();
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
                  )
                ],
              ),
              SizedBox(
                height: size.width * 0.08,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  foregroundImage:
                  Globals.globals.student_image != null
                      ? FileImage(Globals.globals.student_image!)
                      : null;
                  getSetState();
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
