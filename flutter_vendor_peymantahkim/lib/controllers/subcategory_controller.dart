import 'dart:convert';

import 'package:flutter_vendor_peymantahkim/global_variables.dart';
import 'package:flutter_vendor_peymantahkim/models/subcategory.dart';
import 'package:flutter_vendor_peymantahkim/services/manage_http_response.dart';
import 'package:http/http.dart' as http;

class SubcategoryController {
  Future<List<Subcategory>> getSubCategoriesByCategoryName(
      String categoryName) async {
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/api/category/$categoryName/subcategories'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          return data
              .map((subcategory) => Subcategory.fromJson(subcategory))
              .toList();
        } else {
          print('فعالیتی یافت نشد');
          return [];
        }
      } else if (response.statusCode == 404) {
        print('فعالیتی یافت نشد');
        return [];
      } else {
        print('خطای دسترسی به فعالیت ها');
        return [];
      }
    } catch (e) {
      print('خطای بارگیری فعالیت ها با $e');
      return [];
    }
  }
}
