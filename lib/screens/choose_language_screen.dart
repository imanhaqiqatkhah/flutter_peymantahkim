import 'package:flutter/material.dart';
import 'package:flutter_peymantahkim/screens/onboarding_screen.dart';
import 'package:flutter_peymantahkim/screens/splash_screen.dart';
import 'package:flutter_peymantahkim/theme/theme.dart';
import 'package:flutter_peymantahkim/widgets/gradient_button.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({super.key});

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'انتخاب زبان',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(height: 6),
                      Text(
                        'براساس ملیت خود زبان مورد نظر را انتخاب کنید',
                        style: TextStyle(fontSize: 14),
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
                        child: GradientButton(
                            text: 'ادامه',
                            onPressed: () {
                              _handleLanguageSelection();
                            }),
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
