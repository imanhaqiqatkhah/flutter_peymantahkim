import 'package:flutter/material.dart';
import 'package:flutter_client_peymantahkim/views/screens/authentication_screens/login_screen.dart';
import 'package:flutter_client_peymantahkim/views/screens/authentication_screens/register_screen.dart';
import 'package:flutter_client_peymantahkim/views/widgets/gradient_button.dart';
// import 'package:flutter_client_peymantahkim/widgets/gradient_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('./assets/images/welcome_bg.jpg'),
                fit: BoxFit.cover,
                opacity: 0.2,
              ),
            ),
          ),
          SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            './assets/images/logo.png',
                            width: 40,
                            height: 40,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          'شرکت دانش بنیان مهندسی \nپیمان تحکیم خوزستان',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    Spacer(),
                    SizedBox(height: 12),
                    Text(
                      'دارای\n دفتر فنی و مهندسی',
                      style: TextStyle(
                        fontSize: 42,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'جزء بالاترین رتبه شرکت های دانش بنیان ایران',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.6),
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 34),
                    GradientButton(
                      text: 'ثبت نام',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 6),
                    SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(
                            color: Colors.white,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'ورود',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
