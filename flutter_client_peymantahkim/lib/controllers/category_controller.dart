import 'dart:convert';

import 'package:flutter_client_peymantahkim/global_variables.dart';
import 'package:flutter_client_peymantahkim/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryController {
  // load the upload category
  Future<List<Category>> loadCategories() async {
    try {
      // send an http get request to load the categories
      http.Response response = await http.get(
        Uri.parse('$uri/api/categories'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        List<Category> categories =
            data.map((category) => Category.fromJson(category)).toList();
        return categories;
      } else {
        throw Exception('خطا در بارگیری مجموعه ها');
      }
    } catch (e) {
      print(e);
      throw Exception('خطا در بارگیری مجموعه ها $e');
    }
  }
}
