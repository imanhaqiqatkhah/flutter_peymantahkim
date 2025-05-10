import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vendor_peymantahkim/controllers/category_controller.dart';
import 'package:flutter_vendor_peymantahkim/controllers/subcategory_controller.dart';
import 'package:flutter_vendor_peymantahkim/models/category.dart';
import 'package:flutter_vendor_peymantahkim/models/subcategory.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  late Future<List<Category>> futureCategories;
  Future<List<Subcategory>>? futureSubcategories;
  Category? selectedCategory;
  Subcategory? selectedSubcategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCategories = CategoryController().loadCategories();
  }

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

  getSubcategoryByCategory(value) {
    // fetch subcategories base on the selected category
    futureSubcategories =
        SubcategoryController().getSubCategoriesByCategoryName(value.name);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              shrinkWrap:
                  true, //allow the gridview to shrink to fit the content
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
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'نام محصول',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'قیمت محصول',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'تعداد محصول',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: FutureBuilder<List<Category>>(
                      future: futureCategories,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('خطا: ${snapshot.error}'),
                          );
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(
                            child: Text('بدون مجموعه'),
                          );
                        } else {
                          return DropdownButton<Category>(
                              value: selectedCategory,
                              hint: Text('انتخاب مجموعه'),
                              items: snapshot.data!.map((Category category) {
                                return DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value;
                                });
                                getSubcategoryByCategory(selectedCategory);
                              });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: FutureBuilder<List<Subcategory>>(
                      future: futureSubcategories,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('خطا: ${snapshot.error}'),
                          );
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(
                            child: Text('بدون فعالیت'),
                          );
                        } else {
                          return DropdownButton<Subcategory>(
                              value: selectedSubcategory,
                              hint: Text('انتخاب فعالیت'),
                              items:
                                  snapshot.data!.map((Subcategory subcategory) {
                                return DropdownMenuItem(
                                  value: subcategory,
                                  child: Text(subcategory.subCategoryName),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedSubcategory = value;
                                });
                              });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: TextFormField(
                      maxLines: 3,
                      maxLength: 500,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'توضیحات محصول',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
