import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_peymantahkim/screens/loginScreen.dart';
import 'package:flutter_peymantahkim/theme/theme.dart';
import 'package:flutter_peymantahkim/widgets/gradient_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final int otpLength = 6;
  final List<TextEditingController> _controllers = [];
  final List<FocusNode> _focusNodes = [];

  bool _isVerifying = false;
  int _resendTimer = 30;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    for (int i = -0; i < otpLength; i++) {
      _controllers.add(TextEditingController());
      _focusNodes.add(FocusNode());
    }
    _startResendTimer();
  }

  void _startResendTimer() {
    Future.delayed(
      Duration(seconds: 1),
      () {
        if (!mounted) return;
        setState(() {
          if (_resendTimer > 0) {
            _resendTimer--;
            _startResendTimer();
          } else {
            _canResend = true;
          }
        });
      },
    );
  }

  void _verifyOTP() {
    String otp = _controllers.map((controller) => controller.text).join();
    if (otp.length == otpLength) {
      setState(() => _isVerifying = true);
      Future.delayed(
        Duration(seconds: 2),
        () {
          if (!mounted) return;
        },
      );
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  bool _recoveryStarted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'احراز هویت',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 8),
                if (!_recoveryStarted)
                  Column(
                    children: [
                      Text(
                        'کد 6 رقمی به شماره شما ارسال شده را وارد کنید ',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      SizedBox(height: 48),
                      Form(
                        key: _formKey,
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  otpLength,
                                  (index) => SizedBox(
                                    width: 50,
                                    child: TextField(
                                      controller: _controllers[index],
                                      focusNode: _focusNodes[index],
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      maxLength: 1,
                                      style: TextStyle(fontSize: 24),
                                      decoration: InputDecoration(
                                        counterText: '',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: AppTheme.textSecondary
                                                .withOpacity(0.3),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: AppTheme.primaryColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          if (index < otpLength - 1) {
                                            _focusNodes[index + 1]
                                                .requestFocus();
                                          } else {
                                            _focusNodes[index].unfocus();
                                            // _verifyOTP();
                                          }
                                        } else if (index > 0) {
                                          _focusNodes[index - 1].requestFocus();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 32),
                              GradientButton(
                                text:
                                    _isVerifying ? 'در حال انجام...' : 'انجام',
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
                                child: Column(
                                  children: [
                                    Text(
                                      'آیا کدی دریافت نکردید؟',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppTheme.textSecondary,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    TextButton(
                                      onPressed: _canResend
                                          ? () {
                                              setState(() {
                                                _canResend = false;
                                                _resendTimer = 30;
                                              });
                                              _startResendTimer();
                                            }
                                          : null,
                                      child: Text(
                                        _canResend
                                            ? 'ارسال مجدد'
                                            : 'مجددا کد ارسال میشود در ${_resendTimer} ثانیه',
                                        style: TextStyle(
                                          color: _canResend
                                              ? AppTheme.primaryColor
                                              : AppTheme.textSecondary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                else
                  Column(
                    children: [
                      SizedBox(height: 46),
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
                              'ما رمز عبور را به شماره تلفن شما ارسال کردیم، لطفا پیامک خود را بررسی کنید',
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
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen())),
                              child: Text(
                                'ورود',
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
