import 'package:flutter/material.dart';
import 'package:flutter_peymantahkim/controllers/auth_controller.dart';
import 'package:flutter_peymantahkim/main.dart';
import 'package:flutter_peymantahkim/theme/theme.dart';
import 'package:flutter_peymantahkim/views/screens/authentication_screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  late String email;
  late String password;
  bool isLoading = false;

  loginUser() async {
    setState(() {
      isLoading = true;
    });
    await _authController
        .signInUsers(context: context, email: email, password: password)
        .whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.96),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ورود به حساب',
                  style: TextStyle(
                      fontSize: 32,
                      color: AppTheme.textPrimary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 4),
                Text(
                  'به دنیای پیمان تحکیم خوش آمدید',
                  style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 14,
                      letterSpacing: 0.1),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 25,
                        color: Colors.black.withOpacity(0.15),
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    './assets/images/logo_light.png',
                    width: 220,
                    height: 220,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'ایمیل',
                            style: TextStyle(
                                color: AppTheme.primaryDark,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            email = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'لطفا ایمیل خود را وارد کنید';
                            } else {
                              return null;
                            }
                          },
                          textDirection: TextDirection.ltr,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            labelText: 'ایمیل خود را وارد کنید',
                            labelStyle: TextStyle(
                                fontSize: 14,
                                letterSpacing: 0.1,
                                color: AppTheme.textSecondary),
                            suffixIcon: Icon(
                              Icons.email_outlined,
                              color: AppTheme.primaryDark,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'رمز عبور',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppTheme.primaryDark,
                            ),
                          ),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            password = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'رمز عبور خود را وارد کنید';
                            } else {
                              return null;
                            }
                          },
                          textDirection: TextDirection.ltr,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            labelText: 'رمز عبور خود را وارد کنید',
                            labelStyle: TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 14,
                              letterSpacing: 0.1,
                            ),
                            suffixIcon: Icon(
                              Icons.security_outlined,
                              color: AppTheme.primaryDark,
                            ),
                            prefixIcon: Icon(
                              Icons.visibility_outlined,
                              color: AppTheme.primaryColor.withOpacity(0.7),
                            ),
                          ),
                        ),
                        SizedBox(height: 26),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              loginUser();
                            } else {}
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 47,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                colors: AppTheme.primaryGradient,
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 240,
                                  top: 19,
                                  child: Opacity(
                                    opacity: 0.5,
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 12,
                                          color:
                                              Color.fromARGB(255, 31, 35, 51),
                                        ),
                                        borderRadius: BorderRadius.circular(35),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 238,
                                  top: 18,
                                  child: Opacity(
                                    opacity: 0.5,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 3,
                                            color:
                                                Color.fromARGB(255, 27, 26, 26),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 269,
                                  top: 36,
                                  child: Opacity(
                                    opacity: 0.3,
                                    child: Container(
                                      width: 5,
                                      height: 5,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 250,
                                  top: -10,
                                  child: Opacity(
                                    opacity: 0.3,
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: isLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white)
                                      : Text(
                                          'ورود',
                                          style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'اگر حساب ندارید؟ ',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
                              },
                              child: Text(
                                'ثبت نام',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppTheme.primaryDark.withOpacity(0.8),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
