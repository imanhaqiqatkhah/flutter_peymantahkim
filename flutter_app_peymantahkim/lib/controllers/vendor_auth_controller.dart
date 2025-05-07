import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_peymantahkim/global_variables.dart';
import 'package:flutter_app_peymantahkim/models/vendor.dart';
import 'package:flutter_app_peymantahkim/provider/vendor_provider.dart';
import 'package:flutter_app_peymantahkim/services/manage_http_response.dart';
import 'package:flutter_app_peymantahkim/views/main_vendor_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final providerContainer = ProviderContainer();

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
        role: '',
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
          onSuccess: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            // extract the authentication token from the response body
            String token = jsonDecode(response.body)['token'];
            // store the authentication token securely in shared preferences
            await preferences.setString('auth_token', token);
            // encode the user data received from the backend as json

            // update the application state with the user data using riverpod
            final vendorJson = jsonEncode(jsonDecode(response.body)['vendor']);
            providerContainer
                .read(vendorProvider.notifier)
                .setVendor(vendorJson);

            /// store the data in share preferences
            await preferences.setString('vendor', vendorJson);

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const MainVendorScreen()),
                (route) => false);
            showSnackBar(context, 'کلاینت با موفقیت وارد شد');
          });
    } catch (e) {
      showSnackBar(context, '$e');
    }
  }
}
