import 'package:flutter/material.dart';
import 'package:flutter_peymantahkim/screens/forgot_email_screen.dart';
import 'package:flutter_peymantahkim/screens/loginScreen.dart';
import 'package:flutter_peymantahkim/screens/otp_verification_screen.dart';
import 'package:flutter_peymantahkim/theme/theme.dart';
import 'package:flutter_peymantahkim/widgets/custom_text_field.dart';
import 'package:flutter_peymantahkim/widgets/gradient_button.dart';
import 'package:flutter_peymantahkim/widgets/social_login_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppTheme.primaryGradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -50,
                        right: -50,
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 16,
                        right: 16,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'ایجاد حساب',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 40),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.13,
                left: 24,
                right: 24,
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'حساب خود را ایجاد کنید',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'برای ایجاد حساب خود، اطلاعات خود را وارد کنید',
                            style: TextStyle(
                                fontSize: 11, color: AppTheme.textSecondary),
                          ),
                          SizedBox(height: 16),
                          CustomTextField(
                            textAlign: TextAlign.start,
                            label: 'نام کامل',
                            prefixIcon: Icons.person_outline,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'لطفا نام خود را وارد کنید';
                              }
                              return null;
                            },
                          ),
                          // SizedBox(height: 4),
                          CustomTextField(
                            label: 'ایمیل',
                            prefixIcon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'لطفا ایمیل خود را وارد کنید';
                              }
                              if (!value.contains('@')) {
                                return 'لطفا ایمیل را درست وارد کنید';
                              }
                              return null;
                            },
                          ),
                          // SizedBox(height: 4),
                          CustomTextField(
                            label: 'رمز عبور',
                            prefixIcon: Icons.lock_outline,
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'لطفا رمز عبور خود را وارد کنید';
                              }
                              if (value.length < 6) {
                                return 'رمز عبور باید بیشتر از 6 رقم باشد';
                              }
                              return null;
                            },
                          ),
                          // SizedBox(height: 10),
                          CustomTextField(
                            label: 'تکرار رمز عبور',
                            prefixIcon: Icons.lock_outline,
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'لطفا تکرار رمز عبور خود را وارد کنید';
                              }

                              return null;
                            },
                          ),
                          // SizedBox(height: 10),
                          GradientButton(
                            text: 'ثبت نام',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                          ),
                          SizedBox(height: 8),
                          // Center(
                          //   child: Text(
                          //     'یا به روش های زیر وارد شوید',
                          //     style: TextStyle(
                          //         color: AppTheme.textSecondary, fontSize: 14),
                          //   ),
                          // ),
                          // SizedBox(height: 4),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: SocialLoginButton(
                          //         text: 'ایمیل',
                          //         iconPath: Icons.email_outlined,
                          //         onPressed: () {
                          //           Navigator.push(
                          //               context,
                          //               MaterialPageRoute(
                          //                   builder: (context) =>
                          //                       ForgotEmailScreen()));
                          //         },
                          //       ),
                          //     ),
                          //     SizedBox(width: 16),
                          //     Expanded(
                          //       child: SocialLoginButton(
                          //         text: 'تلفن',
                          //         iconPath: Icons.phone_outlined,
                          //         onPressed: () {
                          //           Navigator.push(
                          //               context,
                          //               MaterialPageRoute(
                          //                   builder: (context) =>
                          //                       OtpVerificationScreen()));
                          //         },
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 2),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'آیا اکانت دارید؟',
                                  style: TextStyle(
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: Text(
                                    'ورود',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
