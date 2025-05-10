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
    return Column(
      children: [
        GridView.builder(
            shrinkWrap: true, //allow the gridview to shrink to fit the content
            itemCount: images.length +
                1, // the number of items in the grid (+1 for the add button)
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              // if the index is 0, show the add icon button to new image
              return index == 0
                  ? Center(
                      child: IconButton(
                          onPressed: () {
                            chooseImage();
                          },
                          icon: Icon(Icons.add)),
                    )
                  : SizedBox(
                      width: 50,
                      height: 40,
                      child: Image.file(images[index - 1], fit: BoxFit.cover),
                    );
            })
      ],
    );
  }
}
