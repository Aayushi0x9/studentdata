import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../headers.dart';
import '../../../../utils/Global/global_utils.dart';

Widget circleImagePick({
  required size,
  required context,
  required getSetState(),
}) {
  return Stack(
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
                  style: TextStyle(fontSize: 20, color: Colors.blueGrey),
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
                                XFile? img = await ImagePicker().pickImage(
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
                                  fontSize: 12, color: Colors.blueGrey),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () async {
                                final img = await ImagePicker().pickImage(
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
                                  fontSize: 12, color: Colors.blueGrey),
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
  );
}
