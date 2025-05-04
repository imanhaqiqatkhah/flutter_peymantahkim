import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_peymantahkim/global_variables.dart';
import 'package:flutter_peymantahkim/models/user.dart';
import 'package:flutter_peymantahkim/provider/user_provider.dart';
import 'package:flutter_peymantahkim/services/manage_http_response.dart';
import 'package:flutter_peymantahkim/views/screens/authentication_screens/login_screen.dart';
import 'package:flutter_peymantahkim/views/screens/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final providerContainer = ProviderContainer();

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
          password: password,
          token: '');
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
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
            showSnackBar(context, 'اکانت برای شما ایجاد شد');
          });
    } catch (e) {
      print("Error: $e");
    }
  }

  /// signin users function
  Future<void> signInUsers(
      {required context,
      required String email,
      required String password}) async {
    try {
      http.Response response = await http.post(Uri.parse("$uri/api/signin"),
          body: jsonEncode(
            {
              'email': email,
              'password': password,
            },
          ),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8',
          });

      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () async {
            // access shared preference for token and user data storage
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            // extract the authentication token from the response body
            String token = jsonDecode(response.body)['token'];

            // store the authentication token securely in shared preferences

            await preferences.setString('auth_token', token);

            // encode the user data received from the backend as json

            final userJson = jsonEncode(jsonDecode(response.body)['user']);

            // update the application state with the user data using riverpod

            providerContainer.read(userProvider.notifier).setUser(userJson);

            // store the data in shared preference for future use

            await preferences.setString('user', userJson);

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
                (route) => false);
            showSnackBar(context, 'شما با موفقیت وارد شدید');
          });
    } catch (e) {
      print("Error: $e");
    }
  }

  // sign out
  Future<void> signOutSer({required context}) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      // clear the token and user from shared preferences
      await preferences.remove('auth_token');
      await preferences.remove('user');
      // clear the user state
      providerContainer.read(userProvider.notifier).signOut();
      // navigate the user back to login screen

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);

      showSnackBar(context, 'با موفقیت از حساب کاربری خود خارج شدید');
    } catch (e) {
      showSnackBar(context, 'هنگام خروج از حساب کاربری خطایی رخ داد');
    }
  }
}
