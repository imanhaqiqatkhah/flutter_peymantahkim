import 'package:flutter/material.dart';
import 'package:flutter_app_peymantahkim/views/widgets/onboarding_screen.dart';
import 'package:flutter_app_peymantahkim/views/widgets/splash_screen.dart';
import 'package:flutter_app_peymantahkim/theme/theme.dart';
import 'package:flutter_app_peymantahkim/views/widgets/onboarding_screen.dart';
// import 'package:flutter_peymantahkim/widgets/gradient_button.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({super.key});

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedLanguage;

  List<Map<String, String>> _languages = [
    {
      'code': 'fa',
      'name': 'Persian',
      'nativeName': 'فارسی',
    },
    {
      'code': 'en',
      'name': 'English',
      'nativeName': 'انگلیسی',
    },
    {
      'code': 'es',
      'name': 'Spanish',
      'nativeName': 'اسپانیایی',
    },
    {
      'code': 'fr',
      'name': 'French',
      'nativeName': 'فرانسوی',
    },
    {
      'code': 'de',
      'name': 'German',
      'nativeName': 'آلمانی',
    },
    {
      'code': 'it',
      'name': 'Italian',
      'nativeName': 'ایتالیایی',
    },
    {
      'code': 'ar',
      'name': 'َArabic',
      'nativeName': 'عربی',
    },
  ];

  void _handleLanguageSelection() {
    if (_selectedLanguage != null) {
      // implement language change logic here
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.transparent,
          // elevation: 0,
          // leading: IconButton(
          //   onPressed: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => SplashScreen(),
          //     ),
          //   ),
          //   icon: Icon(Icons.arrow_back),
          //   color: AppTheme.textPrimary,
          // ),
          ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'انتخاب زبان',
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'براساس ملیت خود زبان مورد نظر را انتخاب کنید',
                        style: TextStyle(
                            fontSize: 14, color: AppTheme.textSecondary),
                      ),
                      SizedBox(height: 28),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _languages.length,
                        itemBuilder: (context, index) {
                          final language = _languages[index];
                          final isSelected =
                              language['code'] == _selectedLanguage;
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isSelected
                                    ? AppTheme.primaryColor
                                    : AppTheme.textSecondary.withOpacity(0.2),
                                width: isSelected ? 2 : 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    _selectedLanguage = language['code']!;
                                  },
                                );
                              },
                              borderRadius: BorderRadius.circular(12),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            language['nativeName']!,
                                            style: TextStyle(
                                              color: AppTheme.textPrimary,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            language['name']!,
                                            style: TextStyle(
                                              color: AppTheme.textSecondary,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isSelected
                                              ? AppTheme.primaryColor
                                              : AppTheme.textSecondary
                                                  .withOpacity(0.2),
                                          width: 2,
                                        ),
                                      ),
                                      child: isSelected
                                          ? Container(
                                              margin: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                color: AppTheme.primaryColor,
                                                shape: BoxShape.circle,
                                              ),
                                            )
                                          : null,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 32),
                      Padding(
                        padding: EdgeInsets.all(24),
                        child: InkWell(
                          onTap: () {
                            _handleLanguageSelection();
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
                                        borderRadius: BorderRadius.circular(5),
                                      ),
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
                                  child: Text(
                                    'ادامه',
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
