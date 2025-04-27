import 'dart:convert';
import 'package:flutter_peymantahkim/global_variables.dart';
import 'package:flutter_peymantahkim/models/banner_model.dart';
import 'package:http/http.dart' as http;

class BannerController {
  // fetch banners
  Future<List<BannerModel>> loadBanners() async {
    try {
      // send an http get request to fetch banners
      http.Response response = await http.get(
        Uri.parse('$uri/api/banner'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },
      );

      print(response.body);
      if (response.statusCode == 200) //ok
      {
        List<dynamic> data = jsonDecode(response.body);

        List<BannerModel> banners =
            data.map((banner) => BannerModel.fromJson(banner)).toList();
        return banners;
      } else {
        ///throw an exception if the server responsed with an error status code
        throw Exception('آپلود بنر با خطا همراه است');
      }
    } catch (e) {
      throw Exception('باگ آپلود بنر، $e است');
    }
  }
}
