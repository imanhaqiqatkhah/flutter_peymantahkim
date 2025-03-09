import 'package:flutter/material.dart';
import 'package:flutter_peymantahkim/views/screens/authentication_screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  'خوش آمدید',
                  style: TextStyle(
                      fontSize: 32,
                      color: Color(0xFF0d120E),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 4),
                Text(
                  'در دنیای پیمان تحکیم همه چیز هست',
                  style: TextStyle(
                      color: Color(0xFF0d120E).withOpacity(0.7),
                      fontSize: 14,
                      letterSpacing: 0.1),
                  textDirection: TextDirection.rtl,
                ),
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        blurRadius: 25,
                        color: Colors.black.withOpacity(0.15),
                        offset: Offset(0, 5))
                  ]),
                  child: Image.asset(
                    './assets/images/logo.png',
                    width: 220,
                    height: 220,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'ایمیل',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      TextFormField(
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
                          ),
                          suffixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'رمز عبور',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      TextFormField(
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
                            fontSize: 14,
                            letterSpacing: 0.1,
                          ),
                          suffixIcon: Icon(Icons.security_outlined),
                          prefixIcon: Icon(Icons.visibility_outlined),
                        ),
                      ),
                      SizedBox(height: 26),
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 47,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.black87,
                                Colors.black54
                              ],
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
                                        color: Color.fromARGB(255, 31, 35, 51),
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
                                        borderRadius: BorderRadius.circular(5)),
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
                                        borderRadius: BorderRadius.circular(3)),
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
                                child: Text(
                                  'ورود',
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
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
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: Text(
                              'ثبت نام',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black45,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
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
