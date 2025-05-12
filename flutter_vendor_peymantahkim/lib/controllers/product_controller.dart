import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter_vendor_peymantahkim/global_variables.dart';
import 'package:flutter_vendor_peymantahkim/models/product.dart';
import 'package:flutter_vendor_peymantahkim/services/manage_http_response.dart';

import 'package:http/http.dart' as http;

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
    required context,
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
      if (category.isNotEmpty && subCategory.isNotEmpty) {
        final Product product = Product(
            id: '',
            productName: productName,
            productPrice: productPrice,
            quantity: quantity,
            description: description,
            category: category,
            vendorId: vendorId,
            fullName: fullName,
            subCategory: subCategory,
            images: images);

        http.Response response = await http.post(
            Uri.parse("$uri/api/add-product"),
            body: product.toJson(),
            headers: {'Content-Type': 'application/json; charset=UTF-8'});
        manageHttpResponse(
            response: response,
            context: context,
            onSuccess: () {
              showSnackBar(context, 'محصول با موفقیت اضافه شد');
            });
      } else {
        showSnackBar(context, 'مجموعه را انتخاب کنید');
      }
    } else {
      showSnackBar(context, 'انتخاب تصویر الزامی است');
    }
  }
}
