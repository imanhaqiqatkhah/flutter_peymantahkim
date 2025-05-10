import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  // create an instance of the image picker to handle image selection
  final ImagePicker picker = ImagePicker();

  // initialize an empty list to store the selected images
  List<File> images = [];

  // defined a function to choose image from a gallery
  chooseImage() async {
    // use the picker to select an image from the gallery
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // check if no image was picked
    if (pickedFile == null) {
      // if no image was picked, return
      print('no Image picked');
    } else {
      // if an image was picked, add it to the list of images
      setState(() {
        images.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Upload Screen'),
    );
  }
}
