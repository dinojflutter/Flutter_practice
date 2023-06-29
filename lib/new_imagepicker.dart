import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagepickernew extends StatefulWidget {
  const Imagepickernew({Key? key}) : super(key: key);

  @override
  State<Imagepickernew> createState() => _ImagepickernewState();
}

class _ImagepickernewState extends State<Imagepickernew> {
  File? pickedImage;

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedImageFile = await ImagePicker().pickImage(source: source);
      if (pickedImageFile == null) return;
      final imageFile = File(pickedImageFile.path);
      setState(() => pickedImage = imageFile);
    } on PlatformException catch (e) {
      print("FAILED TO PICK AN IMAGE: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Image Picker",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Center(
            //   child: Text(
            //     "Pick Image",
            //     style: TextStyle(fontSize: 25),
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            pickedImage != null
                ? ClipOval(
                    child: Image.file(
                      pickedImage!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipOval(
                    child: Container(
                      color: Colors.teal,
                      width: 200,
                      height: 200,
                    ),
                  ),

            SizedBox(
              height: 30,
            ),
            buildbottom(
              title: "Choose From Gallery",
              icon: Icons.image_outlined,
              onClicked: () => pickImage(ImageSource.gallery),
            ),
            SizedBox(
              height: 50,
            ),
            buildbottom(
              title: "Choose From Camera",
              icon: Icons.camera_alt_outlined,
              onClicked: () => pickImage(ImageSource.camera),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildbottom({
  required String title,
  required IconData icon,
  required VoidCallback onClicked,
}) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(52),
        textStyle: TextStyle(fontSize: 20),
      ),
      onPressed: onClicked,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
          ),
          SizedBox(width: 50),
          Text(title),
        ],
      ),
    );
