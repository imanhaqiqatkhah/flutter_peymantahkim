import 'package:flutter/material.dart';
import 'package:flutter_peymantahkim/theme/theme.dart';
import 'package:flutter_peymantahkim/widgets/custom_text_field.dart';
import 'package:flutter_peymantahkim/widgets/gradient_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                  'آیا رمز عبور خود را فراموش کردید؟',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: 8),
                Text(
                  'ایمیل خود را وارد کنید تا رمز عبور را بازیابی کنیم',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 48),
                if (!_recoveryStarted)
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: 'ایمیل',
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'لطفا ایمیل خود را وارد کنید';
                            }
                            if (!value.contains('@')) {
                              return 'لطفا ایمیل خود را درست وارد کنید';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 24),
                        GradientButton(
                          text: 'بازیابی رمز عبور',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(
                                () {
                                  _recoveryStarted = true;
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
                          'بازیابی با ایمیل',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'ما لینک بازیابی رمز عبور را به ایمیل شما ارسال کردیم، لطفا آن را بررسی کنید ',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 16,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 32),
                        GradientButton(
                            text: 'باز کردن ایمیل',
                            onPressed: () {
                              // optional if you want to open your email app from here,
                              // you can remove this, if you don't needed,
                            }),
                        SizedBox(height: 16),
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
