import 'package:flutter/material.dart';
import 'package:flutter_peymantahkim/global_variables.dart';
import 'package:flutter_peymantahkim/models/user.dart';
import 'package:flutter_peymantahkim/services/manage_http_response.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Future<void> signUpUsers({
    required BuildContext context,
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          fullName: fullName,
          email: email,
          state: '',
          city: '',
          locality: '',
          password: password);
      http.Response response = await http.post(Uri.parse('$uri/api/signup'),
          body:
              user.toJson(), // convert the user object to json for request body
          headers: <String, String>{
            // set the headers for the request
            "Content-Type":
                "application/json; charset=UTF-8", // specify the content type as json
          });

      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'اکانت برای شما ایجاد شد');
          });
    } catch (e) {}
  }
}
