import 'package:flutter/material.dart';
import 'package:flutter_peymantahkim/theme/theme.dart';

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
      title: 'با ترس هایت روبرو شو',
      description:
          'با ما همراه شو و موفق شو، زندگی کن و بگذار بادهای بادها ازت عبور کنند، فقط به جلو نگاه کن و دنبال حاشیه نباش',
      image: './assets/images/onboarding1.jpg',
    ),
    OnboardingData(
      title: 'راه رسیدن به هدف',
      description:
          'همیشه یاد بگیر و به دنبال یادگیری باش، همیچکس جز خودت قرار نیست برای شما تا ابد بماند، خودت حال خوب خودت باش',
      image: './assets/images/onboarding2.jpg',
    ),
    OnboardingData(
      title: 'امانت دار خوبی باش',
      description:
          'خداوند در تمام زندگی تو را در امان نگه داشته و از تو مراقبت میکند، زندگی بالا پایین دارد ، مهم عملکرد تو در برابر پستی و بلندی هاست',
      image: './assets/images/onboarding3.jpg',
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
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            data.image,
            width: MediaQuery.of(context).size.width * 0.7,
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
