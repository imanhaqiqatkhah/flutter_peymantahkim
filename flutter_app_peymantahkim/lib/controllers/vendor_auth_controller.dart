import 'dart:convert';

import 'package:flutter_app_peymantahkim/global_variables.dart';
import 'package:flutter_app_peymantahkim/models/vendor.dart';
import 'package:flutter_app_peymantahkim/services/manage_http_response.dart';

import 'package:http/http.dart' as http;

class VendorAuthController {
  Future<void> signUpVendor(
      {required String fullName,
      required String email,
      required String password,
      required context}) async {
    try {
      Vendor vendor = Vendor(
        id: '',
        fullName: fullName,
        email: email,
        state: '',
        city: '',
        locality: '',
        password: password,
      );
      http.Response response = await http.post(
          Uri.parse('$uri/api/vendor/signup'),
          body: vendor.toJson(),
          headers: <String, String>{
            // set headers for the request
            "Content-Type": "application/json;  charset=UTF-8",
          }); // convert the vendor user object to json for request body

      // manage http response to handle http response base on the status code
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'اکانت کلاینت با موفقیت ایجاد شد');
          });
    } catch (e) {
      showSnackBar(context, '$e');
    }
  }

  /// function to consume the backend vendor signin api

  Future<void> signInVendor(
      {required String email,
      required String password,
      required context}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/api/vendor/signin'),
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        headers: <String, String>{
          // set headers for the request
          "Content-Type": "application/json;  charset=UTF-8",
        },
      );

      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'کلاینت با موفقیت وارد شد');
          });
    } catch (e) {
      showSnackBar(context, '$e');
    }
  }
}
