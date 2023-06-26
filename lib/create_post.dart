import 'dart:io';

import 'package:demo/image_viewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DropDownController extends GetxController {
  var dropdownValue = "Sports".obs;

  setValue(String x) {
    dropdownValue.value = x;
  }

  getValue() => dropdownValue.value;
}

class XFileController extends GetxController {
  RxList files = [].obs;
  var errorMessage = "".obs;

  setValue(File singleFile) async {
    files.insert(0, singleFile);
    print(files.length);
  }

  getLength() {
    return files.length;
  }

  getError() {
    return errorMessage.value;
  }
}

//Create Post Screen

class CreatePostScreen extends StatelessWidget {
  final DropDownController dropdownValue = Get.put(DropDownController());
  final XFileController xfile = Get.put(XFileController());
  CreatePostScreen({super.key});
//Select Image Function
  selectImage() async {
    if (xfile.getLength() >= 4) {
      xfile.errorMessage.value = "Maximum Limit Exceeded";
    } else {
      final ImagePicker _picker = ImagePicker();
// Pick an image
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      print(image?.path);
      if (image != null) {
        final File file = File(image.path);
        xfile.setValue(file);
      }
    }
  }

//Pick a video
  selectVideo() async {
    if (xfile.getLength() >= 4) {
      xfile.errorMessage.value = "Maximum Limit Exceeded";
    } else {
      final ImagePicker _picker = ImagePicker();

// Pick a video
      final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
      print(video?.path);
      if (video != null) {
        final File file = File(video.path);
        xfile.setValue(file);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: const Icon(Icons.arrow_back),
        title: const Text("Create Post"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 231, 231, 231),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0, color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        maxLines: 18,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Write Here",
                          fillColor: Colors.white70,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 10,
                              bottom: 20,
                              top: 10,
                            ),
                            child: GestureDetector(
                              onTap: selectImage,
                              child: const Icon(Icons.image_outlined),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 5,
                              bottom: 20,
                              top: 10,
                            ),
                            child: GestureDetector(
                              onTap: selectVideo,
                              child: const Icon(Icons.video_camera_back),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //DropDownButton
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 10,
                ),
                child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: ' Interest',
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 121, 121, 121)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                    ),
                    child: Obx(
                      () => ButtonTheme(
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        child: DropdownButton<String>(
                          hint: const Text(
                            "  --Select Your Interest--",
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          value: dropdownValue.dropdownValue.value,
                          isExpanded: true,
                          underline: DropdownButtonHideUnderline(
                            child: Container(),
                          ),
                          onChanged: (String? newValue) {
                            dropdownValue.setValue(newValue!);
                          },
                          items: <String>[
                            'Sports',
                            'Education',
                            'Entertainment',
                            'Job Alert',
                            'Agriculture'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    )),
              ),
              //List View
              Obx(() {
                if (xfile.errorMessage == "")
                  return Center();
                else {
                  return Center(
                      child: Text(
                    xfile.getError(),
                    style: TextStyle(color: Colors.red),
                  ));
                }
              }),

              Obx(() {
                if (xfile.getLength() == 0) {
                  return const SizedBox(
                    height: 100,
                  );
                } else {
                  print(xfile.getLength().toString());
                  return SizedBox(
                    height: 100,
                    child: ListView.builder(
                        itemCount: xfile.getLength(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            FileViewWidget(file: xfile.files[index])),
                  );
                }
              }),

              //Buttons
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                        left: 15.0, top: 25, bottom: 10),
                                    child: const Text(
                                      "Sort By",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListTile(
                                    leading: new Icon(Icons.photo),
                                    title: new Text('Photo'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: new Icon(Icons.music_note),
                                    title: new Text('Music'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                        left: 15.0, top: 25, bottom: 10),
                                    child: const Text(
                                      "Location",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Row(
                                    children: [
                                      //
                                    ],
                                  )
                                ],
                              );
                            });
                      },
                      child: const Text(
                        "Save as draft",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Publish",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
