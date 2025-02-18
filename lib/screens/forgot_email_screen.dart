import 'package:flutter/material.dart';
import 'package:flutter_peymantahkim/screens/otp_verification_screen.dart';
import 'package:flutter_peymantahkim/theme/theme.dart';
import 'package:flutter_peymantahkim/widgets/custom_text_field.dart';
import 'package:flutter_peymantahkim/widgets/gradient_button.dart';

class ForgotEmailScreen extends StatefulWidget {
  const ForgotEmailScreen({super.key});

  @override
  State<ForgotEmailScreen> createState() => _ForgotEmailScreenState();
}

class _ForgotEmailScreenState extends State<ForgotEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _recoveryStarted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'آیا رمز عبور را فراموش کردید؟',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 8),
                Text(
                  'شماره تلفن خود را وارد کنید تا رمز عبور را بازیابی کنیم',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 48),
                if (!_recoveryStarted)
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: 'شماره تلفن',
                          prefixIcon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'لطفا شماره تلفن خود را وارد کنید';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 24),
                        GradientButton(
                          text: 'انجام',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(
                                () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OtpVerificationScreen()));
                                  // _recoveryStarted = true;
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(height: 24),
                        Center(
                          child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'برگشت به قبل',
                              style: TextStyle(
                                color: AppTheme.primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              color: AppTheme.success.withOpacity(0.1),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.check_circle_outline,
                            size: 40,
                            color: AppTheme.success,
                          ),
                        ),
                        SizedBox(height: 24),
                        Text(
                          'بازیابی با پیامک',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'ما آدرس ایمیل را به شماره تلفن شماارسال کردیم، لطفا پیامک خود را بررسی کنید',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 16,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 32),
                        GradientButton(
                            text: 'باز کردن پیام',
                            onPressed: () {
                              // optional if you want to open your message app from here,
                              // you can remove this, if you don't needed,
                            }),
                        SizedBox(height: 16),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'برگشت به قبل',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
