import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';

class ProductController {
  void uploadProduct({
    required String productName,
    required int productPrice,
    required int quantity,
    required String description,
    required String category,
    required String vendorId,
    required String fullName,
    required String subCategory,
    required List<File>? pickedImages,
  }) async {
    if (pickedImages != null) {
      final cloudinary = CloudinaryPublic('dvj2ecqsx', 'peymantahkim');
      List<String> images = [];
      // loop through each image in pickedImages List
      for (var i = 0; i < pickedImages.length; i++) {
        // await the upload of current image to cloudinary
        CloudinaryResponse cloudinaryResponse = await cloudinary.uploadFile(
            CloudinaryFile.fromFile(pickedImages[i].path, folder: productName));

        // add the secure Url to the images List
        images.add(cloudinaryResponse.secureUrl);
      }
    }
  }
}
