import 'dart:io';

import 'package:flutter/cupertino.dart';
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
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(MyRoutes.DetailPage,
                    arguments: Globals.globals.StudentData[index]);
              },
              tileColor: Colors.white,
              leading: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
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
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 20, right: 20),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          CircleAvatar(
                                            radius: size.height * 0.07,
                                            backgroundColor: Colors.grey,
                                            foregroundImage: FileImage(Globals
                                                    .globals.StudentData[index]
                                                ['student_image']),
                                          ),
                                          FloatingActionButton.small(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return CupertinoAlertDialog(
                                                    insetAnimationCurve:
                                                        Curves.decelerate,
                                                    title: const Text(
                                                      selectionColor:
                                                          Colors.green,
                                                      softWrap: true,
                                                      'Select Option',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color:
                                                              Colors.blueGrey),
                                                    ),
                                                    actions: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: Row(
                                                          children: [
                                                            Column(
                                                              children: [
                                                                IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    XFile? img =
                                                                        await ImagePicker()
                                                                            .pickImage(
                                                                      source: ImageSource
                                                                          .gallery,
                                                                    );
                                                                    if (img !=
                                                                        null) {
                                                                      setState(
                                                                          () {
                                                                        Globals
                                                                            .globals
                                                                            .student_image = File(img!.path);
                                                                        Navigator.pop(
                                                                            context);
                                                                      });
                                                                    }
                                                                  },
                                                                  icon:
                                                                      const Icon(
                                                                    Icons.photo,
                                                                    size: 40,
                                                                    color: Colors
                                                                        .blueGrey,
                                                                  ),
                                                                ),
                                                                const Text(
                                                                  selectionColor:
                                                                      Colors
                                                                          .green,
                                                                  softWrap:
                                                                      true,
                                                                  'Gallery',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .blueGrey),
                                                                ),
                                                              ],
                                                            ),
                                                            const Spacer(),
                                                            Column(
                                                              children: [
                                                                IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    final img =
                                                                        await ImagePicker()
                                                                            .pickImage(
                                                                      source: ImageSource
                                                                          .camera,
                                                                    );
                                                                    if (img !=
                                                                        null) {
                                                                      setState(
                                                                        () {
                                                                          Globals
                                                                              .globals
                                                                              .student_image = File(img.path);
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                      );
                                                                    }
                                                                  },
                                                                  icon:
                                                                      const Icon(
                                                                    Icons
                                                                        .photo_camera,
                                                                    size: 40,
                                                                    color: Colors
                                                                        .blueGrey,
                                                                  ),
                                                                ),
                                                                const Text(
                                                                  selectionColor:
                                                                      Colors
                                                                          .green,
                                                                  softWrap:
                                                                      true,
                                                                  'Camera',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .blueGrey),
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
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            hoverColor: Colors.blue,
                                            splashColor: Colors.green,
                                            child: const Icon(
                                                Icons.add_a_photo_outlined),
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
                                          setState(() {
                                            Globals.globals.student_image !=
                                                    null
                                                ? FileImage(Globals
                                                    .globals.student_image!)
                                                : null;
                                          });
                                        },
                                        child: const Text('Save'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ));
                },
                child: CircleAvatar(
                  foregroundImage: Globals.globals.StudentData[index]
                              ['student_image'] ==
                          null
                      ? FileImage(File(
                          'https://cdn3.iconfinder.com/data/icons/shipping-and-delivery-2-1/512/54-512.png'))
                      : FileImage(
                          Globals.globals.StudentData[index]['student_image']),
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
                    builder: (context) => AlertDialog(
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
                                controller: Globals.globals.StudentData[index]
                                    ['nameController'],
                                onChanged: (val) {
                                  Globals.globals.StudentData[index]
                                      ['student_name'] = val;
                                  setState(() {});
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
                                controller: Globals.globals.StudentData[index]
                                    ['gridController'],
                                onChanged: (val) {
                                  Globals.globals.StudentData[index]
                                      ['student_grid'] = val;
                                  setState(() {});
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
                                controller: Globals.globals.StudentData[index]
                                    ['stdController'],
                                onChanged: (val) {
                                  Globals.globals.StudentData[index]
                                      ['student_standard'] = val;
                                  setState(() {});
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      setState(() {
                                        Navigator.of(context).pop();
                                        Globals.globals.StudentData
                                            .removeAt(index);
                                      });
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Colors.blueGrey,
                ),
              ),
            ),
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
