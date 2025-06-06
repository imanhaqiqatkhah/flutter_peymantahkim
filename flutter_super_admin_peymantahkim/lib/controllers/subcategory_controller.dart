import 'dart:convert';

import 'package:flutter_super_admin_peymantahkim/global_variable.dart';
import 'package:flutter_super_admin_peymantahkim/models/category.dart';
import 'package:flutter_super_admin_peymantahkim/models/subcategory.dart';
import 'package:flutter_super_admin_peymantahkim/services/manage_http_response.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;

class SubcategoryController {
  uploadSubcategory({
    required String categoryId,
    required String categoryName,
    required dynamic pickedImage,
    required String subCategoryName,
    required context,
  }) async {
    try {
      final cloudinary = CloudinaryPublic('dvj2ecqsx', 'peymantahkim');

      // upload the image
      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          pickedImage,
          identifier: 'pickedImage',
          folder: 'categoryImages',
        ),
      );

      String image = imageResponse.secureUrl;

      Subcategory subcategory = Subcategory(
        id: '',
        categoryId: categoryId,
        categoryName: categoryName,
        image: image,
        subCategoryName: subCategoryName,
      );

      http.Response response = await http.post(
        Uri.parse("$uri/api/subcategories"),
        body: subcategory.toJson(),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'فعالیت آپلود شد');
        },
      );
    } catch (e) {
      print("$e");
    }
  }

  Future<List<Subcategory>> loadSubcategories() async {
    try {
      // send an http get request to load the categories
      http.Response response = await http.get(
        Uri.parse('$uri/api/subcategories'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        List<Subcategory> subcategories = data
            .map((subcategory) => Subcategory.fromJson(subcategory))
            .toList();
        return subcategories;
      } else {
        throw Exception('خطا در بارگیری فعالیت ها');
      }
    } catch (e) {
      print(e);
      throw Exception('خطا در بارگیری فعالیت ها $e');
    }
  }
}
