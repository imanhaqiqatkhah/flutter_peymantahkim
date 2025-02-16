import 'package:flutter/material.dart';
import 'package:flutter_peymantahkim/screens/welcome_screen.dart';
import 'package:flutter_peymantahkim/theme/theme.dart';
import 'package:flutter_peymantahkim/widgets/gradient_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: 'طراحی و تولید محصول',
      description:
          'شرکت دانش‌بنیان مهندسی پیمان تحکیم خوزستان، پیشگام در تأمین، طراحی و تولید تجهیزات صنعتی پیشرفته است.',
      image: './assets/images/onboarding1.png',
    ),
    OnboardingData(
      title: 'تعمیر تجهیز',
      description:
          ' تعمیر شامل بررسی دقیق بردهای داخلی، تعویض قطعات معیوب، و تست عملکرد پنل برای اطمینان از کارایی و دقت بالا بوده است',
      image: './assets/images/onboarding2.png',
    ),
    OnboardingData(
      title: 'تامین تجهیز',
      description:
          'شرکت دانش‌بنیان مهندسی پیمان تحکیم خوزستان، با تأمین تجهیزات صنعتی پیشرفته، کارت شبکه سیستم اعلان حریق را با بالاترین استانداردهای جهانی عرضه می‌کند.',
      image: './assets/images/onboarding3.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return OnboardingPage(data: _pages[index]);
            },
          ),
          Positioned(
            top: 48,
            right: 24,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(),
                  ),
                );
              },
              child: Text(
                'رد کردن',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 24,
            right: 24,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: _currentPage == index ? 24 : 8,
                      decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(
                            _currentPage == index ? 1 : 0.3,
                          ),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    if (_currentPage > 0)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            _pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                          style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              side: BorderSide(color: AppTheme.primaryColor),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Text(
                            'برگشت',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    if (_currentPage > 0) const SizedBox(width: 16),
                    Expanded(
                      child: GradientButton(
                        text: _currentPage == _pages.length - 1
                            ? "بزن بریم"
                            : 'بعدی',
                        gradient: [
                          AppTheme.primaryColor,
                          AppTheme.primaryColor.withOpacity(0.8),
                        ],
                        onPressed: () {
                          if (_currentPage < _pages.length - 1) {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WelcomeScreen(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final String image;

  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;
  const OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            data.image,
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          SizedBox(height: 48),
          Text(
            data.title,
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
          SizedBox(height: 14),
          Text(
            data.description,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 12,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
